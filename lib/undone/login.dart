

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: SharedLogin(),
  ));
}

class SharedLogin extends StatefulWidget {

  @override
  State<SharedLogin> createState() => _SharedLoginState();
}

class _SharedLoginState extends State<SharedLogin> {
  final uname_ctrl = TextEditingController();
  final pwd_ctrl = TextEditingController();
  late bool loggedin;

  @override
  void initState() {
    user_already_loggedin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red,
          title: Text("Login"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Login using email ',style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold)),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: TextField(decoration: InputDecoration(labelText: 'Email',prefixIcon: Icon(Icons.email_rounded))),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: TextField(
                      //obscuringCharacter:'*',
                      decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(Icons.emergency_outlined),
                          suffixIcon: IconButton(onPressed: (){


                          }, icon:Icon( Icons.visibility_off))
                      )),
                ),
                ElevatedButton(
                    onPressed: () {
                      validate_login();
                    }

                    ,child: Text("Login"))
              ]),
        ));
  }

  void user_already_loggedin() async {
    final SharedPreferences preferences =
    await SharedPreferences.getInstance();

    /// if first stmt is null execute 2nd statement
    loggedin = preferences.getBool("loggedin") ?? false;
    if (loggedin == true) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
    }
  }

  void validate_login() async{
    final SharedPreferences preferences=await SharedPreferences.getInstance();
    String username=uname_ctrl.text;
    String password=pwd_ctrl.text;
    String? uname=preferences.getString('uname');
    String? pword=preferences.getString('password');
    if(username==uname&&password==pword){
      preferences.setBool('loggedin',true);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
    }
  }
}