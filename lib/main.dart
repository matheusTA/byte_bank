import 'package:byte_bank/database/app_database.dart';
import 'package:byte_bank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBankApp());
  findAll().then((contacts) => debugPrint(contacts.toString()));
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Byte bank',
      theme: ThemeData(
        primaryColor: Colors.green[900],
        primaryColorLight: Colors.green[700],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green[700],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const Dashboard(),
    );
  }
}
