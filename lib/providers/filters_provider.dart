import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/meals_provider.dart';

enum Filter{
  glutenfree,
  lactosefree,
  vegeterian,
  vegan,

}


class filtersNotifier extends StateNotifier <Map<Filter,bool>> {
  filtersNotifier() : super({
    Filter.glutenfree : false,
    Filter.lactosefree : false,
    Filter.vegeterian : false,
    Filter.vegan : false,
  });

  void setFilters(Map<Filter,bool>chosenFilters){
    state = chosenFilters;
  }

  void setFilter(Filter filter,bool isActive){
  //state][filter] = isActive;//not allowed =>muatuting state
  state = {
  ...state,
  filter: isActive
  };

  }
}

final filtersProvider = StateNotifierProvider<filtersNotifier,Map<Filter,bool>>((ref) => filtersNotifier(),);

final filterdMealsProvider = Provider((ref) {
 final meals = ref.watch(mealsProvider);
 final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
             if(activeFilters[Filter.glutenfree]! && !meal.isGlutenFree ){
              return false;
             }
             if(activeFilters[Filter.lactosefree]! && !meal.isGlutenFree ){
              return false;
             }
             if(activeFilters[Filter.vegeterian ]! && !meal.isVegetarian ){
              return false;
             }

             if(activeFilters[Filter.vegan ]! && !meal.isVegetarian ){
              return false;
             }
           return true;
       }).toList();
  

});

