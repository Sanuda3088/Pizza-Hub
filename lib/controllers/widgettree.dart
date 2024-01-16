import 'package:flutter/material.dart';
import 'package:pizza_hub/pages/homepage_areg.dart';
import 'package:pizza_hub/pages/homepage_breg.dart';
import 'auth.dart';


class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (contex, snapshot) {
        if (snapshot.hasData) {
          return  const AfterHomePage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
