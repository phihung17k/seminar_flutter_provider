import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_page.dart';
import 'model/counter_model.dart';
import 'store_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Seminar"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CounterPage(),
                  ));
                },
                child: const Text("Counter Page")),
            ElevatedButton(
                onPressed: () {
                  CounterModel model = Provider.of<CounterModel>(
                      context, listen: false);
                  model.incrementCounter();
                },
                child: const Text("Increment counter")),
            ElevatedButton(
                onPressed: () {
                  CounterModel model = Provider.of<CounterModel>(
                      context, listen: false);
                  model.decrementCounter();
                },
                child: const Text("Decrement counter")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => StorePage(),));
                },
                child: const Text("Store Page"))
          ],
        ),
      ),
    );
  }
}
