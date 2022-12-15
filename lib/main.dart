import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tach_panda_test/ui/constant/colors.dart';
import 'package:tach_panda_test/ui/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: AppColor.colorPrimary,
        systemNavigationBarIconBrightness: Brightness.light),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Panda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        backgroundColor: AppColor.colorPrimary,
        scaffoldBackgroundColor: AppColor.colorPrimary,
      ),
      home: const HomeScreen(),
    );
  }
}
