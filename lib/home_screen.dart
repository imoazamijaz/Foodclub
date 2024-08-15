import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'my_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool showText = false;
  bool showFirst = false;
  bool showSecond = false;
  bool showThird = false;
  bool showFourth = false;
  bool showFifth = false;
  bool showSixth = false;

  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 1 * pi * 3).animate(_controller);

    _startAnimationSequence();
  }

  void _startAnimationSequence() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        showText = true;
      });
    });
    Timer(const Duration(seconds: 2), () {
      setState(() {
        showFirst = true;
      });
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        showSecond = true;
      });
    });
    Timer(const Duration(seconds: 4), () {
      setState(() {
        showThird = true;
      });
    });
    Timer(const Duration(seconds: 5), () {
      setState(() {
        showFourth = true;
      });
    });
    Timer(const Duration(seconds: 6), () {
      setState(() {
        showFifth = true;
      });
    });
    Timer(const Duration(seconds: 7), () {
      setState(() {
        showSixth = true;
      });
      Timer(const Duration(seconds: 1), () {
        _controller.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double centerX = screenWidth / 2;
    final double centerY = screenHeight / 2;
    const double radius = 150;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.orange],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            // Text Animation
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: showText ? screenHeight / 2 - 70 : -100,
              left: 0,
              right: 0,
              child:  Center(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'MIX&\n',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 0.9,
                        ),
                      ),
                      TextSpan(
                        text: 'MATCH!\n',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 0.9,
                        ),
                      ),
                      TextSpan(
                        text: '\$5.99',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 0.9,
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            // Rotating images
            AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Stack(
                  children: [
                    Positioned(
                      top: centerY + radius * sin(_rotationAnimation.value) - 50,
                      left: centerX + radius * cos(_rotationAnimation.value) - 50,
                      child: Visibility(
                        visible: showFirst,
                        child: Image.asset(MyImages.item5, width: 100),
                      ),
                    ),
                    Positioned(
                      top: centerY + radius * sin(_rotationAnimation.value + 2 * pi / 6) - 50,
                      left: centerX + radius * cos(_rotationAnimation.value + 2 * pi / 6) - 50,
                      child: Visibility(
                        visible: showSecond,
                        child: Image.asset(MyImages.item3, width: 100),
                      ),
                    ),
                    Positioned(
                      top: centerY + radius * sin(_rotationAnimation.value + 4 * pi / 6) - 50,
                      left: centerX + radius * cos(_rotationAnimation.value + 4 * pi / 6) - 50,
                      child: Visibility(
                        visible: showThird,
                        child: Image.asset(MyImages.item4, width: 100),
                      ),
                    ),
                    Positioned(
                      top: centerY + radius * sin(_rotationAnimation.value + 6 * pi / 6) - 50,
                      left: centerX + radius * cos(_rotationAnimation.value + 6 * pi / 6) - 50,
                      child: Visibility(
                        visible: showFourth,
                        child: Image.asset(MyImages.item6, width: 100),
                      ),
                    ),
                    Positioned(
                      top: centerY + radius * sin(_rotationAnimation.value + 8 * pi / 6) - 50,
                      left: centerX + radius * cos(_rotationAnimation.value + 8 * pi / 6) - 50,
                      child: Visibility(
                        visible: showFifth,
                        child: Image.asset(MyImages.item1, width: 100),
                      ),
                    ),
                    Positioned(
                      top: centerY + radius * sin(_rotationAnimation.value + 10 * pi / 6) - 50,
                      left: centerX + radius * cos(_rotationAnimation.value + 10 * pi / 6) - 50,
                      child: Visibility(
                        visible: showSixth,
                        child: Image.asset(MyImages.item4, width: 100),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
