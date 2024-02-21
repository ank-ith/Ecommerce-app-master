import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/236x/5e/36/67/5e36677d0c55e69e72bbef08da73f8e2.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/236x/6e/c3/24/6ec324c0dd603b7ca2e64dbef25bdb96.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 240.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/236x/86/75/28/86752863404505380bfb1c34e0f5d71c.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/236x/e1/7d/94/e17d948c8b0b0d48a44f944ffc05ed6a.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/236x/20/ad/24/20ad24d60334fc969143acb45d189772.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ],

          ),

        ],
      ))),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Home()));
}
