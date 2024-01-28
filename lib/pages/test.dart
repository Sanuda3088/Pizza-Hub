import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
    'lib/assets/p1.png',
    'lib/assets/p2.png',
    'lib/assets/p3.png',
    'lib/assets/p4.png',
  ];

Widget myCarousel() {
  return CarouselSlider(
      options: CarouselOptions(
        height: 500.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: imgList
          .map((item) => Container(
            color: Colors.black54,
                child: Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                ),
              ))
          .toList(),
    );
}
