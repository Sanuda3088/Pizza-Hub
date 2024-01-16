import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pizza_hub/components/pizza_toppings.dart';

class PizzaCustomizePage extends StatefulWidget {
  final String pizzaName;
  final String pizzaPrice;
  final String spizzaPrice;
  final String mpizzaPrice;
  final String lpizzaPrice;
  final String meatPrice = '1.48';
  final String cheesePrice = '\$0.99';
  final String pizzaImagePath;
  final String pizzaDescription;
  const PizzaCustomizePage(
      {super.key,
      required this.pizzaImagePath,
      required this.pizzaDescription,
      required this.pizzaName,
      required this.pizzaPrice,
      required this.spizzaPrice,
      required this.mpizzaPrice,
      required this.lpizzaPrice});

  @override
  State<PizzaCustomizePage> createState() => _PizzaCustomizePageState();
}

class _PizzaCustomizePageState extends State<PizzaCustomizePage> {
  late double width;
  late double height;
  String selectedSize = '';
  String selectedPrice = '';
  int count = 1;
  double totalPrice = 0.0;
  bool isExtraCheeseSelected = false;
  bool isExtraMeatSelected = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (width > 750) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black54,
                  ),
                  width: width * 0.8,
                  height: height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                              width: width * 0.4,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    color: Colors.orange,
                                    onPressed: decrementCount,
                                    icon: const Icon(Icons.remove),
                                  ),
                                  Text(
                                    count.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  IconButton(
                                    color: Colors.orange,
                                    onPressed: incrementCount,
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildPizzaSizeButton(
                                      "Small", widget.spizzaPrice),
                                  buildPizzaSizeButton(
                                      "Medium", widget.mpizzaPrice),
                                  buildPizzaSizeButton(
                                      "Large", widget.lpizzaPrice),
                                ],
                              ),
                              /*Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        toggleExtraCheese();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isExtraCheeseSelected
                                          ? Colors.orange
                                          : null,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "lib/assets/Icons/cheese.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        const Text("Extra Cheese"),
                                        Text(widget.cheesePrice)
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        toggleExtraMeat();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isExtraMeatSelected
                                          ? Colors.orange
                                          : null,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "lib/assets/Icons/meat.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        const Text("Extra Meat"),
                                        Text(widget.meatPrice)
                                      ],
                                    ),
                                  ),
                                ],
                              ),*/
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 38, 38, 38),
                                ),
                                width: width * 0.24,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        selectedPrice, // Display the selected price here
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                PizzaToppingsPage(
                                                    pizzaImagePath:
                                                        widget.pizzaImagePath,
                                                    pizzaName: widget.pizzaName,
                                                    pizzaDescription: widget
                                                        .pizzaDescription),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "lib/assets/Icons/add-to-cart.png",
                                            width: 25,
                                            height: 25,
                                          ),
                                          const Text("Customize")
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
                );
              } else {
                return Container(/*
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
                              width: width * 0.7,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    color: Colors.orange,
                                    onPressed: decrementCount,
                                    icon: const Icon(Icons.remove),
                                  ),
                                  Text(
                                    count.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  IconButton(
                                    color: Colors.orange,
                                    onPressed: incrementCount,
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildPizzaSizeButton(
                                      "Small", widget.spizzaPrice),
                                  buildPizzaSizeButton(
                                      "Medium", widget.mpizzaPrice),
                                  buildPizzaSizeButton(
                                      "Large", widget.lpizzaPrice),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: null,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "lib/assets/Icons/cheese.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        const Text("Extra Cheese ")
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: null,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "lib/assets/Icons/meat.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        const Text("Extra Meat")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: null,
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
                */);
              }
            },
          ),
        ),
      ),
    );
  }
/*
  void toggleExtraCheese() {
    if (isExtraCheeseSelected) {
      // Subtract the extra cheese price from the total
      totalPrice -= double.parse(widget.cheesePrice.substring(1));
    } else {
      // Add the extra cheese price to the total
      totalPrice += double.parse(widget.cheesePrice.substring(1));
    }
    // Toggle the selection
    isExtraCheeseSelected = !isExtraCheeseSelected;
    // Update the selected price
    updateSelectedPrice();
  }

  void toggleExtraMeat() {
    if (isExtraMeatSelected) {
      // Subtract the extra meat price from the total
      totalPrice -= double.parse(widget.meatPrice.substring(1));
    } else {
      // Add the extra meat price to the total
      totalPrice += double.parse(widget.meatPrice.substring(1));
    }
    // Toggle the selection
    isExtraMeatSelected = !isExtraMeatSelected;
    // Update the selected price
    updateSelectedPrice();
  }

  void updateSelectedPrice() {
    setState(() {
      selectedPrice =
          (double.parse(widget.pizzaPrice.substring(1)) + totalPrice)
              .toStringAsFixed(2);
    });
  }*/

  Widget buildPizzaSizeButton(String size, String price) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedSize = size;
          selectedPrice = price;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedSize == size
            ? Colors.orange
            : null, // Change color based on selection
      ),
      child: Column(
        children: [
          Text(
            size,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            price,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void decrementCount() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  void placeOrder() {
    final CollectionReference orders =
        FirebaseFirestore.instance.collection('Orders');
    DateTime now = DateTime.now();

    orders.add({
      //'PizzaName': widget.Name,
      //'PizzaPrice': widget.coffeePrice,
      'PizzaCount': count,
      'PizzaImagePath': widget.pizzaImagePath,
      'OrderDate': now,
      //'Name': globals.userName,
    }).then((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Added to Cart'),
          content: const Text('Your order has been added successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
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
}
