import 'package:flutter/material.dart';
import 'package:mealapp/providers/filters_provider.dart';
import 'package:mealapp/screens/tabs.dart';
import 'package:mealapp/widgets/main_darwer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class filterscreen extends ConsumerWidget{
    const filterscreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
  final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
       appBar: AppBar(
        title: Text(' Your Filters'),
       ),
      //  drawer: MainDrawer(onselectscreen: (identifier)
      //  {
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals'){
      //     Navigator.of(context).push(MaterialPageRoute(builder: 
      //     (ctx) => Tabsscreen(),
      //     ),);
      //   }

      //  }
      //  ),
      //  body: PopScope (
      //     canPop: true,
      //     onPopInvoked: (bool didPop ){
      //         print('HI');
          
      //       // if(didPop) return;
      //         ref.read(filtersProvider.notifier).setFilters({
      //             Filter.glutenfree:_glutenfreefliterset,
      //             Filter.lactosefree:_lactosefreefilterset,
      //             Filter.vegan: _veganfilteset,
      //             Filter.vegeterian:_vegeterianfilterset,
      //     });
      //         // Navigator.of(context).pop(
      //         //   {
                
      //         //   }
      //         // );
      //         print(Filter.glutenfree);
      //     },

         body: Column(
               children: [
                SwitchListTile(
                  value: activeFilters[Filter.glutenfree]!,
                 onChanged: (ischecked){
                 ref.read(filtersProvider.notifier).setFilter(Filter.glutenfree,ischecked);
                 },
                 title:Text(
                  'Gluten - free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                 ),
                 subtitle: Text(
                  'only include gluten-free meals',
                     style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
         
                 ),
                 activeColor: Theme.of(context).colorScheme.tertiary,
                 contentPadding: const EdgeInsets.only(left: 34,right: 22),
                   ),
                    SwitchListTile(
                  value: activeFilters[Filter.lactosefree]!,
                 onChanged: (ischecked){
               ref.read(filtersProvider.notifier).setFilter(Filter.lactosefree,ischecked);

                 },
                 title:Text(
                  'Lactose - free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                 ),
                 subtitle: Text(
                  'only include Lactose-free meals',
                     style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
         
                 ),
                 activeColor: Theme.of(context).colorScheme.tertiary,
                 contentPadding: const EdgeInsets.only(left: 34,right: 22),
                   ),
         
                    SwitchListTile(
                  value: activeFilters[Filter.vegan]!,
                 onChanged: (ischecked){
                 ref.read(filtersProvider.notifier).setFilter(Filter.vegan,ischecked);

                 },
                 title:Text(
                  'Vegeterian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                 ),
                 subtitle: Text(
                  'only include vegeterian meals',
                     style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
         
                 ),
                 activeColor: Theme.of(context).colorScheme.tertiary,
                 contentPadding: const EdgeInsets.only(left: 34,right: 22),
                   ),
                    SwitchListTile(
                  value: activeFilters[Filter.vegeterian]!,
                 onChanged: (ischecked){
                 ref.read(filtersProvider.notifier).setFilter(Filter.vegeterian,ischecked);

                 },
                 title:Text(
                  'vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                 ),
                 subtitle: Text(
                  'only include vegan meals',
                     style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
         
                 ),
                 activeColor: Theme.of(context).colorScheme.tertiary,
                 contentPadding: const EdgeInsets.only(left: 34,right: 22),
                   ),
               ],
         ),
       );

  }
}