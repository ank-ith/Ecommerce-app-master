import 'package:ecommerce_project/screens/homepage.dart';
import 'package:flutter/material.dart';

import '../category.dart';
import '../my_account.dart';
import '../mycart.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  BottomNavBar({super.key, required this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selecetdIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selecetdIndex=widget.initialIndex;
  }
  void _onItemtapped(int index) {
    setState(() {
      _selecetdIndex = index;
    });
    switch(index){
      case 0:_navigateToRoute(context, '/home', HomeScreen());
      break;
      case 1:_navigateToRoute(context, '/Category', CategoryScreen());
      break;
      case 2:_navigateToRoute(context, '/myaccount', MyAccount());
      break;
      case 3:_navigateToRoute(context, '/mycart', MyCart());
      break;
    }
  }

  void _navigateToRoute(context, String routename, Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = currentRouteName == routename;
    if (routeExists) {
      Navigator.popUntil(context, ModalRoute.withName(routename));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>screen,settings: RouteSettings(name: routename)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selecetdIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemtapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: _selecetdIndex == 0 ? Colors.green : Colors.black,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.food_bank_outlined,
                color: _selecetdIndex == 1 ? Colors.green : Colors.black,
              ),
              label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
                color: _selecetdIndex == 2 ? Colors.green : Colors.black,
              ),
              label: "My Account"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: _selecetdIndex == 3 ? Colors.green : Colors.black,
              ),
              label: "Cart"),
        ]);
  }
}
