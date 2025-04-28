import 'package:flutter/material.dart';

void main() {
  runApp(SkypeSplashScreen());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Hello World")),
          backgroundColor: Colors.red,
          leading: FlutterLogo(),
        ),
        body: Center(child: Text("Hello World")),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Yalla Go !!!", style: TextStyle(fontSize: 32)),
                Container(width: 90, height: 9, color: Colors.blue),
                // FlutterLogo()
              ],
            ),
          ),
        ),
        bottomNavigationBar: LinearProgressIndicator(color: Colors.black),
      ),
    );
  }
}

class SkypeSplashScreen extends StatelessWidget {
  const SkypeSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(100)),
                Container(
                  child: Center(
                    child: Text(
                      "S",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(130)),
                Container(
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 20, height: 20, color: Colors.white),
                      Text(
                        "   Microsoft",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 141, 214, 248),
                Colors.blueAccent,
              ],
            ),
          ),
          // width: 200,
          // height: 200,
          // color: Colors.blue,
          // child: Text("Hello World"),
        ),
      ),
    );
  }
}
