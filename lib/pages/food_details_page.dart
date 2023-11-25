import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_info_app/components/myButton.dart';
import 'package:student_info_app/models/food.dart';
import 'package:student_info_app/models/shop.dart';
import 'package:student_info_app/theme/colors.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatefulWidget {
  Food food;
  FoodDetails({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantityCount = 0;

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void decrementQuantity() {
    if (quantityCount > 0) {
      setState(() {
        quantityCount--;
      });
    }
  }

  void addToCart() {
    if (quantityCount > 0) {
      // get sccess to shop
      final shop = context.read<Shop>();
      // add to cart
      shop.addToCart(widget.food, quantityCount);
      // let the user know it was successful
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: Text(
            "successfully added to cart",
            style: TextStyle(
              color: Colors.white,            
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                // To remove dialog box
                Navigator.pop(context);
                // To go to previous screen
                Navigator.pop(context);
              },
              icon: Icon(Icons.done, color: Colors.white,),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  // food image
                  Image.asset(
                    widget.food.imgPath!,
                    height: 160,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // Rating of food
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[300],
                      ),
                      Text(widget.food.rating)
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // food's name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // food's name
                  Text('Description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

                  SizedBox(
                    height: 20,
                  ),

                  // food's description
                  Text(
                      'I have a class TripController that contains a private field _updatedAccount I created a getter in order to get from outsideI have a class TripController that contains a private field I have a class TripController that contains a private field I have a class TripController that contains a private field ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          height: 2)),
                ],
              ),
            ),
          ),

          // PRICE SECTION
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Food's Price
                    Text(
                      '\$' + widget.food.price,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),

                    // Food's Counter
                    Row(
                      children: [
                        // plus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(40)),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),

                        // Number of Counter
                        SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            )),

                        // Minus button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(40)),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                // MY BUTTON SECTION
                MyButton(text: 'Add To Cart', onTap: addToCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
