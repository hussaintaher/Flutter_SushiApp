import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_info_app/pages/Login_page_auth.dart';
import 'package:student_info_app/pages/home.dart';
import 'package:student_info_app/pages/menu_page.dart';
import './models/auth.dart';

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
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MenuPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
