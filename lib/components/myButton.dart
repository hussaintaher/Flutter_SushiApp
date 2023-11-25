import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text;
  void Function()? onTap;
  MyButton({
    super.key, 
    required this.text, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(109, 140, 94, 91),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white
              ),
            ),

            SizedBox(width: 10,),

            Icon(
            Icons.arrow_forward, 
            weight: 100,
            color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
