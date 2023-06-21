import 'package:flutter/cupertino.dart';
import 'package:bookly/constant.dart';
import 'package:flutter/material.dart';

abstract class Styles{
  static const titleMedium= TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static Text LabradaText({Color color= Colors.white,required String text,required double size,FontWeight weight=FontWeight.bold,TextAlign? textAlign,int? maxLines}){
    return Text(
      text,
      maxLines: maxLines??2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          fontFamily: labradaFont,
          color: color,

      ),
      textAlign: textAlign?? TextAlign.start,
    );
  }
}