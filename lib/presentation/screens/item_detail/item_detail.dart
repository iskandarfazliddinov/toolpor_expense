import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/widgets/w_detail_items.dart';

class ItemDetail extends StatelessWidget {
  final String title;
  final String categories;
  final String data;
  final String description;
  final String money;

  const ItemDetail(
      {required this.title,
      required this.categories,
      required this.data,
      required this.description,
      required this.money,
      super.key});

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
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF1CD8D2),
                        Color(0xFF93EDC7),
                      ],
                      stops: [
                        -0.1504,
                        1.1504,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      transform: GradientRotation(90 * 3.14159 / 180),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 28),
                    child: Text(
                      "$money so’m",
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
              WDetailItems(
                subTitle: 'Kategoriya',
                title: categories,
                appIcons: AppIcons.apple_elips,
                iconDow: '',
                onTab: () {},
              ),
              WDetailItems(
                subTitle: 'Sana',
                title: data,
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
