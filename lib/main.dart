import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // here created an object of myApp class
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  // curernt rendering happens in this state
  // state variable
  var name = ""; //now this has become property of this class
  @override
  Widget build(BuildContext context) {
    var greetStyle = const TextStyle(
        fontSize:
            24); //this is an object of type textstyle - TextStyle(fontSize: 24);
    return Column(
      //this return here is just one expression
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text(
                "Hello $name",
                style: greetStyle,
              ), //this is a constructor,we are giving arguement, TextStyle is another class
              Text(" !!", style: greetStyle),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
              onChanged: (value) => setState(() {
                    // setState is a method of State class, that recieves a function as an argument, and that function is executed when the state changes
                    name = value;
                  })),
        ),
      ],
    );
  }
}

class HelloWorld extends StatelessWidget {
  //it a constructor, recieves a key, and passing it to the super class, because it is mandatory
  const HelloWorld({super.key});

  @override // this is an annotation, it is used to override the method of the parent class
  Widget build(BuildContext context) {
    //Widget here is a return type
    return const Text("Hello World");
  }
}

class MyApp extends StatelessWidget {
  //it a constructor, recieves a key, and passing it to the super class, because it is mandatory
  const MyApp({super.key});

  // @override-is an annotation, it is used to override the method of the parent class
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roasted Beans Coffee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Roasted Beans Coffee'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Greet(),
    );
  }
}
