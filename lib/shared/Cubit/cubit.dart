import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/Cubit/states.dart';
import 'package:news_app/shared/consts/bottomNavigationBareItem.dart';
import 'package:news_app/shared/consts/listsData.dart';
import 'package:news_app/shared/consts/themeMode.dart';
import 'package:news_app/shared/netWork/cach_helper.dart';
import 'package:news_app/shared/netWork/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates> {
  //2
  NewsCubit() : super(NewsInitialStates());

  //3
  static get(context) => BlocProvider.of<NewsCubit>(context);

  void ChangeCurrentIndex(int index){
    currentIndex=index;
    if(index==0)
      getBusiness();
    else if(index==1)
      getSciences();
    else if(index==2)
      getSports();
    emit(NewsBottomNaveStates());
  }

  void ChangeThemeMode(bool etat){
    if(!etat){
      themeMode=ThemeMode.dark;
      iconTheme=Icons.wb_sunny;
    } else{
      themeMode=ThemeMode.light;
      iconTheme=Icons.dark_mode;
    }
    isDark=etat;
    CacheHelper.putDataMode('isDark', isDark).then((value){
      emit(NewsThemeModeStates());
    }).catchError((onError){
      print("erreur dans le CacheHelper");
    });
  }

  //la remplaissage de la list des business news

  void getBusiness(){
    emit(NewsLadingDataStates());
  DioHelper.getData('v2/top-headlines', {
    'country':'us',
    'category':'business',
    'apiKey':'6fa726fa5725447bbc9be679f6c99f1c'
  }).then((value){
    listBusiness=value?.data['articles'];
    print(listBusiness[0]['title']);
    emit(NewsGetBusinessDataStates());
  }).catchError((onError){
    print('error:'+onError.toString());
    emit(NewsGetBusinessDataErrorStates(onError.toString()));
  });
}

  void getSports(){
    emit(NewsLadingDataStates());
    DioHelper.getData('v2/top-headlines', {
      'country':'us',
      'category':'sports',
      'apiKey':'6fa726fa5725447bbc9be679f6c99f1c'
    }).then((value){
      listSports=value?.data['articles'];
      print(listSports[0]['title']);
      emit(NewsGetSportsDataStates());
    }).catchError((onError){
      print('error:'+onError.toString());
      emit(NewsGetSportsDataErrorStates(onError.toString()));
    });
  }

  void getSciences(){
    emit(NewsLadingDataStates());
    DioHelper.getData('v2/top-headlines', {
      'country':'us',
      'category':'science',
      'apiKey':'6fa726fa5725447bbc9be679f6c99f1c'
    }).then((value){
      listSiences=value?.data['articles'];
      print(listSiences[0]['title']);
      emit(NewsGetScienceDataStates());
    }).catchError((onError){
      print('error:'+onError.toString());
      emit(NewsGetScienceDataErrorStates(onError.toString()));
    });
  }

  void getSearch(String value){
    emit(NewsLadingDataStates());
    DioHelper.getData('v2/everything', {
      'q':value,
      'sortBy':'publishedAt',
      'apiKey':'6fa726fa5725447bbc9be679f6c99f1c'
    }).then((value){
      listSearch=value?.data['articles'];
      emit(NewsGetSearchDataStates());
    }).catchError((onError){
      print('error:'+onError.toString());
      emit(NewsGetSearchDataErrorStates(onError.toString()));
    });
  }



}