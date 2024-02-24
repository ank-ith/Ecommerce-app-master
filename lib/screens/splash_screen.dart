import 'dart:async';

import 'package:ecommerce_project/screens/homepage.dart';
import 'package:ecommerce_project/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late bool visited_data=false;

  @override
  void initState() {
    getVistedvalue();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
    _animationController.forward();
    Timer(const Duration(seconds: 3), () async{
     visited_data?
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const HomeScreen() ,))
         :
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const WelcomeScreen() ,));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInOut)),
              child: Image.asset(
                'assets/images/cart.png',
                height: 150,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInOut)),
              child: const Text(
                'E-COMMERCE APP',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold, fontFamily: 'SFUIDisplay',
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 40,
        child: Text(
          'v4.3.2',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontFamily: 'SFUIDisplay'),
        ),
      ),
    );
  }

  Future<bool> getVistedvalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    visited_data = prefs.getBool('visited')!;
    return visited_data;
  }
}