import 'package:ecommerce_project/screens/provider/cart_provider.dart';
import 'package:ecommerce_project/screens/service/fireservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  final total;

  CheckoutScreen({super.key, required this.total});

  // final double price;
  // final int quantity;
  // final String productName;
  // final DateTime date;
  // const CheckoutScreen({super.key,required, required this.price, required this.quantity, required this.productName, required this.date});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}


class _CheckoutScreenState extends State<CheckoutScreen> {
 


  void addToFirebase(Map<String,dynamic>ud,Map<String,dynamic>pd,Map<String,dynamic>payd) {
    FireService fireService = FireService();
    fireService.addSubcollectionsToOrderDocument(
        ud, pd, payd);
  }

  List<String> paymentOptions = [
    'assets/images/payment/gpay.png',
    'assets/images/payment/paytm.png',
    'assets/images/payment/phonepe.png',
    'assets/images/payment/visa.png',
    'assets/images/payment/codpng.png'
  ];
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _addressEditingController = TextEditingController();
  TextEditingController _phoneEditingController = TextEditingController();
  TextEditingController _pinEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<CartItem> finalCart =
        Provider
            .of<CartProvider>(context)
            .cartItems;
    Map<String, dynamic>productDetails={};
    Map<String, dynamic>userDetails={};
    Map<String, dynamic>paymentDetails={};
    finalCart.asMap().forEach((index,element) {
      productDetails['name$index'] = element.name;
      productDetails['price$index']=element.price;
      productDetails['quantity$index']=element.quantity;
    });
    void fillMap(){
      userDetails['name']=_nameEditingController.text;
      userDetails['address']=_addressEditingController.text;
      userDetails['phone']=_phoneEditingController.text;
      userDetails['pin']=_pinEditingController.text;
      paymentDetails['total']=widget.total.toString();
      paymentDetails['method']='Cod';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Checkout',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'SFUIDisplay')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: finalCart.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 5,
                    child: Container(
                      color: Colors.grey[350],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(finalCart[index].image),
                            height: 100,
                            width: 100,
                            fit: BoxFit.scaleDown,
                          ),
                          Column(
                            children: [
                              Text('Product details',
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: 'SFUIDisplay')),
                              Text('item:${finalCart[index].name}'),
                              Text('price:\$ ${finalCart[index].price}'),
                              Text(
                                  'quantity:${finalCart[index].quantity
                                      .toString()}'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Order Summary',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SFUIDisplay'),
                  ),
                  SizedBox(height: 8),
                  // Add order summary details here
                  Text('Total:\$${widget.total}',
                      style:
                      TextStyle(fontSize: 18, fontFamily: 'SFUIDisplay')),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 90,
                    child: GridView.builder(
                      itemCount: paymentOptions.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: double.infinity),
                      itemBuilder: (context, index) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                    paymentOptions[index])),
                          ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(elevation: 5,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.grey[350],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Shipping Information',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SFUIDisplay'),
                    ),
                    SizedBox(height: 8),
                    TextField(controller: _nameEditingController,
                      decoration: InputDecoration(labelText: 'Full Name'),
                    ),
                    SizedBox(height: 8),
                    TextField(controller: _addressEditingController,
                      decoration: InputDecoration(labelText: 'Address'),
                    ),
                    SizedBox(height: 8),
                    TextField(controller: _phoneEditingController,
                      decoration: InputDecoration(labelText: 'Phone'),
                    ),
                    SizedBox(height: 8),
                    TextField(controller: _pinEditingController,
                      decoration: InputDecoration(labelText: 'Zip Code'),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(labelText: 'Country'),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.grey[250],
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                        onPressed: () {
                        fillMap();
                        addToFirebase(userDetails, productDetails, paymentDetails);
                        //push to splash screen NEEDED
                        },
                        child: Text('Place Order', style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'SFUIDisplay',
                            color: Colors.black)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
