import 'package:esilv_shop/presentation/page/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cart.dart';

void main() {
  //final maListeDeProduit = [
  //  Product(
  //    name: "MonLivreFlutter",
  //    description: "C'est un livre sur flutter",
  //    price: 3000,
  //    category: "Livre",
  //    image: "https://jesais.com",
  //  ),
  //];
  //print(maListeDeProduit[0].getPriceInEuros());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            titleLarge: TextStyle(fontStyle: FontStyle.italic),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: DetailPage(),
      ),
    );
  }
}
