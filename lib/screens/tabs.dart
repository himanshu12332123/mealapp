import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/favorites_provider.dart';
import 'package:mealapp/screens/categories.dart';
import 'package:mealapp/screens/filters.dart';
import 'package:mealapp/screens/meals.dart';
import 'package:mealapp/widgets/main_darwer.dart';
import 'package:mealapp/providers/meals_provider.dart';
import 'package:mealapp/providers/filters_provider.dart';

const kinitialfilters = {
 Filter.glutenfree:false,
    Filter.lactosefree: false,
    Filter.vegeterian: false,
    Filter.vegan: false,
};

class Tabsscreen extends ConsumerStatefulWidget{
  const Tabsscreen({super.key});
   
   @override
  ConsumerState<Tabsscreen> createState() {
  
  return _TabsScreenState();
  }

}

class _TabsScreenState extends ConsumerState<Tabsscreen>{

  int _selectepageindex = 0;
 

  

  // void _togglemealfavoritestatus( Meal meal) {
  //   final isExisting = _favoritemeals.contains(meal);

  //   if (isExisting){
  //     setState(() {
  //         _favoritemeals.remove(meal);
  //     });
  //     _showinfomessage('meal is no longer a favorite');
  //   }
  //   else{
  //     setState(() {
  //        _favoritemeals.add(meal);
  //        _showinfomessage('Marked as a favorite');
  //     });
     
  //   }

  // }

  void _selectpage(int index){
    setState(() {
      _selectepageindex = index;
    });
  }


  void _setscreen(String identifier) async{
       Navigator.of(context).pop();
    if(identifier == 'filters'){
    
    await Navigator.of(context).push<Map<Filter,bool>>(
      MaterialPageRoute(
        builder: (ctx) => const filterscreen(
         
           ),
      ));
     
    }

  

  }
  
  @override
  Widget build(BuildContext context) {
  
   final availablemeals = ref.watch(filterdMealsProvider);

    Widget activePage = CategoriesScreen(
    
      availablemeals: availablemeals,);
    var activepagetitle = 'Categories';

    if(_selectepageindex == 1){
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage =  MealsScreen( meals: favoriteMeals,
       );
      activepagetitle = 'Your Favorites';
    }
   
   return Scaffold(
    appBar: AppBar(
           title: Text(activepagetitle) ,
    ),
    drawer: MainDrawer(
      onselectscreen: _setscreen,
    ),
    body: activePage,
    bottomNavigationBar: BottomNavigationBar(
     onTap: _selectpage,
     currentIndex: _selectepageindex,
     items:[
    BottomNavigationBarItem(icon: Icon(Icons.set_meal), label:'Categories' ),
     BottomNavigationBarItem(icon: Icon(Icons.star), label:'Favorites' ),
     ],
    ),
   );
  }
  
}
