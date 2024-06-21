import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/utils/size_config.dart';
import '../ui/utils/theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle(context),
          ),
          Container(
            padding: const EdgeInsets.only(left: 14),
            margin: const EdgeInsets.only(top: 8),
            width: SizeConfig.screenWidth,
            height: 62,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                // color: primaryClr,
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    autofocus: false,
                    cursorColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[200]
                        : Colors.grey[700],
                    readOnly: widget != null ? true : false,
                    style: subTitleStyle(context),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle(context),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 0,
                              color: context.theme.colorScheme.surface)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 0,
                              color: context.theme.colorScheme.surface)),
                    ),
                  ),
                ),
                widget ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
