import 'package:flutter/material.dart';
import 'package:student_info_app/models/food.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    Food(
        imgPath: 'assets/images/sushi3.png',
        name: 'Salmon Sushi',
        price: '21.00',
        rating: '4.9'),
    Food(
        imgPath: 'assets/images/sushi1.png',
        name: 'Tuna',
        price: '23.00',
        rating: '3.5'),
    Food(
        imgPath: 'assets/images/sushi2.png',
        name: 'Tuna',
        price: '40.00',
        rating: '5'),
  ];
  // customer cart
  List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
      notifyListeners();
    }
  }

  // remove from cart

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
