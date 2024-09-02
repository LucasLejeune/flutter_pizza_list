import 'package:flutter_application_1/models/Ingredient.dart';

class Pizza {
  String nom;
  List<Ingredient> ingredients;

  Pizza({required this.nom, this.ingredients = const []});

  bool isVegan() {
    for (Ingredient ingredient in ingredients) {
      if (!ingredient.isVegan) {
        return false;
      }
    }
    return true;
  }
}
