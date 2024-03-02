import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/screens/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class ProductDetails extends StatefulWidget {
  final CardItem received_card;

  const ProductDetails({
    required this.received_card,
    Key? key,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _currentSlide = 0;

  void addToCart() {
    CartItem newItem = CartItem(
        name: widget.received_card.title,
        price: widget.received_card.pricing,
        quantity: 1,
        image: widget.received_card.images[0]);
    Provider.of<CartProvider>(context, listen: false).addToCart(newItem);
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(alignment: Alignment.bottomRight, children: [
              Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 250.0,
                      enlargeCenterPage: true,
                      onPageChanged: (index, _) {
                        setState(() {
                          _currentSlide = index;
                        });
                      },
                    ),
                    items: widget.received_card.images.map((imageUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                    // widget.imgsUrl.map((imageUrl)
                    // {
                    //   return Image.asset(
                    //     imageUrl,
                    //     fit: BoxFit.cover,
                    //   );
                    // }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    elevation: 10,
                    shape: CircleBorder(),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.received_card.isfav =
                                !widget.received_card.isfav;
                          });
                        },
                        icon: widget.received_card.isfav
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border))),
              )
            ]),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Material(
              elevation: 10,
              child: Row(
                children: [
                  Text(
                    widget.received_card.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,fontFamily: 'SFUIDisplay'
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.received_card.pricing
                    // widget.passPrice,
                    ,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black, fontFamily: 'SFUIDisplay'
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Product Description',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, fontFamily: 'SFUIDisplay'),
            ),
          ),
          Material(
            elevation: 10,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PRODUCT DESCRIPTION1',
                    style: TextStyle(fontSize: 16, fontFamily: 'SFUIDisplay'),
                  ),
                  Text(
                    'PRODUCT DESCRIPTION2',
                    style: TextStyle(fontSize: 16, fontFamily: 'SFUIDisplay'),
                  ),
                  Text(
                    'PRODUCT DESCRIPTION3',
                    style: TextStyle(fontSize: 16, fontFamily: 'SFUIDisplay'),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Material(
            elevation: 5,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: Text(
                        'BUY NOW',
                        style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'SFUIDisplay'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        addToCart();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'SFUIDisplay'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
