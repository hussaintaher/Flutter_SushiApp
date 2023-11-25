import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_info_app/components/myButton.dart';
import 'package:student_info_app/pages/test.dart';
import 'package:student_info_app/theme/colors.dart';
import '../models/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return Text('Home Page');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: Text(' Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 183, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Sushi Man',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 30,
                  color: Colors.white
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                  child: Image.asset(
                    './assets/images/sushi.png',
                    width: 300,
                    height: 300,
                )
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'THE TASTE OF JAPANESE FOOD',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white
                ),
              ),
              Text(
                  'Feel the taste of the most popular japanese food from anywhere and anytimer',
                  style: TextStyle(color: Colors.grey, height: 2)),
              SizedBox(
                height: 10,
              ),
              MyButton(
                text: 'Get Started',
                onTap: () {
                  Navigator.pushNamed(context, '/test');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
