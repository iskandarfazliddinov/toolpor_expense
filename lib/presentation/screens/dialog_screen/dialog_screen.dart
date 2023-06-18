import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/widgets/w_categories.dart';
import 'package:toolpor_expense/presentation/widgets/w_dataPicer.dart';
import '../../widgets/w_detail_items.dart';
import '../../widgets/w_edit_item.dart';

class DialogScreen extends StatelessWidget {
  final bool change;

  const DialogScreen({required this.change, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height * 0.64,
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
              endIndent: 160,
              thickness: 2,
              indent: 160,
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: controller,
              style: TextStyle(
                color:
                    change ? const Color(0xFF93EDC7) : const Color(0xFFFE9A7B),
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
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return const WCategories();
                  },
                );
              },
            ),
            WDetailItems(
              subTitle: "",
              title: "18.02.2023",
              appIcons: AppIcons.calendar,
              iconDow: AppIcons.down,
              onTab: () {},
            ),
            WEditItem(
              subTitle: "Sarlavha",
              controllers: titleController,
              hintText: 'Sarlavha',
              maxLines: 1,
            ),
            WEditItem(
              subTitle: "Tavsif bering",
              controllers: descriptionController,
              hintText: 'Shu yerda yozing...',
              maxLines: 2,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: change
                      ? const Color(0xFF93EDC7)
                      : const Color(0xFFFE9A7B),
                  borderRadius: BorderRadius.circular(12)),
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
    );
  }
}
