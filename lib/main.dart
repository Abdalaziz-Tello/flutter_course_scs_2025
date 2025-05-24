import 'package:auth_dummy/model/user_model.dart';
import 'package:auth_dummy/photo_page.dart';
import 'package:auth_dummy/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences storage;
void main()async {

UserModel user = UserModel(password: "123", username: "Ahmad");
print(user);
print(user.toMap());


  WidgetsFlutterBinding.ensureInitialized();
storage =await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: storage.getString('token')==null ? LogInPage():ProfilePage());
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
            user: UserModel(password: password.text, username: username.text)
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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: Text("Emily"), accountEmail: IconButton(onPressed: (){
              storage.clear();
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LogInPage(),));
            }, icon: Icon(Icons.logout)))
          ],
        ),
      ),
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(future: getMyProfile(), builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Image.network(snapshot.data!.image!),
                ListTile(
                  title: Text(snapshot.data!.address!.city!),
                  subtitle: Text(snapshot.data!.maidenName!),
                  leading: CircleAvatar(child: Text(snapshot.data!.age.toString()),),
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