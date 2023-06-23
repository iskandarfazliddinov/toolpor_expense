import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/catigory_data.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/screens/cubits/my_cubit/my_cubit.dart';
import 'package:toolpor_expense/presentation/screens/cubits/my_cubit/user.dart';
import 'package:toolpor_expense/presentation/widgets/w_categories.dart';
import '../../widgets/w_detail_items.dart';

class DialogScreen extends StatefulWidget {
  final bool change;

  const DialogScreen({required this.change, super.key});

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
                keyboardType: TextInputType.number,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: updateCatigoryData,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: catigroyIndex == null ? 0 : 20.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: catigroyIndex != null && categoryData[catigroyIndex!].color != Colors.white? categoryData[catigroyIndex!].color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(44)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(catigroyIndex != null && categoryData[catigroyIndex!].color != Colors.white ? 8 : 0),
                                    child: catigroyIndex != null ? SvgPicture.asset(
                                      catigroyIndex == null
                                          ? ''
                                          : categoryData[catigroyIndex!].icon,
                                    ):const SizedBox(),
                                  ),
                                ),
                              ),
                              SizedBox(width: catigroyIndex == null ? 0 :12),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0),
                                child: Text(
                                  catigroyIndex == null
                                      ? 'Kategoriyani tanlang'
                                      : categoryData[catigroyIndex!].title,
                                  style: AppStyles.getItems(),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SvgPicture.asset(AppIcons.down),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              WDetailItems(
                subTitle: "",
                title: "${_dateTime.day}.${_dateTime.month}.${_dateTime.year}",
                appIcons: AppIcons.calendar,
                iconDow: AppIcons.down,
                onTab: () {
                  _showDataPicer();
                },
              ),
              Column(
               mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Sarlavha",
                  style: TextStyle(
                    color: Color(0xFFB2B3B7),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: titleController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Sarlavha",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFB2B3B7),
                  ),
                  filled: true,
                  fillColor: AppColors.mainColor,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Tavsif bering",
                      style: TextStyle(
                        color: Color(0xFFB2B3B7),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: descriptionController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: "Shu yerga yozing",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFB2B3B7),
                      ),
                      filled: true,
                      fillColor: AppColors.mainColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (catigroyIndex != null &&
                      controller.text != "" &&
                      descriptionController.text != "" &&
                      titleController.text != "") {
                    context.read<MyCubit>().addUser(
                          User(
                              calendar: _dateTime,
                              category: categoryData[catigroyIndex!].title,
                              description: descriptionController.text,
                              money: widget.change ? int.parse(controller.text):int.parse(controller.text)*(-1),
                              title: titleController.text,
                              icon: categoryData[catigroyIndex!].icon,
                              changes: widget.change,
                              color: categoryData[catigroyIndex!].color,
                          ),
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
