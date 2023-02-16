import 'package:bloc_starter/bloc/user.dart';
import 'package:bloc_starter/bloc/counter.dart';
import 'package:bloc_starter/bloc/theme.dart';
import 'package:bloc_starter/pages/404.dart';
import 'package:bloc_starter/pages/bloc_selector.dart';
import 'package:bloc_starter/pages/home.dart';
import 'package:bloc_starter/pages/other.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRouter {
  final CounterBloc myCounter = CounterBloc();
  final ThemeBloc myTheme = ThemeBloc();
  final UserBloc myUser = UserBloc();
  Route onRizaWays(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: myCounter),
              BlocProvider.value(value: myTheme),
            ],
            child: HomePage(),
          ),
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: myCounter),
              BlocProvider.value(value: myTheme),
            ],
            child: const OtherPage(),
          ),
        );
      case "/blocSlector":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: myUser,
            child: const SelectorPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
