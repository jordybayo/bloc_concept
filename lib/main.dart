import 'package:bloc_concept/logic/cubit/internet_cubit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_concept/logic/cubit/counter_cubit.dart';
import 'package:bloc_concept/presentation/router/app_router.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(), //depences injection
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context)=>InternetCubit(connectivity: connectivity)
          ),
        BlocProvider<CounterCubit>(
          create: (context)=>CounterCubit()
          ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
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
