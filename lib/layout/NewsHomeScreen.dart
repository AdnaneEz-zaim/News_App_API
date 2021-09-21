import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/searchScreen.dart';
import 'package:news_app/shared/Cubit/cubit.dart';
import 'package:news_app/shared/Cubit/states.dart';
import 'package:news_app/shared/components/navigatPage.dart';
import 'package:news_app/shared/consts/bottomNavigationBareItem.dart';
import 'package:news_app/shared/consts/themeMode.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("NewaApp"),actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){
                NewsCubit.get(context).getSearch('');
                navigatTo(context,SearchScreen());
              }, icon: Icon(Icons.search_rounded,size: 35,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){
                NewsCubit.get(context).ChangeThemeMode(!isDark);
              }, icon: Icon(iconTheme,size: 28,)),
            ),
          ],
          ),
          body: listScreens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index){
              NewsCubit.get(context).ChangeCurrentIndex(index);
            },
            items: listeNavigationBar,
          ),
        );
      },
    );

  }
}
