
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
const MealItem({
  super.key,
  required this.meal,
  required this.onselectmeal,
});

final Meal meal;
final void Function(  Meal meal) onselectmeal;

String get complexitytext{
  return meal.complexity.name[0].toUpperCase() +
   meal.complexity.name.substring(1);
}

String get affordabilitytext{
  return meal.affordability.name[0].toUpperCase() + 
     meal.affordability.name.substring(1);
}

@override
  Widget build(BuildContext context) {
  
  return Card(
    margin: const EdgeInsets.all(12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    clipBehavior: Clip.hardEdge,
    elevation:2 ,
    child: InkWell(
      onTap: (){
        onselectmeal(meal);
      },
      child: Stack(
        children: [
          Hero(
            tag:meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
             image: NetworkImage(meal.imageUrl),
             fit: BoxFit.cover,
             height: 200,
             width: double.infinity,
             ),
          ),
           Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal:44,
              ),
              child: Column(
                children: [
                  Text(meal.title,
                  maxLines: 2,
                  textAlign: TextAlign.center ,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )

                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   Mealitemtrait(icon: Icons.schedule,
                    label: '${meal.duration} min',
                    ),
                    const SizedBox(width:10),
                    Mealitemtrait(
                      icon: Icons.work,
                       label: '${complexitytext} '),
                       const SizedBox(width: 12),
                       Mealitemtrait(
                        icon: Icons.attach_money,
                       label: '$affordabilitytext'
                       ),
                  ],)
                ]
              )
            )
            )
        ],
      ),
    ),
  );
  }

}