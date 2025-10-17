import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('appbarTitle'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hello World 🙋🏽‍♂️"),
          OutlinedButton(onPressed: () {}, child: Text("dsf")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("FMLDSL"),
              Spacer(),
              Text("FMLDSL"),
              Text("FMLDSL"),
            ],
          ),
          Icon(Icons.add_alarm),
        ],
      ),
    );
  }
}
