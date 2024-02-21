import 'package:ecommerce_project/screens/homepage.dart';
import 'package:ecommerce_project/screens/sign_in.dart';
import 'package:ecommerce_project/screens/sign_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(/*colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken*/
                  image: AssetImage("assets/images/bground.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(5, 120, 5, 20)),
              Image.asset(
                'assets/images/V+shopping cart.jpeg',
                height: 175,
              ),
              SizedBox(
                height: 100,
              ),
              Button(
                text: 'SIGN UP',
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
              SizedBox(
                height: 45,
              ),
              Button(
                text: 'SIGN IN',
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignIn()));
                },
              ),
              Spacer(),
              Padding(padding:EdgeInsets.only(bottom: 30,right: 20) ,),
              Align(alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w400),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  String text;
  final void Function() onPressed;

  Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: Text(
          text,
          style:
              TextStyle(color: Color.fromARGB(255, 94, 92, 92), fontSize: 22),
        ),
      ),
    );
  }
}
