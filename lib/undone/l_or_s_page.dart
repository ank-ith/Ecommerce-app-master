import 'package:ecommerce_project/undone/signup.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(textAlign: TextAlign.center,
                'Hello There!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50,),
              ),
            ),
            Text(textAlign: TextAlign.center,
                'Create an Account or Login',
                style: TextStyle(fontSize: 18,)
            ),
            Image(image: NetworkImage('https://cdn-lite.ip2location.com/img/sign-up.png'))
            ,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(onPressed: (){Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>SharedLogin()));},
                shape:StadiumBorder() ,
                color: Colors.indigoAccent,
                child:Text('Log In',style: TextStyle(fontSize: 18)),minWidth:350,height: 50 ,


              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(onPressed:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Signup()));},
                shape: StadiumBorder(),
                color: Colors.redAccent,
                child: Text('Sign Up',style: TextStyle(fontSize: 18)),minWidth: 350,height: 50,),
            )
          ],
        )
    );
  }
}
void main(){
  runApp(MaterialApp(home: Home()));
}
