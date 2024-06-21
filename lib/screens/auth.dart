import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:io';

import '../../generated/l10n.dart';
import '../widgets/User_image.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredUsername = '';
  var _enteredPassword = '';
  File? _selectedImage;
  var _isUploading = false;

  void _submit() async {
    final valid = _formKey.currentState!.validate();
    if (!valid || (!_isLogin && _selectedImage == null)) {
      return;
    }
    _formKey.currentState!.save();
    try {
      setState(() {
        _isUploading = true;
      });
      if (_isLogin) {
        final _userCredential = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      } else {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        final Reference storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userCredential.user!.uid}.jpg');
        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();
        log(imageUrl);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': _enteredUsername,
          'email': _enteredEmail,
          'image_url': imageUrl,
        });
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Authentication Failed'),
        ),
      );
      setState(() {
        _isUploading = false;
      });
    }

    log(_enteredEmail);
    log(_enteredPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 30,
                right: 20,
                left: 20,
              ),
              width: 200,
              child: Image.asset('assets/images/result.png'),
            ),
            Card(
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (!_isLogin)
                          UserImagePicker(
                            onPickImage: (pickedImage) {
                              _selectedImage = pickedImage;
                            },
                          ),
                        TextFormField(
                          decoration:
                          InputDecoration(labelText: S.of(context).Email_Address),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          onSaved: (value) => _enteredEmail = value!,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return S.of(context)
                                  .please_enter_a_valid_email_address;
                            }
                            return null;
                          },
                        ),
                        if (!_isLogin)
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: S.of(context).Username),
                            onSaved: (value) => _enteredUsername = value!,
                            validator: (value) {
                              if (value == null || value.trim().length < 4) {
                                return S.of(context)
                                    .please_enter_at_least_4_characters;
                              }
                              return null;
                            },
                          ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: S.of(context).Password,
                          ),
                          obscureText: true,
                          onSaved: (value) => _enteredPassword = value!,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return S.of(context)
                                  .password_must_be_at_least_6_characters_long;
                            }
                            return null;
                          },
                        ),
                      /*  Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context
                               // MaterialPageRoute(
                                   // builder: (context) => const ForgotPass()),
                              );
                            },
                            child: const Text("Forgot Password"),
                          ),
                        ),*/
                        const SizedBox(height: 50),
                        const SizedBox(height: 12),
                        if (_isUploading)
                          const CircularProgressIndicator(),
                        if (!_isUploading)
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: Text(
                                _isLogin ? S.of(context).Login : S.of(context).Signup),
                          ),
                        if (!_isUploading)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin
                                ? S.of(context).Create_an_Account
                                : S.of(context).I_already_have_an_account),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
