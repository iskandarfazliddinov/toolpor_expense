import 'package:flutter/material.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';

class WCalendar extends StatelessWidget {
  final String data;
  final GestureTapCallback onTab;
  const WCalendar({
    required this.data,
    required this.onTab,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: Colors.white,
                weight: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                data,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
