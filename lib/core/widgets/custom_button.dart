import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.color,required this.textColor, this.radius,required this.text, required this.onPressed,}) : super(key: key);
  final color,textColor,text;
  final BorderRadius? radius ;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Styles.LabradaText(text: text, size: 20, weight: FontWeight.w900,color: textColor),
          ),
          style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: radius?? BorderRadius.circular(12)
            ),
          ),
      ),
    );
  }
}
