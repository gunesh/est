import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:est_app/auth_wrapper.dart';
import 'package:est_app/services/hive_service.dart';
import 'package:est_app/utils/colors.dart';
import 'package:est_app/utils/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initializing flutter hive database
  await Hive.initFlutter();

  //Opening database of the saved walks
  await Future.wait([
    Hive.openBox(Boxes.selfMadeWalksBox),
    Hive.openBox(Boxes.activitiesBox),
    Hive.openBox(Boxes.authBox),
  ]);

  //Initialising dotenv variables
  // await dotenv.load(fileName: "assets/dotenv/.env");
  await dotenv.load(fileName: ".env");

  //Running flutter application
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quick Step Application',
          color: primary,
          theme: MyThemes.theme,
          home: child,
        );
      },
      child: const AuthWrapper(),
    );
  }
}

// // import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:est_app/models/self_made_walk.dart';
// import 'package:est_app/services/auth_service.dart';
// import 'package:est_app/utils/helpers.dart';

// // void main() => runApp(MyApp());
// void main() async {
//   //Initializing flutter hive database
//   await Hive.initFlutter();

//   // //Opening database of the saved walks
//   await Future.wait([
//     Hive.openBox(Boxes.selfMadeWalksBox),
//     Hive.openBox(Boxes.activitiesBox),
//     Hive.openBox(Boxes.authBox),
//   ]);

//   // //Initialising dotenv variables
//   // await dotenv.load(fileName: "assets/dotenv/.env");

//   //Running flutter application
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Application name
//       title: 'Employee Management System',
//       // Application theme data, you can set the colors for the application as
//       // you want
//       theme: ThemeData(
//         // useMaterial3: false,
//         primarySwatch: Colors.blue,
//       ),
//       // A widget which will be started on application startup
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;
//   const MyHomePage({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // The title text which will be shown on the action bar
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(
//           'Hello, fffWo rld!',
//         ),
//       ),
//     );
//   }
// }
