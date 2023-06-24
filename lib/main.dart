import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:toolpor_expense/presentation/provider/ColorNotifier.dart';
import 'package:toolpor_expense/presentation/provider/MyDataNotifier.dart';
import 'package:toolpor_expense/presentation/screens/cubits/categories_cubit/categories_cubit.dart';
import 'package:toolpor_expense/presentation/screens/home_screen/home_screen.dart';
import 'presentation/screens/cubits/my_cubit/my_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => MyCubit(),
        ),
        BlocProvider(create: (context) => CategoriesCubit()),
        ChangeNotifierProvider(create: (_)=>MyDataNotifier()),
        ChangeNotifierProvider(create: (_)=>ColorNotifier()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
