import 'package:flutter/material.dart';
import 'package:pizza_hub/components/pizza_customize_tile.dart';
import 'package:pizza_hub/pages/homepage_breg.dart';

class SignaturePizzaPage extends StatefulWidget {
  const SignaturePizzaPage({super.key});

  @override
  State<SignaturePizzaPage> createState() => _SignaturePizzaPageState();
}

class _SignaturePizzaPageState extends State<SignaturePizzaPage> {
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
              title: const Text("Signature Pizza",style: TextStyle(color: Colors.white,fontSize: 18),),
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
                      onPressed: ()=> const HomePage(),
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
            pizzaDescription:"Spicy veggie masala & paneer accompanied with pineapple, topped with double layer of cheese", 
            pizzaName: 'Spicy Veggie with Paneer', 
            pizzaPrice: '\$4.99', 
            spizzaPrice: "\$2.99", 
            mpizzaPrice: "\$4.99", 
            lpizzaPrice: "\$6.99",
        ),
        PizzaCustomizePage(
            pizzaImagePath: "lib/assets/pizza_homePage.png",
            pizzaDescription:"A succulent fusion of Creamy Cuttlefish & Prawns combined with Devilled Prawns, green chillies & onion, topped with delicious mozzarella", 
            pizzaName: 'Seafood Treat', 
            pizzaPrice: '\$4.99', 
            spizzaPrice: "\$2.99", 
            mpizzaPrice: "\$4.99", 
            lpizzaPrice: "\$6.99",
        ),
        PizzaCustomizePage(
            pizzaImagePath: "lib/assets/pizza_homePage.png",
            pizzaDescription:"Devilled chicken in spicy sauce with a double layer of cheese.", 
            pizzaName: 'Devilled Chicken', 
            pizzaPrice: '\$4.99', 
            spizzaPrice: "\$2.99", 
            mpizzaPrice: "\$4.99", 
            lpizzaPrice: "\$6.99",
        ),
        PizzaCustomizePage(
            pizzaImagePath: "lib/assets/pizza_homePage.png",
            pizzaDescription:"BBQ chicken accompanied by spicy jalapenos, onions and a double layer of cheese.", 
            pizzaName: 'BBQ Chicken', 
            pizzaPrice: '\$4.99', 
            spizzaPrice: "\$2.99", 
            mpizzaPrice: "\$4.99", 
            lpizzaPrice: "\$6.99",
        ),
        PizzaCustomizePage(
            pizzaImagePath: "lib/assets/pizza_homePage.png",
            pizzaDescription:"Chicken ham & pineapple with a double layer of cheese", 
            pizzaName: 'Chicken Hawaian', 
            pizzaPrice: '\$4.99', 
            spizzaPrice: "\$2.99", 
            mpizzaPrice: "\$4.99", 
            lpizzaPrice: "\$6.99",
        ),
        PizzaCustomizePage(
            pizzaImagePath: "lib/assets/pizza_homePage.png",
            pizzaDescription:"The ever famous Butter Masala Chicken together with a layer of cream cheese, fresh onions, coriander, ginger and garlic, blanketed with a layer of mozzarella cheese.", 
            pizzaName: 'Butter Chicken Masala', 
            pizzaPrice: '\$4.99', 
            spizzaPrice: "\$2.99", 
            mpizzaPrice: "\$4.99", 
            lpizzaPrice: "\$6.99",
        ),
        PizzaCustomizePage(
            pizzaImagePath: "lib/assets/pizza_homePage.png",
            pizzaDescription:"A combination of kotchchi chicken sausage meat and spicy chicken with crunchy onions and jalapenos placed on a layer of cream cheese and a layer of mozzarella.", 
            pizzaName: 'Double Chicken & Cheese Fiesta', 
            pizzaPrice: '\$4.99', 
            spizzaPrice: "\$2.99", 
            mpizzaPrice: "\$4.99", 
            lpizzaPrice: "\$6.99",
        ),
      ],
    );
  }

}