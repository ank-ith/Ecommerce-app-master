import 'package:ecommerce_project/screens/auth/fire_auth.dart';
import 'package:ecommerce_project/screens/forgot_password.dart';
import 'package:ecommerce_project/screens/homepage.dart';
import 'package:ecommerce_project/screens/sign_up.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return //GestureDetector(
        //onTap: (){
        //   FocusScopeNode currentFocus =FocusScope.of(context);
        //   if(currentFocus.hasPrimaryFocus && currentFocus.focusedChild!=null){
        //     currentFocus.focusedChild?.unfocus();
        //   }
        // },
        // child:
        Scaffold(resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SFUIDisplay'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please sign in to continue",
                style: TextStyle(
                    fontSize: 22, color: Colors.grey, fontFamily: 'SFUIDisplay'),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _emailAddressController,
                style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'EMAIL',
                    prefixIcon: Icon(Icons.email_outlined),
                    labelStyle:
                        TextStyle(fontSize: 12, fontFamily: 'SFUIDisplay')),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'PASSWORD',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPassword()));
                        },
                        child: Text(
                          'Forgot',
                          style: TextStyle(color: Colors.green),
                        )),
                    labelStyle:
                        TextStyle(fontSize: 12, fontFamily: 'SFUIDisplay')),
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
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                      onPressed: () {
                        String email = _emailAddressController.text.trim();
                        String pwd = _passwordController.text.trim();
                        FireAuth()
                            .loginUser(email: email, pwd: pwd)
                            .then((value) {
                          if (value == null) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(value)));
                          }
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('LOGIN',
                              style: TextStyle(fontFamily: 'SFUIDisplay')),
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
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dont have an account ',
              style: TextStyle(
                  fontFamily: 'SFUIDisplay', color: Colors.black, fontSize: 15),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text(
                  'Sign Up',
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
