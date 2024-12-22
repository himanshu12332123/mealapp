
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/providers/favorites_provider.dart';

class Mealdetailsscreen extends ConsumerWidget{
 const Mealdetailsscreen({
  super.key,
  required this.meal,
  // required this.ontogglefavorite,
  });

final  Meal meal;
// final void Function(Meal meal) ontogglefavorite;

@override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    
    final isFavorite = favoriteMeals.contains(meal);

     return Scaffold(
       appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: (){
              final wasadded = ref
           .read(favoriteMealsProvider.notifier)
           .toggleMealFavoriteStatus(meal);
         ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      content: Text(wasadded ? 'meal added as favorite' : 'meal removed'),
      )

    );
          },
           icon: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder:(child,animation) {
              return RotationTransition(
                turns: Tween<double>(
                  begin:0.8,
                  end:1.0,
                ).animate(animation),
                child: child,);
            } ,
           child: Icon(isFavorite ?Icons.favorite : Icons.favorite_border,
           key: ValueKey(isFavorite),
           ),
           ),
          )
        ],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                        meal.imageUrl,
                        height: 300,
                        width: double.infinity,
                        fit:BoxFit.cover,
                      ),
            ),
          const SizedBox(height: 14),
          Text(
            'Ingredients',
            style:Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
           for (final ingredient in meal.ingredients)
           Text(ingredient,
            style:Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),),
          
            const SizedBox(height: 14,),
            Text(
             'Steps',
               style:Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
            ),
             const SizedBox(height: 8),
             for (final step in meal.steps)
             Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
                ),
              
          child: Text(
            step,
           textAlign: TextAlign.center,
            style:Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),),
             ),
        ],
        ),
      ), 
      
     );

  }  
}