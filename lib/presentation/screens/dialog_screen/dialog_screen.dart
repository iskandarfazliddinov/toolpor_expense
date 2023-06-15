import 'package:flutter/material.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import '../../widgets/w_detail_items.dart';
import '../../widgets/w_edit_item.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: "0");
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 590,
        decoration: const BoxDecoration(
          color: Color(0xFF292B2F),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Divider(
                color: Colors.white,
                endIndent: 120,
                thickness: 2,
                indent: 120,
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
              const Text(
                "Summani kiriting",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFB2B3B7),
                ),
              ),
              WDetailItems(
                subTitle: '',
                title: 'Kategoriyani tanlang',
                appIcons: '',
                iconDow: AppIcons.down,
                onTab: () {

                },
              ),
              WDetailItems(
                subTitle: "",
                title: "18.02.2023",
                appIcons: AppIcons.calendar,
                iconDow: AppIcons.down,
                onTab: () {
                },
              ),
              WEditItem(subTitle: "Sarlavha", controllers: titleController, hintText: 'Sarlavha', maxLines: 1,),
              WEditItem(subTitle: "Tavsif bering", controllers: descriptionController, hintText: 'Shu yerda yozing...', maxLines: 4,),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 24),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF828282),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Text(
                    "Ro’yxatga qo’shish",
                    style: AppStyles.getItems().copyWith(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

