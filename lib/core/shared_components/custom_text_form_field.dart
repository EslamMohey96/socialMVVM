// textFormField
import 'package:flutter/material.dart';

Widget textFormField({
  var context,
  required TextEditingController controller,
  required TextInputType textInputType,
  String? labelText,
  required Widget prefixIcon,
  required String? Function(String?)? valid,
  bool visible = false,
  bool isClickable = true,
  Widget? suffixIcon,
  Function()? suffixPressed,
  Function(String?)? onSubmit,
  Function(String?)? onChange,
  Function()? onTap,
  String? hintText,
}) =>
    TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: textInputType,
      obscureText: visible,
      onFieldSubmitted: onSubmit,
      // onChanged: onChange,
      validator: valid,
      onTap: onTap,
      onChanged: onChange,

      enabled: isClickable,
      cursorColor: Colors.white,
      style: const TextStyle(
        color:
            Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle:const TextStyle(
          fontSize: 15,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: suffixIcon ?? const Icon(Icons.person),
          onPressed: suffixPressed,
        ),
        enabledBorder:const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: const OutlineInputBorder(),
      ),
    );
