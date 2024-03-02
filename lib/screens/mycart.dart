
import 'package:ecommerce_project/screens/homepage.dart';
import 'package:ecommerce_project/screens/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'checkout.dart';
import 'widgets/custom_scaffold.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CartItem> cartItems =
        Provider.of<CartProvider>(context).cartItems;

    return cartItems.isNotEmpty
        ? CustomScaffold(
            showAppBar: false,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CART',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SFUIDisplay'),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return CartItemWidget(
                              cartItem: cartItems[index],
                              onUpdate: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .notifyListeners();
                              });
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                double total=calculateTotal(cartItems);
                                showCheckoutDialog(context,total);
                              },
                              child: Text('Proceed to Checkout',
                                  style: TextStyle(fontFamily: 'SFUIDisplay')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL: ',
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: 'SFUIDisplay'),
                          ),
                          Text(
                            '\$${calculateTotal(cartItems).toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SFUIDisplay'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            showBottomNavBar: true,
            initialIndex: 3,
          )
        : CustomScaffold(
            showAppBar: false,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CART',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SFUIDisplay'),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Image(
                              image: AssetImage('assets/images/cartempty.png'),
                              height: 250,
                              width: 250,
                            ),
                            Text('''Seems like your cart is empty
add any product to checkout''',
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'SFUIDisplay')),
                        SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 60),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.green[600],
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
                                },
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_back),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('go to homepage',
                                        style:
                                            TextStyle(fontFamily: 'SFUIDisplay'))
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            showBottomNavBar: true,
            initialIndex: 3,
          );
  }


  void showCheckoutDialog(BuildContext context,double total) {

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('CheckOut', style: TextStyle(fontFamily: 'SFUIDisplay')),
          content: Text('Click Ok to Confirm',
              style: TextStyle(fontFamily: 'SFUIDisplay')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  Text('Cancel', style: TextStyle(fontFamily: 'SFUIDisplay')),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CheckoutScreen(total: total),
                ));
                //Navigator.of(context).pop();
              },
              child: Text(
                'Ok',
                style: TextStyle(fontFamily: 'SFUIDisplay'),
              ),
            ),
          ],
        );
      },
    );
  }

  double calculateTotal(List<CartItem> cartItems) {
    double total = 0.0;
    for (var item in cartItems) {
      total += double.parse(item.price) * item.quantity;
    }
    return total;
  }
}

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;
  final Function onUpdate;

  const CartItemWidget(
      {Key? key, required this.cartItem, required this.onUpdate})
      : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    quantity = widget.cartItem.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset(
              widget.cartItem.image,
              height: 90,
              width: 90,
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cartItem.name,
                  style: TextStyle(fontSize: 18, fontFamily: 'SFUIDisplay'),
                ),
                Text(
                  '\$${widget.cartItem.price}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: 'SFUIDisplay'),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    decrementQuantity();
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 18, fontFamily: 'SFUIDisplay'),
                ),
                IconButton(
                  onPressed: () {
                    incrementQuantity();
                  },
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    removeItemFromCart();
                  },
                  icon: Icon(Icons.delete_forever),
                  iconSize: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
      widget.cartItem.quantity = quantity;
      widget.onUpdate();
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
        widget.cartItem.quantity = quantity;
        widget.onUpdate();
      });
    }
  }

  void removeItemFromCart() {
    Provider.of<CartProvider>(context, listen: false)
        .removefrmCart(widget.cartItem);
    widget.onUpdate();
  }
}
