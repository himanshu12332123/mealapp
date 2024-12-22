
import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/meal_details.dart';
import 'package:mealapp/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({
    super.key,
    this.title,
     required this.meals,
   
     });

final String? title;
final List<Meal>meals;


void selectmeal(BuildContext context, Meal meal){
  Navigator.of(context).push(MaterialPageRoute(
    builder: (ctx)=> Mealdetailsscreen(
      meal: meal,
     
      ),
    ));
}

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
        itemBuilder: (ctx,index) => Text(
          meals[index].title,
          ),
          );

  if (meals.isEmpty){
     content = Center( 
     child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Uh oh ... nothing here!',
         style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
        SizedBox(height:16),
        Text('try selecting a different category ',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
      ],
      )
      );
  }


  if (meals.isNotEmpty){
     content = ListView.builder( 
      itemCount: meals.length,
      itemBuilder: (ctx,index) => MealItem(
        meal: meals[index],
        onselectmeal: (meal){
          selectmeal(context, meal);
      }, 
      ),
      );
  }

  if(title == null){
    return content;
  }
   return Scaffold(
       appBar: AppBar(
        title: Text(title!),
       ),
      //  body: 
      body: content,

   );
  }
}