import 'dart:developer';

import 'package:bloc_concept/logic/cubit/counter_cubit.dart';
import 'package:bloc_concept/presentation/screens/home_screen.dart';
import 'package:bloc_concept/presentation/screens/second_screen.dart';
import 'package:bloc_concept/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {


  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(title: 'HomeScreen', color: Colors.blueAccent));

      case 'second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(
                title: 'SecondScreen', color: Colors.redAccent));
      case 'third':
        return MaterialPageRoute(
            builder: (_) => ThirdScreen(
                title: 'ThirdScreen', color: Colors.greenAccent));
      default:
        return null;
    }
  }













  //specifying fir each instance route

  // final CounterCubit _counterCubit = CounterCubit();

  // Route? onGenerateRoute(RouteSettings routeSettings) {
  //   switch (routeSettings.name) {
  //     case '/':
  //       return MaterialPageRoute(
  //           builder: (_) => BlocProvider.value(
  //                 value: _counterCubit,
  //                 child:
  //                     HomeScreen(title: 'HomeScreen', color: Colors.blueAccent),
  //               ));

  //     case 'second':
  //       return MaterialPageRoute(
  //           builder: (_) => BlocProvider.value(
  //               value: _counterCubit,
  //               child: SecondScreen(
  //                   title: 'SecondScreen', color: Colors.redAccent)));
  //     case 'third':
  //       return MaterialPageRoute(
  //           builder: (_) => BlocProvider.value(
  //               value: _counterCubit,
  //               child: ThirdScreen(
  //                   title: 'ThirdScreen', color: Colors.greenAccent)));
  //     default:
  //       return null;
  //   }
  // }

  // void dispose() {
  //   _counterCubit.close();
  // }
}
