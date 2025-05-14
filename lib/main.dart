import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences storage;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 storage =await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: 
    storage.getString('email')==null ?LoginPage() :HomePage()
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
        }, icon: Icon(Icons.home)),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: mykey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value!)) {
                  } else {
                    return "Please Enter Valid Email";
                  }
                },
                controller: email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (RegExp(
                    r"[0-9]",
                  ).hasMatch(value!)) {
                    
                  }else {
                    return "Pleas Enter Correct phone number";
                  }
                },
                controller: phone,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mykey.currentState!.validate()) {
            storage.setString('email', email.text);
            Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(),))
;          }
        },
      ),
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Directory.current.path);
    return Scaffold(
      appBar: AppBar(
        title: Text(storage.getString("email")!),
      ),
      body: Column(
        children: [
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB6jQH76Aqx2EmQaDmxPhhwQWC3tys6xFyOg&s",errorBuilder: (context, error, stackTrace) => FlutterLogo(),),
          Image.file(File("/Users/abdtll/Desktop/cat.jpeg")),
          Image.asset('assets/cat.jpeg'),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Text("Log out"),
        onPressed: () {
        storage.clear();
      },),
    );
  }
}