import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:search_repo/core/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/export.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
