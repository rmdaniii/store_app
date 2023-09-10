import 'package:flutter/material.dart';
import 'package:store_app/screens/home.dart';

void main() {
  runApp( const HomePage());
}


class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        HomePage.id :(context) =>  const HomePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}


