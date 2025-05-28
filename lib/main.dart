import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:water_provider/res/app_string.dart';
import 'package:water_provider/res/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/translate',
      fallbackLocale: Locale('en'),
    ),
  );
  changeTheme(name: "Ahmad", nickName: "Hamod", status: nameStatus.NAME);
}
enum nameStatus {
  NAME,NICKNAME
}

changeTheme({required String name,required String nickName,required nameStatus status}){
  if (status == nameStatus.NAME) {
    print(name);
  }else {
    print(nickName);
  }
}

bool isDark = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // ? Put isDark to change theme via the boolean
      themeMode: context.locale.languageCode=='ar'? ThemeMode.light : ThemeMode.dark ,
        darkTheme: darkTheme,
      theme:lightTheme,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(AppString().APPBARTITLE),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(AppString().INFO),
            Text(
              AppString().WELCOME,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (context.locale.languageCode == "ar") {
            context.setLocale(Locale('en'));
          } else {
            context.setLocale(Locale('ar'));
          }
        },
        tooltip: AppString().INCREAMENT,
        child: const Icon(Icons.add),
      ),
    );
  }
}
