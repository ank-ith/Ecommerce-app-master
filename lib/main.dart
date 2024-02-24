import 'package:ecommerce_project/firebase_options.dart';
import 'package:ecommerce_project/screens/provider/cart_provider.dart';
import 'package:ecommerce_project/screens/homepage.dart';
import 'package:ecommerce_project/screens/provider/fav_provider.dart';
import 'package:ecommerce_project/screens/sign_in.dart';
import 'package:ecommerce_project/screens/sign_up.dart';
import 'package:ecommerce_project/screens/splash_screen.dart';
import 'package:ecommerce_project/screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/forgot_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context)=> FavProvider()),
      ]
    ,child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
