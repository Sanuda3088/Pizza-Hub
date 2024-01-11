import 'package:flutter/material.dart';

class ClassicPizzaPage extends StatefulWidget {
  const ClassicPizzaPage({super.key});

  @override
  State<ClassicPizzaPage> createState() => _ClassicPizzaPageState();
}

class _ClassicPizzaPageState extends State<ClassicPizzaPage> {
  late double width;
  late double height;
  int count = 1;
  String selectedSize = '';

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
                  item(),
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
                children: [item()],
              ),
            ),
          );
        }
      },
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
                      onPressed: () {},
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
              /*Navigator.push(
              context as BuildContext,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const UserHomePage(),
              ),
            );*/
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

  Widget item() {
    return FittedBox(
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
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                                "Rich tomato sauce base topped with cream cheese, onions, green chillies & Mozzarella."),
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
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                                "Rich tomato sauce base topped with cream cheese, onions, green chillies & Mozzarella."),
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
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
