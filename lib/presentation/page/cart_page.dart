//stless
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Panier Esilv Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Row(
              children: [
                Text("Votre panier total est de"),
                Spacer(),
                Text("0.00€", style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Votre panier est actuellement vide"),
                  Icon(Icons.image),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//fscaff ou scfAppBar
