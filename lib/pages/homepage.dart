import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double width;
  late double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Colors.black87,
      body: ListView(children: [appBar(), welcomeMessage()]),
    );
  }

  Widget appBar() {
    return AppBar(
      //backgroundColor: Colors.black87,
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
                onPressed: () {},
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
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget welcomeMessage() {
    return SizedBox(
      width: width * 0.9,
      height: height * 0.9,
      child: Column(
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
                        image: AssetImage('lib/assets/pizza_homePage.png'),
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
                  onPressed: null, icon: Icon(Icons.arrow_downward_outlined))
            ],
          ),
        ],
      ),
    );
  }
}
