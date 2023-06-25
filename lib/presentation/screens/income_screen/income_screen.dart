import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/screens/cubits/my_cubit/my_cubit.dart';
import 'package:toolpor_expense/presentation/screens/edit_item/edit_item.dart';
import 'package:toolpor_expense/presentation/screens/item_detail/item_detail.dart';
import 'package:toolpor_expense/presentation/widgets/w_calendar.dart';
import 'package:toolpor_expense/presentation/widgets/w_dialog.dart';
import 'package:toolpor_expense/presentation/widgets/w_items.dart';
import 'package:toolpor_expense/presentation/widgets/w_lineChart.dart';

class IncomeScreen extends StatefulWidget {
  final bool boolType;

  const IncomeScreen({required this.boolType,super.key});

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
                    BlocBuilder<MyCubit, MyState>(
                      builder: (context, state) {
                        if (state is UsersLoaded) {
                          double totalCosts = 0;
                          for (var index = 0; index < state.users.length; index++) {
                            if(widget.boolType){
                              if(state.users[index].money>0){
                                totalCosts += state.users[index].money;
                              }
                            }else if(state.users[index].money<0){
                              totalCosts += state.users[index].money;
                            }

                          }
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Statistika",
                                      style: AppStyles.getItems(),
                                    ),
                                    Text(
                                      "$totalCosts so’m",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: totalCosts > 0
                                            ? const Color(0xFF93EDC7)
                                            : const Color(0xFFFE9A7B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    BlocBuilder<MyCubit, MyState>(
                      builder: (context, state) {
                        if (state is UsersLoaded) {
                          List<FlSpot> flSpot = [];
                          flSpot.clear();
                          var j = 1 , k = 1;
                          flSpot.add(const FlSpot(0.0, 0.0));
                          for(var i=0 ; i< state.users.length ; i++){
                            if(widget.boolType){
                              if(state.users[i].money>0){
                                flSpot.add(FlSpot(j.toDouble(), state.users[i].money.toDouble()));
                                j++;
                              }
                            }else if(state.users[i].money<0){
                              flSpot.add(FlSpot(k.toDouble(), state.users[i].money.toDouble()*(-1)));
                              k++;
                            }
                          }
                          return  Container(
                            height: 350,
                            width: 400,
                            padding: const EdgeInsets.only(bottom: 12),
                            child: WLineChart(
                              lineChartBarData: LineChartBarData(
                                spots: flSpot,
                                isCurved: true,
                                barWidth: 3,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                ),
                              ), change: widget.boolType,
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  BlocBuilder<MyCubit, MyState>(
                    builder: (context, state) {
                      if (state is UsersLoaded) {
                        return Column(
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
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.users.length,
                              itemBuilder: (context, index) => WItems(
                                  onTab: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ItemDetail(
                                          title: state.users[index].title,
                                          categories: state.users[index].category,
                                          data: state.users[index].calendar,
                                          description:
                                              state.users[index].description,
                                          money: state.users[index].money,
                                          icons: state.users[index].icon,
                                          color: state.users[index].color,
                                        ),
                                      ),
                                    );
                                  },
                                  contexts: context,
                                  title: state.users[index].title,
                                  calendar: state.users[index].calendar,
                                  money: state.users[index].money,
                                  icon: state.users[index].icon,
                                  changes: state.users[index].changes,
                                  onPresDel: (BuildContext context) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext contexts) {
                                        return WDialog(
                                          text:
                                              'Haqiqatan ham bu elementni\no’chirib tashlamoqchimisiz?',
                                          dialogText: 'O’chirish',
                                          dColor: const Color(0xFFCC2D63),
                                          index: index,
                                        );
                                      },
                                    );
                                  },
                                  onPresEdit: (BuildContext context) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditItem(
                                          title: state.users[index].title,
                                          categories: state.users[index].category,
                                          date: state.users[index].calendar,
                                          description:
                                              state.users[index].description,
                                          money: state.users[index].money,
                                          icon: state.users[index].icon,
                                          index: index,
                                          changes: state.users[index].changes, color: state.users[index].color,
                                        ),
                                      ),
                                    );
                                  },
                                  color: state.users[index].color,
                              ),
                            ),
                            const SizedBox(height: 24,)
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getAppBar() => AppBar(
        title:  Center(
          child: Text(
            widget.boolType ? "Daromadlar":"Xarajatlar",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.arrowLeft),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
                    index: -1,
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
}
