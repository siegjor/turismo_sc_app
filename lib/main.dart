import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismo_sc_app/controllers/home_provider.dart';
import 'package:turismo_sc_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Turismo SC',
        theme: ThemeData(
          primaryColor: Colors.redAccent[100],
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
