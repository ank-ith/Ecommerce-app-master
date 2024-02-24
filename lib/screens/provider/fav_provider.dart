import 'package:flutter/cupertino.dart';

class FavItem {
  String name;
  String price;
  String image;

  FavItem({required this.name, required this.price, required this.image});
}

class FavProvider with ChangeNotifier {
  List<FavItem> favorites = [];

  void addToFav(FavItem item) {
    if (!favorites.contains(item)) {
      favorites.add(item);
      notifyListeners();
    }
  }

  void removeFav(FavItem item) {
    favorites.remove(item);
    notifyListeners();
  }

  void logout() {
    favorites.clear();
  }
}
