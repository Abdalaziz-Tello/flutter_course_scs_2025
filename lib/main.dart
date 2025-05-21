import 'package:auth_dummy/service/auth_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LogInPage());
  }
}

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: username,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Padding(padding: EdgeInsetsGeometry.all(20)),
          TextField(
            controller: password,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool status = await logIn(
            username: username.text,
            password: password.text,
          );
          if (status) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
          }else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Pleas Try again",),),);
          }
        },
      ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(future: getMyProfile(), builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String,dynamic> map = snapshot.data as Map<String,dynamic>;
            return Column(
              children: [
                Image.network(map['image']),
                ListTile(
                  title: Text(map['email']),
                  subtitle: Text(map['lastName']),
                  leading: CircleAvatar(child: Text(map['age'].toString()),),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
            
          }
        },),
      ),
    );
  }
}