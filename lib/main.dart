import 'package:flutter/material.dart';
import 'package:toolpor_expense/presentation/screens/dialog_screen/dialog_screen.dart';
import 'package:toolpor_expense/presentation/screens/edit_item/edit_item.dart';
import 'package:toolpor_expense/presentation/screens/home_screen/home_screen.dart';
import 'package:toolpor_expense/presentation/screens/income_screen/income_screen.dart';
import 'package:toolpor_expense/presentation/screens/item_detail/item_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

