import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toolpor_expense/presentation/resources/app_colors.dart';
import 'package:toolpor_expense/presentation/resources/app_icons.dart';
import 'package:toolpor_expense/presentation/resources/app_styles.dart';
import 'package:toolpor_expense/presentation/screens/cubits/my_cubit/my_cubit.dart';
import 'package:toolpor_expense/presentation/screens/dialog_screen/dialog_screen.dart';
import 'package:toolpor_expense/presentation/screens/income_screen/income_screen.dart';
import 'package:toolpor_expense/presentation/widgets/w_diogramma.dart';
import 'package:menu_button/menu_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {
  String selectedKey = "Xarajat";

  List<String> keys = <String>[
    'Xarajat',
    'Daromad',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_left,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Fevral",
                          style: AppStyles.getItems().copyWith(fontSize: 20),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SvgPicture.asset(AppIcons.bell),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hisobot",
                          style: AppStyles.getItems(),
                        ),
                        MenuButton<String>(
                          items: keys,
                          itemBuilder: (String value) => Container(
                            decoration: const BoxDecoration(color: AppColors.mainColor),
                            height: 40,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
                            child: Text(value),
                          ),
                          toggledChild: Container(
                            decoration: const BoxDecoration(
                                color: AppColors.mainColor
                            ),
                            width: 93,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 11),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(selectedKey, overflow: TextOverflow.ellipsis)
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: AppColors.mainColor
                                    ),
                                    width: 12,
                                    height: 17,
                                    child: const FittedBox(
                                      fit: BoxFit.fill,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onItemSelected: (String value) {
                            setState(() {
                              selectedKey = value;
                            });
                          },
                          onMenuButtonToggle: (bool isToggle) {
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: AppColors.mainColor
                            ),
                            width: 93,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 11),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                      child: Text(selectedKey, overflow: TextOverflow.ellipsis)
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: AppColors.mainColor
                                    ),
                                    width: 12,
                                    height: 17,
                                    child: const FittedBox(
                                      fit: BoxFit.fill,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<MyCubit, MyState>(
                    builder: (context, state) {
                      if (state is UsersLoaded) {
                        double totalCosts = 0;
                        double expenses = 0;
                        double revenues = 0;
                        double expensesAll = 0;
                        double revenuesAll = 0;

                          for (var index = 0; index < state.users.length; index++) {
                            if(state.users[index].money <0){
                              expenses += state.users[index].money;
                            }else{
                              revenues += state.users[index].money;
                            }
                          }
                          expenses = expenses *(-1);
                          expensesAll = expenses;
                          revenuesAll = revenues;
                          totalCosts = (expenses+revenues);
                          expenses = expenses*100/totalCosts;
                          revenues = revenues*100/totalCosts;

                        return SizedBox(
                          height: 300,
                          child: CircularChart(
                            expenses: expenses,
                            revenues: revenues,
                            totalCosts: selectedKey == "Xarajat" ? expensesAll.toInt() : revenuesAll.toInt(),
                            text:selectedKey ,
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 300,
                          child: CircularChart(
                            expenses: 50,
                            revenues: 50,
                            totalCosts: 0,
                            text: selectedKey,
                          ),
                        );
                      }
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                      color: Color(0xFF292B2F),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const IncomeScreen(boolType: true,),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: const Color(0xFF93EDC7)),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Daromad",
                                style: AppStyles.getItems().copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IncomeScreen(boolType: false,),
                                ));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: const Color(0xFFFE9A7B)),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Xarajat",
                                style: AppStyles.getItems().copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: const DialogScreen(change: true),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF1CD8D2), // Start color (#1CD8D2)
                            Color(0xFF93EDC7), // End color (#93EDC7)
                          ],
                          stops: [0.0, 1.0],
                          // Adjust the stops as needed
                          transform:
                              GradientRotation(90), // Set the desired angle
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            "Daromad qo’shish",
                            style: AppStyles.getItems()
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: const DialogScreen(change: false),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFFF725F), // Start color (#1CD8D2)
                            Color(0xFFFE9A7B), // End color (#93EDC7)
                          ],
                          stops: [0.0, 1.0],
                          // Adjust the stops as needed
                          transform:
                              GradientRotation(90), // Set the desired angle
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.minus),
                          const SizedBox(width: 18),
                          Text(
                            "Xarajat qo’shish",
                            style: AppStyles.getItems()
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }

}
