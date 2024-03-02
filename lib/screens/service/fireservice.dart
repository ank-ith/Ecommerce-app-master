import 'package:cloud_firestore/cloud_firestore.dart';

class FireService {
  Future<void> addSubcollectionsToOrderDocument(
      Map<String, dynamic> userDetails,
      Map<String, dynamic> productDetails,
      Map<String, dynamic> paymentDetails) async {
    // Get a reference to the parent collection (orders)
    CollectionReference ordersCollectionRef =
        FirebaseFirestore.instance.collection('orders');

    // Add a new document to the orders collection and automatically generate an order number
    DocumentReference orderDocumentRef = await ordersCollectionRef.add({
      'userDetails': userDetails,
      'productDetails': productDetails,
      'paymentDetails': paymentDetails,
      // Add other fields as needed
      'timestamp': FieldValue.serverTimestamp(), // Optional: Add a timestamp
    });

    // Print the auto-generated order number
    String orderNumber = orderDocumentRef.id;
    print('Auto-generated Order Number: $orderNumber');

    // Add subcollections to the parent document (order)
    await orderDocumentRef.collection('userDetails').add(userDetails);
    await orderDocumentRef.collection('productDetails').add(productDetails);
    await orderDocumentRef.collection('paymentDetails').add(paymentDetails);

    print('Subcollections added successfully!');
  }
}
