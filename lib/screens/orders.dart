import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green[600],
        title: Text('Order History'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text('${order.id}'),
            ),
            title: Text('Order ID: ${order.id}'),
            subtitle: Text('Total: \$${order.total.toStringAsFixed(2)}'),
            trailing: Text(
              order.status,
              style: TextStyle(
                color: _getStatusColor(order.status),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Navigate to order details screen
            },
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Delivered':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}

class Order {
  final int id;
  final double total;
  final String status;

  Order({required this.id, required this.total, required this.status});
}

final List<Order> orders = [
  Order(id: 1, total: 50.0, status: 'Pending'),
  Order(id: 2, total: 75.0, status: 'Delivered'),
  Order(id: 3, total: 30.0, status: 'Cancelled'),
  Order(id: 4, total: 100.0, status: 'Delivered'),
  Order(id: 5, total: 45.0, status: 'Pending'),
];
