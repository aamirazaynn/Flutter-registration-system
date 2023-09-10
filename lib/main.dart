import 'package:assignment3/providers/user_provider.dart';
import 'package:assignment3/screens/forgetPass.dart';
import 'package:assignment3/screens/home.dart';
import 'package:assignment3/screens/login.dart';
import 'package:assignment3/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/handler/shared_preference_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHandler().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: FutureBuilder<bool>(
        future: SharedPreferencesHandler().isUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final bool isLoggedIn = snapshot.data!;
            return MaterialApp(
              routes: {
                registation.id: (context) => registation(),
                login.id: (context) => login(),
                home.id: (context) => home(),
                forgetPass.id: (context) => forgetPass(),
              },
              initialRoute: isLoggedIn ? home.id : registation.id,
              debugShowCheckedModeBanner: false,
            );
          }
          return const Center(
            child: Text("No data"),
          );
        },
      ),
    );
  }
}
