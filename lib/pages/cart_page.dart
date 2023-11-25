import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_info_app/components/myButton.dart';
import 'package:student_info_app/models/food.dart';
import 'package:student_info_app/models/shop.dart';
import 'package:student_info_app/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context) {
    // get access to the shop class
    final shop = context.read<Shop>();

    // remove from the cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text(
            "My Cart",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // Get food from cart
                  final Food food = value.cart[index];
                  // get food name
                  final foodName = food.name;
                  // get food price
                  final foodPrice = food.price;
                  // return list tile
                  return Container(
                    margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                    ),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                            color: Colors.grey[300], fontWeight: FontWeight.normal),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                        onPressed: () => removeFromCart(food, context),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyButton(text: 'Pay Now', onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
