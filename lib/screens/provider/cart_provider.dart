import 'package:flutter/material.dart';

class CartItem{
  String name;
  String price;
  int quantity;
  String image;
  CartItem({required this.name,required this.price,this.quantity=1,required this.image});
}
class CartProvider with ChangeNotifier{
  List<CartItem>cartItems=[];
  void addToCart(CartItem item){
    cartItems.add(item);
    notifyListeners();
  }
  void removefrmCart(CartItem item){
    cartItems.remove(item);
    notifyListeners();
  }
  void logout(){
    cartItems.clear();
  }
}