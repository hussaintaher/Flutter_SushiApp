import 'package:flutter/material.dart';
import 'package:student_info_app/components/food_tail.dart';
import 'package:student_info_app/components/myButton.dart';
import 'package:student_info_app/models/shop.dart';
import 'package:student_info_app/pages/food_details_page.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  
  void navigateToDetailsPage(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetails(
                  food: foodMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cartPage'),
            icon: Icon(Icons.shopping_cart, color: Colors.black,),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),

          /* Promo section */
          Container(
            margin: EdgeInsets.only(bottom: 20, left: 25, right: 25),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            decoration: BoxDecoration(
                // border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 183, 60, 55)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Get 32% Promo',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(text: 'Redeem', onTap: () {})
                  ],
                ),
                Expanded(
                  child: Container(
                    child: Image.asset('assets/images/sushi1.png',
                        height: 100, width: 100),
                  ),
                )
              ],
            ),
          ),

          /* Inout Field */
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search Here..'),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          /* Menu List */
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food Menu',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToDetailsPage(index)),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          /* Popular Food */
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/sushi.png', height: 60),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Salmon Eggs'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('\$ 21.00'),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.favorite_border_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }
}
