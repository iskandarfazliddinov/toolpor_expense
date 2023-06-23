import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:toolpor_expense/presentation/catigory_data.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/screens/cubits/my_cubit/my_cubit.dart';
import 'package:toolpor_expense/presentation/screens/cubits/my_cubit/user.dart';
import 'package:toolpor_expense/presentation/widgets/w_categories.dart';
import 'package:toolpor_expense/presentation/widgets/w_detail_items.dart';
import 'package:toolpor_expense/presentation/widgets/w_edit_item.dart';

import '../../resources/app_icons.dart';

class EditItem extends StatefulWidget {
  final String title;
  final String categories;
  final DateTime date;
  final String description;
  final int money;
  final String icon;
  final int index;
  final bool changes;
  final Color color;

  const EditItem(
      {required this.title,
      required this.categories,
      required this.date,
      required this.description,
      required this.money,
      required this.icon,
      required this.index,
      required this.changes,
      required this.color,
      super.key,
      });

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  int? catigroyIndex;
  DateTime _dateTime = DateTime.now();
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController moneyController = TextEditingController();

  void updateCategoriesData() async {
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
  void initState() {
    controllerTitle.text = widget.title;
    controllerDescription.text = widget.description;
    moneyController.text = widget.money.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 28),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: moneyController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                WEditItem(
                  subTitle: "Sarlavha",
                  hintText: '',
                  maxLines: 1,
                  controllers: controllerTitle,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Kategoriya",
                        style: TextStyle(
                          color: Color(0xFFB2B3B7),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: updateCategoriesData,
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
                                  padding: const EdgeInsets.only(
                                      left: 20.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    padding: EdgeInsets.all((catigroyIndex == null && widget.color == Colors.white) || (catigroyIndex != null && categoryData[catigroyIndex!].color == Colors.white) ? 0 :8),
                                    decoration: BoxDecoration(
                                        color: catigroyIndex == null
                                            ? widget.color
                                            : categoryData[catigroyIndex!].color,
                                        borderRadius: BorderRadius.circular(44)
                                    ),
                                    child: SvgPicture.asset(
                                      catigroyIndex == null
                                          ? widget.icon
                                          : categoryData[catigroyIndex!].icon,
                                    ),
                                  ),
                                ),
                                const SizedBox(width:12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    catigroyIndex == null
                                        ? widget.categories
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
                  subTitle: "Sana",
                  title:
                      "${_dateTime.day}.${_dateTime.month}.${_dateTime.year}",
                  appIcons: AppIcons.calendar,
                  iconDow: AppIcons.down,
                  onTab: () {
                    _showDataPicer();
                  },
                ),
                WEditItem(
                  subTitle: "Tavsifi",
                  hintText: '',
                  maxLines: 1,
                  controllers: controllerDescription,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
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
            onTap: () {
              context.read<MyCubit>().editUser(
                    widget.index,
                    User(
                        category: catigroyIndex == null
                            ? widget.categories
                            : categoryData[catigroyIndex!].title,
                        calendar: _dateTime,
                        title: controllerTitle.text,
                        description: controllerDescription.text,
                        money: int.parse(moneyController.text),
                        icon: catigroyIndex == null
                            ? widget.icon
                            : categoryData[catigroyIndex!].icon,
                        changes: widget.changes,
                      color: categoryData[catigroyIndex!].color,
                    ),
                  );
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              AppIcons.birdie,
            ),
          ),
        ],
      );
}
