import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('appbarTitle'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 120),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Titre",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text("Prix"),
            ],
          ),
          Text("Description"),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(onPressed: () {}, child: Text("Ajouter")),
          ),
        ],
      ),
    );
  }
}
