import 'package:flutter/material.dart';
import 'package:pizza_hub/components/pizza_customize_tile.dart';
import 'package:pizza_hub/pages/cart_page.dart';

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
                  pizzaList()
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
                children: [pizzaList()],
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

  Widget pizzaList() {
    return const Column(
      children: [
        PizzaCustomizePage(
            pizzaImagePath: "lib/assets/pizza_homePage.png",
            pizzaDescription:"Made with a flavourful combination of Chicken Ham, Spicy Chicken & Roast Chicken complemented with cream cheese, raisins, onions & mozzarella", 
            pizzaName: 'Pizza', 
            pizzaPrice: '\$4.00', 
            spizzaPrice: "\$2.00", 
            mpizzaPrice: "\$4.00", 
            lpizzaPrice: "\$6.00",
        ),
        /*PizzaCustomizePage(
            pizzaImagePath: "lib/assets/pizza_homePage.png",
            pizzaDescription:"Made with a flavourful combination of Chicken Ham, Spicy Chicken & Roast Chicken complemented with cream cheese, raisins, onions & mozzarella", pizzaName: '', pizzaPrice: '',
        ),
        PizzaCustomizePage(
            pizzaImagePath: "lib/assets/pizza_homePage.png",
            pizzaDescription:"Made with a flavourful combination of Chicken Ham, Spicy Chicken & Roast Chicken complemented with cream cheese, raisins, onions & mozzarella", pizzaName: '', pizzaPrice: '',
        ),*/
      ],
    );
  }
}
