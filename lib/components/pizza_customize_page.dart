import 'package:flutter/material.dart';

class PizzaCustomizePage extends StatefulWidget {
  final String pizzaImagePath;
  final String pizzaDescription;
  const PizzaCustomizePage({super.key, required this.pizzaImagePath, required this.pizzaDescription});

  @override
  State<PizzaCustomizePage> createState() => _PizzaCustomizePageState();
}

class _PizzaCustomizePageState extends State<PizzaCustomizePage> {
  late double width;
  late double height;
  String selectedSize = '';
  int count = 1;
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
                                    image: AssetImage(
                                        widget.pizzaImagePath)),
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                    widget.pizzaDescription),
                              ),
                              Row(
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
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildPizzaSizeButton("Small"),
                                  buildPizzaSizeButton("Medium"),
                                  buildPizzaSizeButton("Large"),
                                ],
                              ),
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
                );
              } else {
                return Container(
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
                                    image: AssetImage(
                                        widget.pizzaImagePath)),
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                    widget.pizzaDescription),
                              ),
                              Row(
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
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildPizzaSizeButton("Small"),
                                  buildPizzaSizeButton("Medium"),
                                  buildPizzaSizeButton("Large"),
                                ],
                              ),
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
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildPizzaSizeButton(String size) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedSize = size;
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
}