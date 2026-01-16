import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:drewardsystem/Home/bloc/home_bloc.dart';
import 'package:drewardsystem/Home/page.dart';
import 'package:drewardsystem/test/bloc/test_bloc.dart';
import 'package:drewardsystem/test/page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(DevicePreview(builder:(context) => const MyApp(),enabled: !kReleaseMode,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primaryTextTheme: TextTheme(),
            primarySwatch: Colors.blue,
            textTheme: TextTheme()
          ),
          home: child,
        );
      },
      child: BlocProvider(
        create: (context) => TestBloc(),
        child: TestHomeScreen()
      )
      // child:  BlocProvider(
      //   create: (context) => HomeBloc(),
      //   child: MyHomePage()
      // )
    );
  }
}

