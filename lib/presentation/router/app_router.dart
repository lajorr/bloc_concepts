import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/third_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(
            title: 'Home',
            color: Colors.red,
          ),
        );

      case SecondScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SecondScreen(
            title: 'second',
            color: Colors.black,
          ),
        );
      case ThirdScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ThirdScreen(
            title: 'Third',
            color: Colors.green,
          ),
        );
      default:
        return null;
    }
  }
}
