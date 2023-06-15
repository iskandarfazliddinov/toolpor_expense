import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';

class WDetailItems extends StatelessWidget {
  final String subTitle;
  final String title;
  final String appIcons;
  final String iconDow;
  final GestureTapCallback onTab;

  const WDetailItems({
    required this.subTitle,
    required this.title,
    required this.appIcons,
    required this.iconDow,
    required this.onTab,
    super.key,
  });

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
        GestureDetector(
          onTap: onTab,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: appIcons == '' ? 0 : 20.0),
                      child: SvgPicture.asset(appIcons),
                    ),
                    const SizedBox(width: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: appIcons == '' ? 20 : 0),
                      child: Text(title,style: AppStyles.getItems(),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(iconDow)
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
