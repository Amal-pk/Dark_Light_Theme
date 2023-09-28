import 'package:flutter/material.dart';
import 'package:light_/Constant/constant.dart';
import 'package:light_/Controller/controller.dart';
import 'package:light_/View/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isLightTheme = sharedPreferences.getBool(SPref.isLight) ?? true;
  runApp(AppStart(
    isLightProvider: isLightTheme,
  ));
}

class AppStart extends StatelessWidget {
  const AppStart({super.key, required this.isLightProvider});
  final bool isLightProvider;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(
          isLigthTheme: isLightProvider,
        ),
      )
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider controller = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.themeData(),
      home: const HomePage(),
    );
  }
}
