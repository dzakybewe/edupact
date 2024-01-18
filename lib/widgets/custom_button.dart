import 'package:flutter/material.dart';

import '../common/styles.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final bool? isCancel;
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isCancel
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          backgroundColor: isCancel == true ? Colors.red : secondaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 18,

          ),
        ),
      ),
    );
  }
}