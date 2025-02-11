

import 'package:counter_app/viewmodels/CounterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/constants.dart';
import '../models/CounterModel.dart';
import '../views/HomeView.dart';
import '../views/SecondPageView.dart';

class CustomCounter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(CounterModel()),
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
          '/second': (context) => const SecondPageView(),
        },
      ),
    );
  }

}