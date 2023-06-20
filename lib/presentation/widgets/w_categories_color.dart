import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';

import '../screens/dialog_screen/dialog_screen.dart';
import 'w_detail_items.dart';
import 'w_edit_item.dart';

class WCategoriesColor extends StatelessWidget {
  final TextEditingController controllers;

  const WCategoriesColor({required this.controllers, super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      const Color(0xFF76D87E),
      const Color(0xFFE2BF5A),
      const Color(0xFFFFC680),
      const Color(0xFFFFC1BA),
      const Color(0xFFFFBEDD),
      const Color(0xFFE2C5FF),
      const Color(0xFFA5D6FF),
    ];
    List<String> icons = [
      "assets/icons_categories/1.svg",
      "assets/icons_categories/2.svg",
      "assets/icons_categories/3.svg",
      "assets/icons_categories/4.svg",
      "assets/icons_categories/5.svg",
      "assets/icons_categories/6.svg",
      "assets/icons_categories/7.svg",
      "assets/icons_categories/8.svg",
      "assets/icons_categories/9.svg",
      "assets/icons_categories/10.svg",
      "assets/icons_categories/11.svg",
      "assets/icons_categories/12.svg",
      "assets/icons_categories/13.svg",
      "assets/icons_categories/14.svg",
      "assets/icons_categories/15.svg",
      "assets/icons_categories/16.svg",
      "assets/icons_categories/17.svg",
      "assets/icons_categories/18.svg",
      "assets/icons_categories/19.svg",
      "assets/icons_categories/20.svg",
      "assets/icons_categories/21.svg",
      "assets/icons_categories/22.svg",
      "assets/icons_categories/23.svg",
      "assets/icons_categories/24.svg",
      "assets/icons_categories/25.svg",
      "assets/icons_categories/26.svg",
      "assets/icons_categories/27.svg",
      "assets/icons_categories/28.svg",
      "assets/icons_categories/29.svg",
      "assets/icons_categories/30.svg",
      "assets/icons_categories/31.svg",
      "assets/icons_categories/32.svg",
      "assets/icons_categories/33.svg",
      "assets/icons_categories/34.svg",
      "assets/icons_categories/35.svg",
    ];

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
                maxLines: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        7,
                        (index) => Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.circular(
                              28,
                            ),
                          ),
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
              onTab: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.white,
                            endIndent: 170,
                            thickness: 2,
                            indent: 170,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 380,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    5, // Number of columns in the grid
                              ),
                              itemCount: icons.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: SvgPicture.asset(
                                    icons[index],
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
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
                                transform: GradientRotation(90), // Set the desired angle
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Belgi tanlash",
                                style: AppStyles.getItems().copyWith(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
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
                  transform: GradientRotation(90), // Set the desired angle
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
