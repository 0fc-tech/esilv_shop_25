import 'package:flutter/material.dart';

class DemoListview extends StatelessWidget {
  const DemoListview({super.key});
  static const listeCourses = [
    'Pommes',
    'Poires',
    'Bananes',
    'Oranges',
    'Fraises',
    'Cerises',
    'Kiwis',
    'Mangues',
    'Ananas',
    'Avocats',
    'Tomates',
    'Carottes',
    'Pommes de terre',
    'Oignons',
    'Ail',
    'Poivrons',
    'Concombres',
    'Salade',
    'Chou',
    'Brocoli',
    'Chou-fleur',
    'Épinards',
    'Laitues',
    'Betteraves',
    'Radis',
    'Courgettes',
    'Aubergines',
    'Poivrons',
    'Tomates',
    'Haricots verts',
    'Haricots rouges',
    'Pois chiches',
    'Lentilles',
    'Pois cassés',
    'Pois mangets',
    'Pois chiches',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Demo ListView'),
      ),
      body: ListView.builder(
        itemCount: listeCourses.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(listeCourses[index]),
              trailing: Icon(Icons.call),
            ),
          );
        },
      ),
    );
  }
}
