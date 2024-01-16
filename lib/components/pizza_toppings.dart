import 'package:flutter/material.dart';

class PizzaToppingsPage extends StatefulWidget {
  final String pizzaImagePath;
  final String pizzaName;
  final String pizzaDescription;
  const PizzaToppingsPage(
      {super.key,
      required this.pizzaImagePath,
      required this.pizzaName,
      required this.pizzaDescription});

  @override
  State<PizzaToppingsPage> createState() => _PizzaToppingsPageState();
}

class _PizzaToppingsPageState extends State<PizzaToppingsPage> {
  late double width;
  late double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
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
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      ),*/
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildPizzaSizeButton("Small", widget.spizzaPrice),
                          buildPizzaSizeButton("Medium", widget.mpizzaPrice),
                          buildPizzaSizeButton("Large", widget.lpizzaPrice),
                        ],
                      ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        ),
      ),
    );
  }
}
