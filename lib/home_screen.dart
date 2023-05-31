import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/news_cubit/news_cubit.dart';

import 'cubit/theme_cubit/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context) ;
        return Scaffold(
        
        appBar: AppBar(
          title:Text('News App'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){
                      cubit.appMode();
               print("from button");
            }
            , icon: Icon(Icons.dark_mode_outlined)),

          ],
        ),

        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: 
        // GNav(
        //   gap: 5,
        //   selectedIndex: cubit.currentIndex,
        //   tabs: cubit.GNavItems,
        //   onTabChange:(index){
        //     cubit.changeBottomNavBar(index);
        //   }
        //   )

        
        BottomNavigationBar(
          currentIndex:cubit.currentIndex,
          onTap:(index){
            cubit.changeBottomNavBar(index);
          } ,
          items:cubit.bottomItems
          ),
        
        
        
            );
      },
    );
  }
}