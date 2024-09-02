import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Ingredient.dart';
import 'package:flutter_application_1/models/pizza.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tomate = Ingredient('Tomate', true);
    final jambon = Ingredient('jambon', false);
    final fromage = Ingredient('fromage', false);
    final champignon = Ingredient('champignon', true);

    List<Pizza> pizzas = [
      Pizza(nom: 'Vegan', ingredients: [tomate, champignon]),
      Pizza(nom: 'Basique', ingredients: [tomate, champignon, jambon]),
      Pizza(nom: 'Fromage', ingredients: [tomate, fromage])
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView(
                shrinkWrap: true,
                children: pizzas
                    .map(
                      (pizza) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              pizza.isVegan()
                                  ? const Tooltip(
                                      message: 'Vegan',
                                      child: Icon(Icons.grass),
                                    )
                                  : const Tooltip(
                                      message: 'Non-vegan',
                                      child: Icon(Icons.favorite_outlined),
                                    ),
                              Text(
                                pizza.nom,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                          Text(
                              'Ingredients : ${pizza.ingredients.map((ingredient) => ingredient.nom).join(', ')}'),
                        ]),
                      ),
                    )
                    .toList(),
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
