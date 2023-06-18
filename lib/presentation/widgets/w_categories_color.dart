import 'package:flutter/material.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';

import 'w_detail_items.dart';
import 'w_edit_item.dart';

class WCategoriesColor extends StatelessWidget {
  final TextEditingController controllers ;

  const WCategoriesColor({required this.controllers,super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 400,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Kategoriya",
              style: AppStyles.getItems(),
            ),
            WEditItem(
                subTitle: 'Sarlavha',
                controllers: controllers,
                hintText: "Sarlavha",
                maxLines: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment
                  .start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Rang tanlang",
                    style: TextStyle(
                      color: Color(0xFFB2B3B7),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius:
                      BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        7,
                            (index) =>
                            Container(
                              margin:
                              const EdgeInsets.only(
                                  left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                  BorderRadius.circular(
                                      28)),
                              height: 32,
                              width: 32,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            WDetailItems(
                subTitle: '',
                title: 'Belgini tanlang',
                appIcons: '',
                iconDow: AppIcons.down,
                onTab: () {})
          ],
        ),
      ),
    );
  }
}
