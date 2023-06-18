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
        height: 420,
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
                onTab: () {}),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF1CD8D2), // Start color (#1CD8D2)
                    Color(0xFF93EDC7), // End color (#93EDC7)
                  ],
                  stops: [0.0, 1.0],
                  // Adjust the stops as needed
                  transform:
                  GradientRotation(90), // Set the desired angle
                ),
              ),
              child: Center(
                child: Text(
                  "Kategoriya qo’shish",
                  style: AppStyles.getItems().copyWith(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
