import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';

class WCategoryItems extends StatelessWidget {
  final String title;
  final String icon;

  const WCategoryItems({required this.title,required this.icon,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 20),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 12),
          Text(
            title,
            style: AppStyles.getItems()
                .copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
