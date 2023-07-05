import 'package:flutter/material.dart';

import '../exports_all.dart';

const black = Colors.black;
const white = Colors.white;
const transparent = Colors.transparent;

const customBlue = Color(0xff4069C3);

List<SplashModel> splashList = [
  SplashModel(
      heading: 'Training',
      body:
          'A well-designed training plan is essential for achieving fitness goals, providing structure, progression, and guidance for effective workouts.',
      imageSrc: 'assets/images/train_girl_'),
  SplashModel(
      heading: 'Meal',
      body:
          'A thoughtfully crafted meal plan ensures a balanced and nutritious diet, supporting optimal health, weight management, and providing necessary fuel for physical activity.',
      imageSrc: 'assets/images/train_girl_'),
  SplashModel(
      heading: 'Supplement',
      body:
          'A supplement plan should be approached with caution, as it is important to assess individual needs and consult with professionals to determine if specific supplements are necessary or beneficial for overall well-being and fitness goals.',
      imageSrc: 'assets/images/train_girl_')
];
