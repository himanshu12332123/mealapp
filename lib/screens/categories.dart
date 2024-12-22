import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/meals.dart';
import 'package:mealapp/widgets/category_grid_item.dart';
import 'package:mealapp/models/category.dart';

class CategoriesScreen extends StatefulWidget{
   const CategoriesScreen({super.key,
  
   required this.availablemeals,
   });

   
   final List<Meal> availablemeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
   
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

   void _selectcategory( BuildContext context, Category category ) {
   final filteredmeals = widget.availablemeals.where((meal) => meal.categories.contains(category.id))
   .toList();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
           meals: filteredmeals,
           ),
        
        ));
             
   }

   @override
  Widget build(BuildContext context) {
 

   return AnimatedBuilder(
     animation: _animationController,
     child:  GridView(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3/2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
          children:  [
           for( final category in availableCategories )
           CategoryGridItem(category: category,
             onselectcategory: (){
              _selectcategory(context,category);
             },
           )

          ],
   
   ),
     builder: (BuildContext context, Widget? child) =>SlideTransition(
      position: Tween(
          begin: Offset(0, 0.3),
          end: Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: _animationController,
           curve: Curves.easeInOut)),
      child: child,
      ),
     
      // Padding(
      // padding: EdgeInsets.only(
      //   top: 100 - _animationController.value * 100,
      //  ),
      // child: child,)
     
     
   );

  }
}