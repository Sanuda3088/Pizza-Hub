import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_hub/pages/cart_page.dart';

class PizzaToppingsPage extends StatefulWidget {
  final String pizzaImagePath;
  final String pizzaName;
  final String pizzaDescription;
  final double pizzaPrice;
  final int pizzaCount;
  const PizzaToppingsPage(
      {super.key,
      required this.pizzaImagePath,
      required this.pizzaName,
      required this.pizzaDescription,
      required this.pizzaPrice,
      required this.pizzaCount});

  @override
  State<PizzaToppingsPage> createState() => _PizzaToppingsPageState();
}

class _PizzaToppingsPageState extends State<PizzaToppingsPage> {
  late double width;
  late double height;
  int count = 0;
  double totalPrice = 0.0;
  double meatPrice = 1.49;
  double cheesePrice = 0.99;
  bool isExtraCheeseSelected = false;
  bool isExtraMeatSelected = false;

  @override
  void initState() {
    super.initState();
    totalPrice = widget.pizzaPrice;
    count = widget.pizzaCount;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (width > 750) {
          return Scaffold(
            //backgroundColor: Colors.black87,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appBar(),
                  Padding(
                    padding: EdgeInsets.only(top: width*0.05),
                    child: toppings(),
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Classic Pizza",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            drawer: drawer(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [toppings()],
              ),
            ),
          );
        }
      },
    );
  }

  Widget toppings(){
    return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black54,
          ),
          width: width * 0.8,
          height: height * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.pizzaImagePath)),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black87,
                      ),
                      width: width * 0.5,
                      height: height * 0.5),
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.pizzaName),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(widget.pizzaDescription),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: toggleExtraCheese,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isExtraCheeseSelected
                                  ? Colors.orange // Change color when selected
                                  : null, // Use default color when not selected
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "lib/assets/Icons/cheese.png",
                                  width: 25,
                                  height: 25,
                                ),
                                const Text(
                                  "Extra Cheese",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const Text(
                                  "\$0.99",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: toggleExtraMeat,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isExtraMeatSelected
                                  ? Colors.orange // Change color when selected
                                  : null, // Use default color when not selected
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "lib/assets/Icons/meat.png",
                                  width: 25,
                                  height: 25,
                                ),
                                const Text(
                                  "Extra Meat",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const Text(
                                  "\$1.49",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        /*constraints: BoxConstraints(
                          minWidth: width*0.4
                        ),*/
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 38, 38, 38),
                        ),
                        width: width * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'Total: \$${totalPrice.toStringAsFixed(2)}', // Display the selected price here
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: placeOrder,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "lib/assets/Icons/add-to-cart.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  const Text("Add To Cart")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

    Widget appBar() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (width > 750) {
          return AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Pizza Hub'),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'About Us',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    /*TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Order Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),*/
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.person),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => CartPage(),
                ),
              );
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return const Drawer();
        }
      },
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'lib/assets/pizza_homePage.png',
                ),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.0),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Color.fromARGB(255, 238, 207, 52),
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              /*Navigator.pop(context as BuildContext);
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const UserHomePage(),
              ),
            );*/
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.groups,
              color: Color.fromARGB(255, 238, 207, 52),
            ),
            title: const Text(
              "About us",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.supervised_user_circle_outlined,
              color: Color.fromARGB(255, 238, 207, 52),
            ),
            title: const Text(
              "Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => CartPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.admin_panel_settings,
              color: Color.fromARGB(255, 238, 207, 52),
            ),
            title: const Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              /*Navigator.pop(context as BuildContext);
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AdminLoginPage(),
              ),
            );*/
            },
          ),
        ],
      ),
    );
  }
  

  void placeOrder() {
    final CollectionReference orders =
        FirebaseFirestore.instance.collection('Orders');
    DateTime now = DateTime.now();
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    String formattedTotalPrice = totalPrice.toStringAsFixed(2);
    orders.add({
      'PizzaName': widget.pizzaName,
      'PizzaPrice': formattedTotalPrice,
      'PizzaCount': count,
      'PizzaImagePath': widget.pizzaImagePath,
      'OrderDate': now,
      'UID': uid, 
    }).then((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Order Placed'),
          content: const Text('Your order has been placed successfully.'),
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
    }).catchError((error) {
      print('Error placing order: $error');
    });
  }

  void toggleExtraCheese() {
    setState(() {
      if (isExtraCheeseSelected) {
        // If Extra Cheese was selected, subtract the price
        totalPrice -= cheesePrice*count;
      } else {
        // If Extra Cheese was not selected, add the price
        totalPrice += cheesePrice*count;
      }

      // Toggle the selection state
      isExtraCheeseSelected = !isExtraCheeseSelected;
    });
  }

  void toggleExtraMeat() {
    setState(() {
      if (isExtraMeatSelected) {
        // If Extra Cheese was selected, subtract the price
        totalPrice -= meatPrice*count;
      } else {
        // If Extra Cheese was not selected, add the price
        totalPrice += meatPrice*count;
      }

      // Toggle the selection state
      isExtraMeatSelected = !isExtraMeatSelected;
    });
  }


}
