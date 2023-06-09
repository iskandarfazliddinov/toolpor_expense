import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/screens/cubits/my_cubit/my_cubit.dart';

import '../resources/app_styles.dart';

class WDialog extends StatelessWidget {
  final String text;
  final String dialogText;
  final Color dColor;
  final int index ;

  const WDialog({required this.text,required this.dialogText,required this.dColor,required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 170,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.getItems().copyWith(fontSize: 18),
            ),
            const SizedBox(height: 36.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Orqaga",
                      style: AppStyles.getItems().copyWith(
                        color: const Color(0xFFB2B3B7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: (){
                    if(index != -1){
                      context.read<MyCubit>().deleteUser(index);
                    }
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: dColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20.0),
                      child: Text(
                        dialogText,
                        style: AppStyles.getItems(),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
