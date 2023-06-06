import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';

class WItems extends StatelessWidget {
  final GestureTapCallback onTab;
  const WItems({required this.onTab,super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: AppColors.mainColor,
            icon: Icons.delete,
            label: 'Delete',
            onPressed: (BuildContext context) {},
          ),
          SlidableAction(
            backgroundColor: AppColors.mainColor,
            label: 'Edit',
            icon: Icons.edit,
            onPressed: (BuildContext context) {},
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
          decoration:  BoxDecoration(color: AppColors.itemColor,borderRadius: BorderRadius.circular(12.0),),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(AppIcons.apple),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  RichText(
                    text: TextSpan(
                      text: "Bozorlik\n",
                      style: AppStyles.getItems(),
                      children: const <TextSpan>[
                        TextSpan(
                            text: "12.02.2023",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFB2B3B7),
                                fontSize: 12.0))
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                "+596 000 s.",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF93EDC7),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
