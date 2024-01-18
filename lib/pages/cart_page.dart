import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  User? user;
  String? uid;
  List<QueryDocumentSnapshot> userOrders = [];
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('Orders');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      retrieveOrders();
    });
  }

  Future<void> retrieveOrders() async {
    final CollectionReference orders =
        FirebaseFirestore.instance.collection('Orders');
    user = FirebaseAuth.instance.currentUser;
    uid = user!.uid;

    // Retrieve all orders:
    QuerySnapshot querySnapshot = await orders.get();
    List<QueryDocumentSnapshot> allOrders = querySnapshot.docs;

    // Filter orders by a specific condition:
    QuerySnapshot filteredSnapshot =
        await orders.where('UID', isEqualTo: uid).get();
    userOrders = filteredSnapshot.docs;

    setState(() {}); // Call setState to trigger a rebuild of the widget
  }

  Future<void> delete(String orderId) async {
    await orders.doc(orderId).delete();
    showDeleteDialog();
  }

  void showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Order Canceled'),
        content: const Text('Your order has been canceled successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => CartPage(),
                ),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: userOrders.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userOrders.length,
              itemBuilder: (context, index) {
                var order = userOrders[index];
                String pizzaName = order.get('PizzaName');
                double pizzaPrice =
                    double.parse(order.get('PizzaPrice') ?? '0');
                int pizzaCount = order.get('PizzaCount');
                String pizzaImagePath = order.get('PizzaImagePath');
                DateTime orderDate = order.get('OrderDate').toDate();

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black38,
                        height: 120,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 130,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(pizzaImagePath),
                              ),
                            ),
                            SizedBox(
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      pizzaName,
                                      style: const TextStyle(fontSize: 25),
                                    ),
                                    Text('\$$pizzaPrice',
                                        style: const TextStyle(fontSize: 20))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    pizzaCount.toString(),
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                  IconButton(
                                    color: Colors.orange,
                                    onPressed: () => delete(order.id),
                                    icon: const Icon(Icons.delete, size: 30),
                                  ),
                                  /*Text(
                                  'Ordered on ${DateFormat('dd MMMM yyyy, HH:mm').format(orderDate)}',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),*/
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}




/*
//////////////////////////////////////////////////////////////
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: orders
            .where("UID", isEqualTo: uid)
            .orderBy("OrderDate")
            .snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!streamSnapshot.hasData) {
            return const Center(
              child: Text('No orders found.'),
            );
          }
          final ordersData = streamSnapshot.data!;
          return ListView.builder(
            itemCount: ordersData.size,
            itemBuilder: (context, index) {
              final documentSnapshot = ordersData.docs[index];
              final pizzaName =
                  documentSnapshot['PizzaName'] as String? ?? '';
              final pizzaPrice =
                  documentSnapshot['PizzaPrice'] as String? ?? '';
              final pizzaCount = documentSnapshot['PizzaCount'] as int? ?? 0;
              final pizzaImagePath =
                  documentSnapshot['PizzaImagePath'] as String? ?? '';

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black38,
                      height: 120,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(pizzaImagePath),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    pizzaName,
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                  const Text('with Almond milk'),
                                  Text('\$$pizzaPrice',
                                      style: const TextStyle(fontSize: 20))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  pizzaCount.toString(),
                                  style: const TextStyle(fontSize: 22),
                                ),
                                IconButton(
                                  color: Colors.orange,
                                  onPressed: () => delete(documentSnapshot.id),
                                  icon: const Icon(Icons.delete, size: 30),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }*/
}
*/