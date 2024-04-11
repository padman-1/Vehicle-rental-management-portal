import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/pages/home/view/home_page.dart';
import 'package:vehicle_rental_management_portal/pages/login/view/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  bool isLoggedin = FirebaseAuth.instance.currentUser != null;
  runApp(MyApp(
    isLoggedin: isLoggedin,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.isLoggedin,
  });
  final bool isLoggedin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedin ? HomePage() : const LoginPage(),
    );
  }
}
