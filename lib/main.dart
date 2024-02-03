import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizza_hub/controllers/firebase_options.dart';
import 'package:pizza_hub/controllers/widgettree.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          textTheme: const TextTheme(
            //bodyLarge: TextStyle(color: Colors.orange),
        //bodyMedium: TextStyle(color: Colors.orange),
        //displayLarge: TextStyle(color: Colors.orange),
        //displayMedium: TextStyle(color: Colors.orange),
        //displaySmall: TextStyle(color: Colors.orange),
        //headlineMedium: TextStyle(color: Colors.orange),
        //headlineSmall: TextStyle(color: Colors.orange),
        titleLarge: TextStyle(color: Colors.orange),
        titleMedium: TextStyle(color: Colors.orange),
        titleSmall: TextStyle(color: Colors.orange),
        ),
        ),  
        home: const WidgetTree());
  }
}
