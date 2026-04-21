import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.validator,
  });
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: .end,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      obscureText: widget.obscureText && isPassword,
      decoration: InputDecoration(
        prefixIcon: widget.obscureText
            ? InkWell(
                onTap: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                child: isPassword
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 18, fontWeight: .bold),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
