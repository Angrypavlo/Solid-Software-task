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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
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
  int _counter = 0;
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  Timer? _colorTimer;
  void _incrementCounter() {
    setState(() {
      _counter++;
      b = Random().nextInt(256);
      c = Random().nextInt(256);
      a = Random().nextInt(256);
    });
  }

  void _startSmoothColorChange(LongPressStartDetails details) {
    _colorTimer?.cancel();

    _colorTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      _incrementCounter();
    });
  }

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
        onTap: _incrementCounter,
        onLongPressStart: _startSmoothColorChange,
        onLongPressEnd: _stopSmoothColorChange,
        child: AnimatedContainer(
          width: double.infinity,
          height: double.infinity,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          color: Color.fromRGBO(a, b, c, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Color have been changed this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
