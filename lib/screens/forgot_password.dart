import 'package:ecommerce_project/screens/sign_in.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _SignUpState();
}

class _SignUpState extends State<ForgetPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 110, 20, 110),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                'Forget Password?',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'SFUIDisplay'),
              ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFields(
                    icon: Icon(Icons.email_outlined),
                    label: 'EMAIL',
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('RESET',style: TextStyle(fontFamily: 'SFUIDisplay')),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 24.0,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          )),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'already have an account',
              style: TextStyle(
                  fontFamily: "SFUIDisplay", color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              width: 5,
            ),
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignIn(),
                )),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'SFUIDisplay',
                      color: Colors.green,
                      fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final Icon icon;
  final String label;
  TextEditingController controller;
  bool secureText;

  TextFields(
      {super.key,
        required this.icon,
        required this.label,
        required this.controller,
        this.secureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: secureText,
        style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            prefixIcon: icon,
            labelStyle: TextStyle(fontSize: 12)),
      ),
    );
  }
}
