import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_post_api/shared/cubit/bloc_observer.dart';
import 'package:login_post_api/shared/network/remote/dio_helper.dart';
import 'modules/login.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                systemNavigationBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark),
            elevation: 0.0),
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
