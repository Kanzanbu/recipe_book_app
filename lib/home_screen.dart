import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Sample recipe data
  final List<Map<String, String>> recipes = const [
    {
      'name': 'Spaghetti Bolognese',
      'ingredients': 'Spaghetti, ground beef, tomato sauce, onion, garlic',
      'instructions': '1. Boil pasta.\n2. Cook beef.\n3. Add sauce.\n4. Combine and serve.'
    },
    {
      'name': 'Chicken Adobo',
      'ingredients': 'Chicken, soy sauce, vinegar, garlic, bay leaf',
      'instructions': '1. Marinate chicken.\n2. Simmer until tender.\n3. Serve with rice.'
    },
    {
      'name': 'Pancakes',
      'ingredients': 'Flour, milk, eggs, sugar, butter',
      'instructions': '1. Mix ingredients.\n2. Cook on skillet.\n3. Serve with syrup.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Favorite Recipes')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe['name']!),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipeName: recipe['name']!,
                    ingredients: recipe['ingredients']!,
                    instructions: recipe['instructions']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
