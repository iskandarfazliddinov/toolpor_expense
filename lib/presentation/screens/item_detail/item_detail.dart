import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/widgets/w_detail_items.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({super.key});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
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
              _getAppBar(),
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
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 28),
                    child: Text(
                      "+596 000 so’m",
                      style: TextStyle(
                        color: Color(0xFF121418),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const WDetailItems(subTitle: 'Sarlavha', title: 'Bozorlik', appIcons: '', iconDow: "",),
              const WDetailItems(subTitle: 'Kategoriya', title: 'Bozorlik', appIcons: AppIcons.apple_elips, iconDow: '',),
              const WDetailItems(subTitle: 'Kategoriya', title: 'Bozorlik', appIcons: AppIcons.calendar, iconDow: '',),
              const WDetailItems(subTitle: 'Tavsifi', title: 'Bolamni tug’ilgan kuniga bozorlik\nqilgandik.', appIcons: '', iconDow: '',),
            ],
          ),
        ),
      ),
    );
  }

  _getAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
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
