import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:drewardsystem/screens/lottie/bindings.dart';
import 'package:drewardsystem/screens/lottie/page.dart';
import 'package:drewardsystem/screens/search/page.dart';
import 'package:drewardsystem/screens/search/search_mock_api.dart';
import 'package:drewardsystem/screens/search/search_test.dart';
import 'package:drewardsystem/screens/todo_screen/page.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

// Source - https://stackoverflow.com/a
// Posted by Mangaldeep Singh Pannu, modified by community. See post 'Timeline' for change history
// Retrieved 2026-01-19, License - CC BY-SA 4.0

// class A {
//   void foo() {
//     print("Class A");
//   }
// }

// class B extends A {}

// class C extends A {
//   @override
//   void foo() {
//     // TODO: implement foo
//     super.foo();
//   }
//   // @override foo() {
//   //   print("Class C");
//   // }
// }

// void main() {
//   A a = A();
//   B b = B();
//   C c = C();
//   a.foo();
//   b.foo();
//   c.foo();
// }

void main() {
  runApp(
    DevicePreview(builder: (context) => const MyApp(), enabled: !kReleaseMode),
  );
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
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primaryTextTheme: TextTheme(),
            primarySwatch: Colors.blue,
            textTheme: TextTheme(),
          ),
          // home: child,
          initialRoute: '/',
          getPages: [
            GetPage(
              name: '/',
              page: () => LottiePage(),
              binding: LottieBindings(),
            ),
          ],
        );
      },
      // child:  TestMockAPiScreen(),
      // child: LottiePage(),
      // child: ScreenTodo(),
      // child: BlocProvider(
      //   create: (context) => TestBloc(),
      //   child: TestHomeScreen()
      // )
      // child:  BlocProvider(
      //   create: (context) => HomeBloc(),
      //   child: MyHomePage()
      // )
    );
  }
}
