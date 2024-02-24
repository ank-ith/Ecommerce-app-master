import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../my_account.dart';
import '../sign_in.dart';
import 'bottom_nav_bar.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final bool showBottomNavBar;
  final bool showAppBar;
  final int initialIndex;
  final String? searchKeyword;
  final Function(String)? onSearchTextChanged;
  CustomScaffold({
    Key? key,
    required this.body,
    this.showBottomNavBar = false,
    this.initialIndex = 0,
    this.showAppBar = true,
    this.searchKeyword,
    this.onSearchTextChanged,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  void initState() {
    loggedValue();
    super.initState();
  }

  late bool loggedin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
        toolbarHeight: 90,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              loggedin
                  ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAccount(),
                  ))
                  : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ));
            },
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
        elevation: 10.0,
        backgroundColor: Colors.green[700],
        title: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.green[700]),
          child: Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: widget.onSearchTextChanged, // Pass onChanged callback
                    decoration: InputDecoration(
                      hintText: "search any products",
                      hintStyle: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list, color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      )
          : null,
      body: widget.body,
      bottomNavigationBar: widget.showBottomNavBar
          ? BottomNavBar(initialIndex: widget.initialIndex)
          : null,
    );
  }

  Future<void> loggedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loggedin = prefs.getBool('isloggedin') ?? false;
  }
}
