import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/news_cubit/news_cubit.dart';
import 'package:news/network/local/cache_helper.dart';
import 'package:news/network/remote/dio_helper.dart';

import 'home_screen.dart';

void main()async { 
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getbusiness(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              primarySwatch: Colors.grey,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.shifting,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.white,
                  elevation: 0.0),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              scaffoldBackgroundColor: Colors.black,
              primarySwatch: Colors.grey,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light),
                backgroundColor: Colors.black,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Color.fromARGB(255, 96, 93, 93),
                backgroundColor: Colors.black,
                elevation: 0.0,
              ),
              useMaterial3: true,
            ),
            themeMode:
                // ThemeMode.dark
                cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
