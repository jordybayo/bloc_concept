import 'package:bloc_concept/logic/cubit/counter_cubit.dart';
import 'package:bloc_concept/presentation/router/app_router.dart';
import 'package:bloc_concept/presentation/screens/home_screen.dart';
import 'package:bloc_concept/presentation/screens/second_screen.dart';
import 'package:bloc_concept/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final CounterState counterState1 =
      CounterState(counterValue: 1, wasIncremented: true);
  final CounterState counterState2 =
      CounterState(counterValue: 1, wasIncremented: true);
  // This should return true now
  print(counterState1 == counterState2);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   CounterCubit _counterCubit = CounterCubit();
//   final AppRouter _appRouter = AppRouter();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       onGenerateRoute: _appRouter.onGenerateRoute,
//       // routes: {
//       //   '/': (context) => BlocProvider.value(
//       //         value: _counterCubit,
//       //         child: HomeScreen(title: 'HomeScreeen', color: Colors.blueAccent),
//       //       ),
//       //   'second': (context) => BlocProvider.value(
//       //         value: _counterCubit,
//       //         child: SecondScreen(
//       //             title: 'SecondScreeen', color: Colors.redAccent),
//       //       ),
//       //   'third': (context) => BlocProvider.value(
//       //       value: _counterCubit,
//       //       child: ThirdScreen(title: 'ThirdScreeen', color: Colors.greenAccent))
//       // },
//     );
//   }

//   @override
//   void dispose() {
//     _counterCubit.close();
//     _appRouter.dispose();
//     super.dispose();
//   }
// }
