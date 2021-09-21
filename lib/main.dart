import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/Cubit/cubit.dart';
import 'package:news_app/shared/Cubit/states.dart';
import 'package:news_app/shared/consts/bloc_observer.dart';
import 'package:news_app/shared/consts/themeMode.dart';
import 'package:news_app/shared/netWork/cach_helper.dart';
import 'package:news_app/shared/netWork/dio_helper.dart';

import 'layout/NewsHomeScreen.dart';
//adb uninstall com.example.news_app
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? etat=CacheHelper.getDataMode('isDark');
  if(etat==null) etat=isDark;
  runApp(MyApp( etat: etat));
}

class MyApp extends StatelessWidget {
    final  bool etat;
  const MyApp({required this.etat}) ;

  @override
  Widget build(BuildContext context) {
    if(etat==null){
      CacheHelper.putDataMode('isDark', isDark);
    }else{
      isDark=etat;
    }

    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..ChangeThemeMode(isDark),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){
        },
        builder: (context,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black,
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(
                  size: 32,
                ),
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              scaffoldBackgroundColor: Colors.grey[50],
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  //hadi la briti t7akam fdik twixya li kayban fiha la carte sim w batrie w wifi
                ),
                backgroundColor: Colors.grey[50],
                elevation: 0.0,
                iconTheme: IconThemeData(
                    color: Colors.black45,
                    size: 25
                ),
                titleTextStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 25),
              ),
              primarySwatch: Colors.pink,
              iconTheme: IconThemeData(
                  color: Colors.black45,
                  size: 25
              ),
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.grey[200]
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(
                  size: 32,
                  color: Colors.grey[400],
                ),
                unselectedIconTheme: IconThemeData(
                  color: Colors.grey[200],
                ),
                unselectedItemColor: Colors.grey[200],
                selectedItemColor: Colors.grey[400],
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
                backgroundColor: Color(0xFF333739),
              ),
              scaffoldBackgroundColor: const Color(0xFF333739),
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  //hadi la briti t7akam fdik twixya li kayban fiha la carte sim w batrie w wifi
                ),
                backgroundColor: Color(0xFF333739),
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.grey[500],

                ),
                titleTextStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 25),
              ),
              iconTheme: IconThemeData(
                color: Colors.grey[500],

              ),
              primarySwatch: Colors.grey,
            ),
            themeMode: isDark?ThemeMode.dark:ThemeMode.light,
            home:  HomeScreen(),
          );
        },

      ),
    );
  }
}

