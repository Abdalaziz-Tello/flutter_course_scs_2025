import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purpleAccent,
        body:FlutterLogo(size: 200,),
        floatingActionButton: FlutterLogo(),
      
        bottomNavigationBar: FlutterLogo(),
      ),
    );
  }


}


// abstract class Example {

//  FlutterLogo build();
// }


// class Page extends Example {

//   @override
//   build() {
//     return FlutterLogo();
//   }
// }