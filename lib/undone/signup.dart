import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class Signup extends StatelessWidget{

  bool showpwd=true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar:AppBar
      (title:Text('Signin'),
      leading: IconButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
      },
          icon:Icon(Icons.arrow_back_ios)),backgroundColor: Colors.red,
    ) ,
      body: SingleChildScrollView(
        child: Form(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text('SignUp',style: TextStyle(
                        fontWeight: FontWeight.bold
                        ,fontSize: 50,
                      ),),
                    )
                    ,Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text('Create an Account its free',style: TextStyle(color: Colors.black),),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextFormField(decoration: InputDecoration(labelText: 'Username',prefixIcon:Icon( Icons.person))
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextField(decoration: InputDecoration(labelText: 'Email',prefixIcon: Icon(Icons.email_rounded))),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: TextField(obscureText:showpwd,
                          obscuringCharacter:'*',
                          decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(Icons.emergency_outlined),
                              suffixIcon: IconButton(onPressed: (){


                              }, icon:Icon( Icons.visibility_off))
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(decoration: InputDecoration(labelText: 'Confirm Password',prefixIcon: Icon(Icons.password))),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: MaterialButton(shape:  StadiumBorder(),
                          onPressed: (){},
                          color: Colors.red,
                          minWidth:350,height: 50,
                          child:  Text('Sign up',style: TextStyle(fontSize: 18),)
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>SharedLogin()));
                    }, child: RichText(text: TextSpan(style: TextStyle(fontSize: 15),
                        children:[TextSpan(text: 'Already have an account ',style:TextStyle(color: Colors.black)),
                          TextSpan(text: 'Login',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                          )
                        ]
                    )
                      ,
                    )
                    )
                  ]
              )
          ),
        ),
      ),
    );
  }

}