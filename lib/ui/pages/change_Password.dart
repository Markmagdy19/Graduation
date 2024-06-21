import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  changePassword({required String email, required String oldPassword, required String newPassword}) async {
    var cred = EmailAuthProvider.credential(email: email, password: oldPassword);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
   //   auth.signOut();
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: oldPasswordController,
              decoration: const InputDecoration(
               // isDense: true,
                labelText: "Old Password",
                hintText: "***********",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: newPasswordController,
              decoration: const InputDecoration(
                //isDense: true,
                labelText: "New Password",
                hintText: "***********",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (currentUser != null) {
                  await changePassword(
                    email: currentUser!.email!,
                    oldPassword: oldPasswordController.text,
                    newPassword: newPasswordController.text,

                     // Navigate back to the previous page

                  );
                  print("Password Changed");
                  Navigator.pop(context);
                }
              },
              child: const Text("Change Password"),
            ),
          ],
        ),

    );
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
}



