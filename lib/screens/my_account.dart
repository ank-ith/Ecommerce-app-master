import 'package:ecommerce_project/screens/auth/fire_auth.dart';
import 'package:ecommerce_project/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/custom_scaffold.dart';

class MyAccount extends StatefulWidget {

   const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();

}

class _MyAccountState extends State<MyAccount> {
  @override
  void initState() {
    // TODO: implement initState
    getNameEmail();
  }
 late String name='name';
  late  String email='email';

  void getNameEmail()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name')!;
    email = prefs.getString('email')!;
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: false,
      body: Column(
        children: [
          Expanded(
            child: Material(
              elevation: 5,
              child: Container(
                color: Colors.green,
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      Divider(),
                      Center(
                          child: Text(
                        name,
                        style:
                            TextStyle(fontSize: 30, fontFamily: 'SFUIDisplay'),
                      )),
                      Center(
                          child: Text(
                            email,
                            style:
                            TextStyle(fontSize: 20, fontFamily: 'SFUIDisplay'),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Material(
                  elevation: 5,
                  child: ListTile(
                    title: Text('My Orders',
                        style: TextStyle(fontFamily: 'SFUIDisplay')),
                    leading: Icon(Icons.shopping_bag, color: Colors.green),
                    onTap: () {

                      // Navigate to the orders screen
                    },
                  ),
                ),
                Divider(),
                Material(
                  elevation: 5,
                  child: ListTile(
                    title: Text('Favourites',
                        style: TextStyle(fontFamily: 'SFUIDisplay')),
                    leading: Icon(
                      Icons.favorite,
                      color: Colors.green,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Fav_screen(),
                      ));
                    },
                  ),
                ),
                Divider(),
                // Material(elevation: 5,
                //   child: ListTile(
                //     title: Text('Payment Methods'),
                //     leading: Icon(Icons.payment,color: Colors.green),
                //     onTap: () {
                //       // Navigate to the payment methods screen
                //     },
                //   ),
                // ),
                // Divider(),
                Material(
                  elevation: 5,
                  child: ListTile(
                    title: Text('Account Settings',
                        style: TextStyle(fontFamily: 'SFUIDisplay')),
                    leading: Icon(Icons.person, color: Colors.green),
                    onTap: () {
                      // Navigate to the personal information screen
                    },
                  ),
                ),
                Divider(),
                Material(
                  elevation: 5,
                  child: ListTile(
                    title: Text('App Settings',
                        style: TextStyle(fontFamily: 'SFUIDisplay')),
                    leading: Icon(Icons.settings, color: Colors.green),
                    onTap: () {
                      // Implement logout functionality
                    },
                  ),
                ),
                Divider(),
                Material(
                  elevation: 5,
                  child: ListTile(
                    title: Text('Logout',
                        style: TextStyle(fontFamily: 'SFUIDisplay')),
                    leading: Icon(Icons.exit_to_app, color: Colors.green),
                    onTap: () {
                    FireAuth().logout();

                    },
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
      showBottomNavBar: true,
      initialIndex: 2,
    );
  }
}

