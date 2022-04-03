import 'package:chat/routes/route_lists.dart';
import 'package:chat/routes/route_strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, devicetype) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: loginview!,
        getPages: RouteLists.lists,
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
          Locale('fr', ''),
          Locale('ru', ''),
          Locale('ph', ''),
          Locale('au', ''),
        ],
      ),
    );
  }
}
