import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/screens/item_detail/item_detail.dart';
import 'package:toolpor_expense/presentation/widgets/w_calendar.dart';
import 'package:toolpor_expense/presentation/widgets/w_dialog.dart';
import 'package:toolpor_expense/presentation/widgets/w_items.dart';
import 'package:toolpor_expense/presentation/widgets/w_lineChart.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  DateTime _dateTimeOld = DateTime.now();
  DateTime _dateTimeEnd = DateTime.now();

  void _showDataPicer({required bool check}) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) => {
          setState(() {
            if (check) {
              _dateTimeOld = value!;
            } else {
              _dateTimeEnd = value!;
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WCalendar(
                      data:
                          "${_dateTimeOld.day}.${_dateTimeOld.month}.${_dateTimeOld.year}",
                      onTab: () {
                        _showDataPicer(check: true);
                      }),
                  WCalendar(
                      data:
                          "${_dateTimeEnd.day}.${_dateTimeEnd.month}.${_dateTimeEnd.year}",
                      onTab: () {
                        _showDataPicer(check: false);
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 28.0),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Statistika",
                            style: AppStyles.getItems(),
                          ),
                          const Text(
                            "+5 250 000 so’m",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF93EDC7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 400,
                      width: 400,
                      child: WLineChart() ,
                    )
                  ],
                ),
              ),
            ),
            _getItems()
          ],
        ),
      ),
    );
  }

  _getAppBar() => AppBar(
        title: const Center(
          child: Text(
            "Daromadlar",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.arrowLeft),
          onPressed: () {},
        ),
        actions: <Widget>[
          GestureDetector(
            child: SvgPicture.asset(
              AppIcons.export,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext contexts) {
                  return const WDialog(
                    text: 'Ma’lumotlarni export qilishni\nxohlaysizmi?',
                    dialogText: 'Export qilish',
                    dColor: Color(0xFF93EDC7),
                  );
                },
              );
            },
          ),
          const SizedBox(
            width: 20,
          )
        ],
        backgroundColor: AppColors.backgroundColor,
      );

  _getItems() => Container(
        decoration: const BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Divider(
                  color: Color(0xFFB2B3B7),
                  endIndent: 180,
                  thickness: 2,
                  indent: 180),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Oxirgi xarajatlar",
                style: AppStyles.getItems(),
              ),
            ),
            ...List.generate(
              10,
              (index) => WItems(
                onTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemDetail(),
                    ),
                  );
                },
                contexts: context,
              ),
            )
          ],
        ),
      );
}
