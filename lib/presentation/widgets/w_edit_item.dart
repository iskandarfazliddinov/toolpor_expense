import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';

class WEditItem extends StatelessWidget {
  final String subTitle;
  final  TextEditingController controllers;
  final String hintText;
  final int maxLines;

  const WEditItem({required this.subTitle,required this.controllers,required this.hintText,required this.maxLines,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            subTitle,
            style: const TextStyle(
              color: Color(0xFFB2B3B7),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white),
          controller: controllers,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFFB2B3B7),),
            filled: true,
            fillColor: AppColors.mainColor,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)
            ),
          ),
        ),
      ],
    );
  }
}
