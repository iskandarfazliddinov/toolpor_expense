import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/widgets/w_detail_items.dart';

class ItemDetail extends StatelessWidget {
  final String title;
  final String categories;
  final DateTime data;
  final String description;
  final int money;
  final String icons;
  final Color color;

  const ItemDetail({
    required this.title,
    required this.categories,
    required this.data,
    required this.description,
    required this.money,
    required this.icons,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getAppBar(context),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 28.0),
                  decoration: BoxDecoration(
                    color:money > 0 ?  const Color(0xFF93EDC7): const Color(0xFFFE9A7B),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 28),
                    child: Text(
                      money>0 ?"+$money so’m" : "$money so’m",
                      style: const TextStyle(
                        color: Color(0xFF121418),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              WDetailItems(
                subTitle: 'Sarlavha',
                title: title,
                appIcons: '',
                iconDow: "",
                onTab: () {},
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Kategoriya",
                      style: TextStyle(
                        color: Color(0xFFB2B3B7),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
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
                              padding: const EdgeInsets.only(
                                  left: 20.0),
                              child: Container(
                                padding:  EdgeInsets.all(color == Colors.white ? 0 : 8),
                                width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: color ?? Colors.white
                                  ),
                                  child: SvgPicture.asset(icons),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0),
                              child: Text(
                                categories,
                                style: AppStyles.getItems().copyWith(
                                  color: const Color(0xFFB2B3B7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              WDetailItems(
                subTitle: 'Sana',
                title: "${data.day}.${data.month}.${data.year}",
                appIcons: AppIcons.calendar,
                iconDow: '',
                onTab: () {},
              ),
              WDetailItems(
                subTitle: 'Tavsifi',
                title: description,
                appIcons: '',
                iconDow: '',
                onTab: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getAppBar(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              AppIcons.arrowLeft,
              width: 24,
              height: 24,
            ),
          ),
          Text(
            "Ma’lumot",
            style: AppStyles.getItems(),
          ),
          const SizedBox()
        ],
      );
}
