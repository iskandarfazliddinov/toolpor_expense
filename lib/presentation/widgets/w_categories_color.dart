import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:toolpor_expense/presentation/catigory_data.dart';
import 'package:toolpor_expense/presentation/provider/ColorData.dart';
import 'package:toolpor_expense/presentation/provider/ColorNotifier.dart';
import 'package:toolpor_expense/presentation/provider/MyDataNotifier.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/screens/cubits/categories_cubit/categories_cubit.dart';
import 'package:toolpor_expense/presentation/screens/cubits/categories_cubit/category.dart';

import '../provider/MyData.dart';
import '../screens/dialog_screen/dialog_screen.dart';
import 'w_detail_items.dart';
import 'w_edit_item.dart';

class WCategoriesColor extends StatelessWidget {
  const WCategoriesColor({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllers = TextEditingController();
    TextEditingController controllersTitle = TextEditingController();
    int _index = -1;
    int indexColor = -1;

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
              hintText: "Sarlavha",
              maxLines: 1,
              controllers: controllersTitle,
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
                        (listIndex) => Consumer<ColorNotifier>(
                          builder: (context, myDataNotifier, _) {
                            final myData = myDataNotifier.myData;
                            // Use myData in your widget
                            return GestureDetector(
                              onTap: () {
                                myDataNotifier
                                    .updateData(ColorData(index: listIndex));
                                indexColor = listIndex;
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white,
                                      width: indexColor == listIndex ? 3 : 0),
                                  color: colors[listIndex],
                                  borderRadius: BorderRadius.circular(
                                    28,
                                  ),
                                ),
                                height: 32,
                                width: 32,
                                child: indexColor == listIndex
                                    ? SvgPicture.asset(AppIcons.birdie)
                                    : const SizedBox(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Consumer<MyDataNotifier>(
              builder: (context, myDataNotifier, _) {
                final myData = myDataNotifier.myData;
                // Use myData in your widget
                return WDetailItems(
                  subTitle: '',
                  title: myData.title,
                  appIcons: myData.icon,
                  iconDow: AppIcons.down,
                  onTab: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
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
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _index = index;
                                              });
                                            },
                                            child: Container(
                                              width: 48,
                                              height: 48,
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: _index == index
                                                      ? const Color(0xFF93EDC7)
                                                      : AppColors
                                                          .backgroundColor,
                                                  // Set the border color here
                                                  width:
                                                      2, // Set the border width
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(36),
                                              ),
                                              child: SvgPicture.asset(
                                                icons[index],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      myDataNotifier.updateData(
                                        MyData(
                                          icon: icons[_index],
                                          title: '',
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xFF1CD8D2),
                                            // Start color (#1CD8D2)
                                            Color(0xFF93EDC7),
                                            // End color (#93EDC7)
                                          ],
                                          stops: [0.0, 1.0],
                                          // Adjust the stops as needed
                                          transform: GradientRotation(
                                              90), // Set the desired angle
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Belgi tanlash",
                                          style: AppStyles.getItems()
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
            GestureDetector(
              onTap: () {
                if (_index != -1 &&
                    controllersTitle.text.isNotEmpty &&
                    indexColor != -1) {
                  CategoryData item = CategoryData(
                    title: controllersTitle.text,
                    icon: icons[_index],
                    color: colors[indexColor],
                  );
                  print("item: $item");
                  context.read<CategoriesCubit>().addUser(item);
                  categoryData.removeLast();
                  categoryData.add(item);
                  categoryData.add(
                    CategoryData(
                        icon: "assets/icons_ellips/08.svg",
                        title: "Yangi kategoriya qo'shish",
                        color: Colors.white),
                  );
                }
                _index = -1;
                indexColor = -1;
                Navigator.of(context).pop();
              },
              child: Container(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
