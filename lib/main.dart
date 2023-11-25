import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_info_app/models/shop.dart';
import 'package:student_info_app/pages/cart_page.dart';
import 'package:student_info_app/pages/home.dart';
import 'package:student_info_app/pages/student.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_info_app/pages/test.dart';
import 'package:student_info_app/widget_tree.dart';
import './firebase_options.dart'; // for firebase configuration

//import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => Shop(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetTree(),
      routes: {
        '/homepage': (context) => HomePage(),
        '/test': (context) => TestPage(),
        '/student': (context) => Student(),
        '/cartPage': (context) => CartPage()
      },
    );
  }
}
