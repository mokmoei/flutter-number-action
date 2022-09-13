import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;

  void botton() {
    if (number < 8) {
      setState(() {
        number = number + 1;
      });
    }
  }

  void bottonRemove() {
    if (number > -8) {
      setState(() {
        number = number - 1;
      });
    }
  }

  Color getColor() {
    if (number > 3) {
      return Colors.green;
    } else if (number < -3) {
      return Colors.red;
    }
    return Colors.black;
  }

  void onReset() {
    setState(() {
      number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("NUMBER ACTION"),
        actions: <Widget>[
          IconButton(
            onPressed: botton,
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: bottonRemove,
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: TextStyle(color: getColor(), fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onReset,
        child: const Icon(
          Icons.restart_alt,
        ),
      ),
    );
  }
}
