import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Detective',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _backAnimationName = 'Start';
  String _buttonAnimationName = 'Idle';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            FlareActor("assets/openPage.flr",
                fit: BoxFit.cover,
                alignment: Alignment.center,
                animation: _backAnimationName),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.5),
              child: GestureDetector(
                onTap: _start,
                child: FlareActor(
                  "assets/LetsGoButton.flr",
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  animation: _buttonAnimationName,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _start() async {
    setState(() {
      if (_backAnimationName == "Start") {
        _backAnimationName = "Begin";
      }
      if (_buttonAnimationName == "Idle") {
        _buttonAnimationName = "go";
      }
    });
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return MyHomePage();
    }));
  }
}
