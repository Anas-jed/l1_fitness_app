import 'dart:developer';

import 'package:flutter/material.dart';

import '../exports_all.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int pageIndex = 0;
  
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: splashList.length,
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              // _pageController. = value.toDouble();
              pageIndex = value;
            });
            setState(() {
              log('pageChanged: ${_pageController.page}');
            });
          },
          itemBuilder: (context, index) {
            final item = splashList[index];
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('${item.imageSrc}${index + 1}.jpg',
                    fit: BoxFit.cover),
                Align(
                  alignment: const Alignment(0, -0.7),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/white_logo.png',
                          height: 50,
                          width: 50,
                        ),
                        if (pageIndex != 2)
                          InkWell(
                            onTap: () {
                              log('On Pressed');
                              _pageController.animateToPage(2,
                                  curve: Curves.easeInOut,
                                  duration: const Duration(milliseconds: 500));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Skip'.toUpperCase(),
                                  style: TextStyle(
                                      color: white.withOpacity(0.8),
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: white.withOpacity(0.8),
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.heading,
                          style: const TextStyle(
                              color: white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          item.body,
                          style: const TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.6),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: pageIndex == 0.0
                                  ? white
                                  : white.withOpacity(0.5),
                              shape: BoxShape.circle),
                          height: 10,
                          width: 10,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: pageIndex == 1.0
                                  ? white
                                  : white.withOpacity(0.5),
                              shape: BoxShape.circle),
                          height: 10,
                          width: 10,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: pageIndex == 2.0
                                  ? white
                                  : white.withOpacity(0.5),
                              shape: BoxShape.circle),
                          height: 10,
                          width: 10,
                        ),
                      ]),
                ),
                Align(
                  alignment: const Alignment(0, 0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          log('On Pressed');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                            border: Border.all(color: white, width: 2.0),
                          ),
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: const Text(
                            'Login',
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(28.0)),
                        child: const Text(
                          'Signup',
                          style: TextStyle(color: black, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
