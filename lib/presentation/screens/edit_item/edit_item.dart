import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/widgets/w_detail_items.dart';
import 'package:toolpor_expense/presentation/widgets/w_edit_item.dart';

import '../../resources/app_icons.dart';

class EditItem extends StatefulWidget {
  const EditItem({super.key});

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  TextEditingController titleController = TextEditingController(text: "Bozorlik");
  TextEditingController descriptionController = TextEditingController(text: "Bolamni tug’ilgan kuniga bozorlik qilgandik.");


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
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 28),
                    child: Text(
                      "+596 000 so’m",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              WEditItem(subTitle: "Sarlavha", controllers: titleController),
              const WDetailItems(subTitle: "Kategoriya", title: "Bozorlik", appIcons: AppIcons.apple_elips, iconDow: AppIcons.down,),
              const WDetailItems(subTitle: "Sana", title: "18.02.2023", appIcons: AppIcons.calendar, iconDow: AppIcons.down,),
              WEditItem(subTitle: "Tavsifi", controllers: descriptionController),
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
        "Tahrirlash",
        style: AppStyles.getItems(),
      ),
      GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          AppIcons.birdie,
        ),
      ),
    ],
  );
}