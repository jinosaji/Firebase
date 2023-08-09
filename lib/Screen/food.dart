import 'package:flutter/material.dart';
import 'package:projectfire/Screen/recipe.dart';
import 'package:projectfire/Screen/recipe_API.dart';
import 'package:projectfire/Screen/recipe_card.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
//API code
  late List<Recipe> _recipes;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }
  // Api code^
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10,),
            Text('Food Recipe')
          ],
        ),
      ),
      //API cheyunna time ill Add cheyandath
      body:_isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
    itemCount: _recipes.length,
    itemBuilder: (context, index) {
    return RecipeCard(
    title: _recipes[index].name,
    cookTime: _recipes[index].totalTime,
    rating: _recipes[index].rating.toString(),
    thumbnailUrl: _recipes[index].images);
    },
      ),
    );
  }
}
