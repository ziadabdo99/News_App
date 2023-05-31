import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meta/meta.dart';
import 'package:news/modules/science/science_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/network/local/cache_helper.dart';

import '../../modules/business/business_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../../network/remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
 
 int currentIndex =0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'Business'
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'Sports'
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.psychology),
      label: 'Science'
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings'
      ),
  ];


  // List<GButton> GNavItems = [
  //   GButton(
  //     icon: Icons.business_center,
  //     text: 'Business'
  //     ),
  //     GButton(
  //     icon: Icons.sports_soccer,
  //     text: 'Sports'
  //     ),
  //     GButton(
  //     icon: Icons.psychology,
  //     text: 'Science'
  //     ),
  //     GButton(
  //     icon: Icons.settings,
  //     text: 'Settings'
  //     ),
  // ];
 

  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];


bool isDark = false;
void appMode(){
  
isDark = !isDark;
CacheHelper.putData(key: "isDark", value:isDark).then((value){
    emit(ChangeAppModeState());
 print("from cubit")  ;

} );

}

  void changeBottomNavBar(int index){

    currentIndex = index;

if(index == 1)
  getSports();
if(index == 2)
getScience();
emit(NewsBottomNavState());

  }
  List<dynamic> business = [];
  void getbusiness(){
              emit(NewsGetBusinessLoadingState());
 

    DioHelper.getData(url: "v2/top-headlines", 
              query: {
                "country":"us",
                "category":"business",
                "apiKey":"a8b3e7e33e2c46fdb81abedbde054d8f"
              }).then((value) {
                // print(value.data['articles'][1]['title']);
                business = value.data['articles'];
                print(business[0]['title']);
              emit(NewsGetBusinessSuccessState());
     

              } ).catchError((error){
                print(error.toString());
               emit(NewsGetBusinessErrorState(error.toString()));

              });
  }



 List<dynamic> sports = [];
  void getSports(){
    
              emit(NewsGetSportsLoadingState());
              if(sports.length==0){
      DioHelper.getData(url: "v2/top-headlines", 
              query: {
                "country":"us",
                "category":"sports",
                "apiKey":"a8b3e7e33e2c46fdb81abedbde054d8f"
              }).then((value) {
                // print(value.data['articles'][1]['title']);
                sports = value.data['articles'];
                print(sports[0]['title']);
              emit(NewsGetSportsSuccessState());
     

              } ).catchError((error){
                print(error.toString());
               emit(NewsGetSportsErrorState(error.toString()));

              });
    }else{
                    emit(NewsGetSportsSuccessState());

    }
 

  }




List<dynamic> science = [];
  void getScience(){
    
              emit(NewsGetScienceLoadingState());
              if(science.length==0){
      DioHelper.getData(url: "v2/top-headlines", 
              query: {
                "country":"us",
                "category":"science",
                "apiKey":"a8b3e7e33e2c46fdb81abedbde054d8f"
              }).then((value) {
                // print(value.data['articles'][1]['title']);
                science = value.data['articles'];
                print(science[0]['title']);
              emit(NewsGetScienceSuccessState());
     

              } ).catchError((error){
                print(error.toString());
               emit(NewsGetScienceErrorState(error.toString()));

              });
    }else{
                    emit(NewsGetScienceSuccessState());

    }
 

  }





}