import 'package:flutter/material.dart';
import 'package:pizza_hub/components/pizza_customize_tile.dart';

class SupremePizzaPage extends StatefulWidget {
  const SupremePizzaPage({super.key});

  @override
  State<SupremePizzaPage> createState() => _SupremePizzaPageState();
}

class _SupremePizzaPageState extends State<SupremePizzaPage> {
  late double width;
  late double height;
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
                "Supreme Pizza",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            drawer: drawer(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pizzaList()
                ],
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

  Widget pizzaList() {
    return const Column(
      children: [
        PizzaCustomizePage(
          pizzaImagePath: "lib/assets/pizza_homePage.png",
          pizzaDescription:
              "A combination of BBQ chicken, chicken bacon, chicken sausage & an all new roast chicken, accompanied with the freshest green pepper, mushroom, onion and green chilli, blanketed with delicious mozzarella cheese,",
          pizzaName: 'The Ultimate Chicken Treat',
          pizzaPrice: '\$5.99',
          spizzaPrice: "\$3.99",
          mpizzaPrice: "\$5.99",
          lpizzaPrice: "\$7.99",
        ),
        PizzaCustomizePage(
          pizzaImagePath: "lib/assets/pizza_homePage.png",
          pizzaDescription:
              "Roast chicken, chicken bacon, chicken sausage, beef pepperoni, pineapple, bell pepper, mushroom, onion and olive with a double layer of mozzarella cheese",
          pizzaName: 'Super Supreme',
          pizzaPrice: '\$5.99',
          spizzaPrice: "\$3.99",
          mpizzaPrice: "\$5.99",
          lpizzaPrice: "\$7.99",
        ),
        PizzaCustomizePage(
          pizzaImagePath: "lib/assets/pizza_homePage.png",
          pizzaDescription: "Spicy prawns, hot garlic sauce, onions, peppers and tomatoes with a double layer of mozzarella cheese.",
          pizzaName: 'Hot Garlic Prawns',
          pizzaPrice: '\$5.99',
          spizzaPrice: "\$3.99",
          mpizzaPrice: "\$5.99",
          lpizzaPrice: "\$7.99",
        ),
      ],
    );
  }
}
