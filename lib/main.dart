import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Solid software task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int red = 0;
  int green = 0;
  int blue = 0;
  // Change the duration here to adjust how quickly the color changes when long-pressing the screen
  static const int duration = 250;
  Timer? _colorTimer;
  // This method changes the color once by generating random RGB values
  void _changeColourOnce() {
    setState(() {
      red = Random().nextInt(256);
      green = Random().nextInt(256);
      blue = Random().nextInt(256);
    });
  }

  // This method starts a timer that changes the color every 300 milliseconds when the user long-presses the screen
  void _startSmoothColorChange(LongPressStartDetails details) {
    _colorTimer?.cancel();

    _colorTimer = Timer.periodic(const Duration(milliseconds: duration), (
      timer,
    ) {
      _changeColourOnce();
    });
  }

  // This method stops the timer when the user releases the long-press
  void _stopSmoothColorChange(LongPressEndDetails details) {
    _colorTimer?.cancel();
    _colorTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: _changeColourOnce,
        onLongPressStart: _startSmoothColorChange,
        onLongPressEnd: _stopSmoothColorChange,
        // The AnimatedContainer widget smoothly transitions between colors when the RGB values change
        child: AnimatedContainer(
          width: double.infinity,
          height: double.infinity,
          duration: const Duration(milliseconds: duration),
          curve: Curves.easeInOut,
          color: Color.fromRGBO(red, green, blue, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello there',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              /* 
              Following code displays the current RGB values of the color
              */
              // Padding(
              //   padding: const EdgeInsets.only(top: 30),
              //   child: Text('Current color is:'),
              // ),
              // Text(
              //   'RGB($a, $b, $c)',
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
