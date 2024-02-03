import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_hub/components/pizza_tile.dart';
import 'package:pizza_hub/controllers/auth.dart';
import 'package:pizza_hub/pages/cart_page.dart';
import 'package:pizza_hub/pages/classic_pizza.dart';
import 'package:pizza_hub/pages/homepage_breg.dart';
import 'package:pizza_hub/pages/signature_pizza.dart';
import 'package:pizza_hub/pages/supreme_pizza.dart';
import 'package:pizza_hub/pages/test.dart';

class AfterHomePage extends StatefulWidget {
  const AfterHomePage({super.key});

  @override
  State<AfterHomePage> createState() => _AfterHomePageState();
}

class _AfterHomePageState extends State<AfterHomePage> {
  late double width;
  late double height;
  late String userName;
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    userName = user?.displayName ?? 'User';
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (width > 750) {
          return Scaffold(
            //backgroundColor: Colors.black87,
            body: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appBar(),
                    Text("Welcome $userName"),
                    welcomeMessage(),
                    menu(),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "PizzaHub",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            drawer: drawer(),
            body: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    welcomeMessage(),
                    menu(),
                  ],
                ),
              ],
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
            backgroundColor: Colors.black38,
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
                    TextButton(
                      onPressed: () {
                        /*showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: SizedBox(
                                width: 400, // Set the width
                                height: 440,
                                child: AlertDialog(
                                  contentPadding: const EdgeInsets.all(5),
                                  content: const SignUp(),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Close the dialog
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );*/
                      },
                      child: const Text(
                        'Order Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
              Icons.search,
              color: Color.fromARGB(255, 238, 207, 52),
            ),
            title: const Text(
              "About US",
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
              Icons.groups,
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
              Icons.supervised_user_circle_outlined,
              color: Color.fromARGB(255, 238, 207, 52),
            ),
            title: const Text(
              "Order Now",
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
          ListTile(
            leading: const Icon(
              Icons.admin_panel_settings,
              color: Color.fromARGB(255, 238, 207, 52),
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () async {
              Auth auth = Auth();
              await auth.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget welcomeMessage() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (width > 750) {
          return Container(
            constraints: BoxConstraints(minHeight: height * 0.9),
            width: width,
            //height: height*0.9,
            child: myCarousel()/*Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: const Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              Text(
                                'Order your special Pizza!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Our true Italian pizza is made for you to feel and taste delicious. It will bring warmth and Italian taste right into your heart!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          width: width * 0.4,
                          height: height * 0.7,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('lib/assets/pizza_homePage.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Find Your Favorite Pizza',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.arrow_downward_outlined))
                  ],
                ),
              ],
            ),*/
          );
        } else {
          return Container(
            constraints: BoxConstraints(minHeight: height * 0.9),
            width: width * 0.9,
            //height: height*0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Order your special Pizza!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Our true Italian pizza is made for you to feel and taste delicious. It will bring warmth and Italian taste right into your heart!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          width: width * 0.4,
                          height: height * 0.7,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('lib/assets/pizza_homePage.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Find Your Favorite Pizza',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.arrow_downward_outlined))
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget menu() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (width > 750) {
          return Padding(
            padding: const EdgeInsets.only(top: 40,bottom: 40),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PizzaTileHome(
                    pizzaImagePath: "lib/assets/pizza_homePage.png",
                    pizzaName: "Classic",
                    onImageTap: (BuildContext) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const ClassicPizzaPage(),
                        ),
                      );
                    },
                  ),
                  PizzaTileHome(
                    pizzaImagePath: "lib/assets/pizza_homePage.png",
                    pizzaName: "Signature",
                    onImageTap: (BuildContext) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const SignaturePizzaPage(),
                        ),
                      );
                    },
                  ),
                  PizzaTileHome(
                    pizzaImagePath: "lib/assets/pizza_homePage.png",
                    pizzaName: "Supreme",
                    onImageTap: (BuildContext) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const SupremePizzaPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: height * 0.5,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      PizzaTileHome(
                        pizzaImagePath: "lib/assets/pizza_homePage.png",
                        pizzaName: "Classic",
                        onImageTap: (BuildContext) {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const ClassicPizzaPage(),
                            ),
                          );
                        },
                      ),
                      PizzaTileHome(
                        pizzaImagePath: "lib/assets/pizza_homePage.png",
                        pizzaName: "Signature",
                        onImageTap: (BuildContext) {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) =>
                                  const SignaturePizzaPage(),
                            ),
                          );
                        },
                      ),
                      PizzaTileHome(
                        pizzaImagePath: "lib/assets/pizza_homePage.png",
                        pizzaName: "Supreme",
                        onImageTap: (BuildContext) {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const SupremePizzaPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
       }
      },
    );
  }
}
