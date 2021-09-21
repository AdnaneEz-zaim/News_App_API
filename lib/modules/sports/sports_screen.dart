import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/Article.dart';
import 'package:news_app/shared/Cubit/cubit.dart';
import 'package:news_app/shared/Cubit/states.dart';
import 'package:news_app/shared/components/articleWidget.dart';
import 'package:news_app/shared/consts/listsData.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return  listSports.length==0?Center(child: CircularProgressIndicator())
            :
        ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
//              listBusiness[index]['source']['name'],
//              listBusiness[index]['title'],
//              listBusiness[index]['url'],
//              listBusiness[index]['urlToImage'].toString(),
//              listBusiness[index]['publishedAt'],
//              listBusiness[index]['content'].toString()
              return MyArticle(new Article(listSports[index]['source']['name'].toString(),
                  listSports[index]['title'].toString(),
                  listSports[index]['url'].toString(),
                  listSports[index]['urlToImage'].toString(),
                  listSports[index]['publishedAt'].toString(),
                  listSports[index]['content'].toString()),context);
            },
            separatorBuilder: (context,index){ return Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[200],
            );},
            itemCount: listSports.length);
      },

    );
  }
}
//2020abc@
