import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/catigory_data.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/screens/cubits/my_cubit/my_cubit.dart';
import 'package:toolpor_expense/presentation/screens/cubits/my_cubit/user.dart';
import 'package:toolpor_expense/presentation/screens/home_screen/home_screen.dart';
import 'package:toolpor_expense/presentation/screens/income_screen/income_screen.dart';
import 'package:toolpor_expense/presentation/widgets/w_categories.dart';
import 'package:toolpor_expense/presentation/widgets/w_dataPicer.dart';
import '../../widgets/w_detail_items.dart';
import '../../widgets/w_edit_item.dart';

class DialogScreen extends StatefulWidget {
  final bool change;

  DialogScreen({required this.change, super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  int? catigroyIndex;
  DateTime _dateTime = DateTime.now();
  TextEditingController controller = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void updateCatigoryData() async {
    var a = await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return const WCategories();
      },
    );
    setState(() {
      catigroyIndex = a;
    });
  }

  void _showDataPicer() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) => {
          setState(() {
              _dateTime = value!;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.62,
      decoration: const BoxDecoration(
        color: Color(0xFF292B2F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
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
                  color: widget.change
                      ? const Color(0xFF93EDC7)
                      : const Color(0xFFFE9A7B),
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
                  title: catigroyIndex == null
                      ? 'Kategoriyani tanlang'
                      : categoryData[catigroyIndex!].title,
                  appIcons: catigroyIndex == null
                      ? ''
                      : categoryData[catigroyIndex!].icon,
                  iconDow: AppIcons.down,
                  onTab: updateCatigoryData),
              WDetailItems(
                subTitle: "",
                title: "${_dateTime.day}.${_dateTime.month}.${_dateTime.year}",
                appIcons: AppIcons.calendar,
                iconDow: AppIcons.down,
                onTab: () {
                  _showDataPicer();
                },
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
              GestureDetector(
                onTap: () {
                  if (catigroyIndex != null &&
                      controller.text != "" &&
                      descriptionController.text != "" &&
                      titleController.text != "") {
                    context.read<MyCubit>().addUser(
                          User(
                              calendar: "${_dateTime.day}.${_dateTime.month}.${_dateTime.year}",
                              category: categoryData[catigroyIndex!].title,
                              description: descriptionController.text,
                              money: controller.text,
                              title: titleController.text,
                              icon: categoryData[catigroyIndex!].icon),
                        );
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: widget.change
                          ? const Color(0xFF93EDC7)
                          : const Color(0xFFFE9A7B),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "Ro’yxatga qo’shish",
                      style: AppStyles.getItems().copyWith(color: Colors.black),
                    ),
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
