import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_book_app/main.dart'; // Update this import path to match your project name

void main() {
  testWidgets('Navigate from HomeScreen to DetailsScreen', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(const RecipeBookApp());

    // Verify the HomeScreen displays one of the recipe titles
    expect(find.text('Spaghetti Bolognese'), findsOneWidget);
    expect(find.text('Chicken Adobo'), findsOneWidget);

    // Tap on the first recipe
    await tester.tap(find.text('Spaghetti Bolognese'));
    await tester.pumpAndSettle(); // Wait for navigation animation

    // Verify that the DetailsScreen is displayed with correct details
    expect(find.text('Ingredients:'), findsOneWidget);
    expect(find.textContaining('Spaghetti, ground beef'), findsOneWidget);
    expect(find.textContaining('Boil pasta'), findsOneWidget);

    // Go back to the HomeScreen
    await tester.pageBack();
    await tester.pumpAndSettle();

    // Verify we are back on HomeScreen
    expect(find.text('My Favorite Recipes'), findsOneWidget);
  });
}
