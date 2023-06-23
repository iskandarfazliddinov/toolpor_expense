import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toolpor_expense/presentation/catigory_data.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';

class WItems extends StatelessWidget {
  final GestureTapCallback onTab;
  final BuildContext contexts;
  final String title;
  final DateTime calendar;
  final int money;
  final String icon;
  final bool changes;
  final Color color;
  final SlidableActionCallback onPresDel;
  final SlidableActionCallback onPresEdit;

  const WItems({
    required this.onTab,
    required this.contexts,
    required this.title,
    required this.calendar,
    required this.money,
    required this.icon,
    required this.changes,
    required this.onPresDel,
    required this.onPresEdit,
    required this.color,
    super.key,
  });

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
            onPressed: onPresDel,
          ),
          SlidableAction(
            backgroundColor: AppColors.mainColor,
            label: 'Edit',
            icon: Icons.edit,
            onPressed: onPresEdit,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.itemColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: color ?? Colors.yellow,
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: EdgeInsets.all(color == Colors.white ? 0 :8.0),
                        child: SvgPicture.asset(icon),
                      )),
                  const SizedBox(width: 12.0),
                  RichText(
                    text: TextSpan(
                      text: "$title\n",
                      style: AppStyles.getItems(),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                "${calendar.day}.${calendar.month}.${calendar.year}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFB2B3B7),
                                fontSize: 12.0))
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                changes ? "+$money s." : "-${money * (-1)} s.",
                style: TextStyle(
                  fontSize: 14.0,
                  color: changes ? const Color(0xFF93EDC7) : Colors.redAccent,
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
