import 'package:ecommerce_project/firebase_options.dart';
import 'package:ecommerce_project/screens/provider/cart_provider.dart';
import 'package:ecommerce_project/screens/provider/fav_provider.dart';
import 'package:ecommerce_project/screens/splash_screen.dart';
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
    ,child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(useMaterial3: true,),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
