import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "Yow";

  void changeText(String text) {
    this.setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello Serves')),
        body: Column(
          children: <Widget>[InputBoxWidget(this.changeText), Text(this.text)],
        ));
  }
}

class InputBoxWidget extends StatefulWidget {
  final Function(String) jaccallback;

  InputBoxWidget(this.jaccallback);

  @override
  _InputBoxWidgetState createState() => _InputBoxWidgetState();
}

class _InputBoxWidgetState extends State<InputBoxWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  // void changeText(text) {
  //   setState(() {
  //     this.text = text;
  //   });
  // }

  void click() {
    widget.jaccallback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: this.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: 'Find Products',
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              tooltip: "I don't know what will happen.",
              onPressed: this.click,
            ),
          ),
          // onChanged: (text) => changeText(text),
        ),
        // Text(this.text),
      ],
    );
  }
}
