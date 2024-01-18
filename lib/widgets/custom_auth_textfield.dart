import 'package:flutter/material.dart';

class CustomAuthTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  const CustomAuthTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isPassword
  });

  @override
  State<CustomAuthTextField> createState() => _CustomAuthTextFieldState();
}

class _CustomAuthTextFieldState extends State<CustomAuthTextField> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = widget.isPassword;
    super.initState();
  }
  void _obscureText(){
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: Material(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: widget.isPassword ? IconButton(
              onPressed: _obscureText,
              icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            ) : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            hintText: 'Enter your ${widget.hintText}',
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}