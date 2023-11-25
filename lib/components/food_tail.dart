import 'package:flutter/material.dart';
import 'package:student_info_app/models/food.dart';

class FoodTile extends StatelessWidget {
  Food food;
  void Function()? onTap;
  FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        margin: EdgeInsets.only(
          left: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // padding: EdgeInsets.all(20),
              child: Image.asset(
                food.imgPath ?? '../../assets/images/no-photo.png',
                width: 50,
                height: 50,
              ),
            ),
            Text(food.name),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + food.price),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[200],
                      ),
                      Text(food.rating),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
