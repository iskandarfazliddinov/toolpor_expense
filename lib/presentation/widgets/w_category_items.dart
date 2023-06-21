import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';

class WCategoryItems extends StatelessWidget {
  final String title;
  final String icon;
  final Color color;
  final GestureTapCallback onTab;
  const WCategoryItems({required this.title,required this.icon,required this.onTab,required this.color,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 20),
      child: GestureDetector(
        onTap: onTab,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(color == Colors.white ? 0 : 6),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(36),
              ),
                child: SvgPicture.asset(icon),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: AppStyles.getItems()
                  .copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
