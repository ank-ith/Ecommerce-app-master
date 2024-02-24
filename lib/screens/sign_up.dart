import 'package:ecommerce_project/screens/auth/fire_auth.dart';
import 'package:ecommerce_project/screens/homepage.dart';
import 'package:ecommerce_project/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create account',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SFUIDisplay'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFields(
                icon: Icon(Icons.person_2_outlined),
                label: 'FULL NAME',
                controller: _nameController,
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
              TextFields(
                icon: Icon(Icons.lock_outline),
                label: 'PASSWORD',
                controller: _passwordController,
                secureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields(
                  icon: Icon(Icons.lock_outline),
                  label: 'CONFIRM PASSWORD',
                  controller: _confirmPasswordController,
                  secureText: true),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      onPressed: () {
                        if (_passwordController.text.trim() ==
                            _confirmPasswordController.text.trim()) {
                          FireAuth()
                              .registerUser(
                                  email: _emailController.text.trim(),
                                  pwd: _passwordController.text.trim())
                              .then((value) {
                                //save name email
                                prefEmailPwd();
                            if (value == null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text(value)));
                            }
                          });
                        }
                        else{ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('password and confirm password does not match')));}
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('SIGN UP'),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'already have an account?',
              style: TextStyle(
                  fontFamily: "SFUIDisplay", color: Colors.black, fontSize: 15),
            ),
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignIn(),
                    )),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }

  void prefEmailPwd() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('email', _emailController.text);
    prefs.setBool('isloggedin', true);
  }
}

class TextFields extends StatefulWidget {
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
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.secureText,
        style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: widget.label,
            prefixIcon: widget.icon,
            labelStyle: TextStyle(fontSize: 12, fontFamily: 'SFUIDisplay')),
      ),
    );
  }
}
