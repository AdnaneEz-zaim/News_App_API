import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/Article.dart';
import 'package:news_app/shared/Cubit/cubit.dart';
import 'package:news_app/shared/Cubit/states.dart';
import 'package:news_app/shared/components/articleWidget.dart';
import 'package:news_app/shared/consts/listsData.dart';

class SciencesScreen extends StatelessWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return  listSiences.length==0?Center(child: CircularProgressIndicator())
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
              return MyArticle(new Article(listSiences[index]['source']['name'].toString(),
                  listSiences[index]['title'].toString(),
                  listSiences[index]['url'].toString(),
                  listSiences[index]['urlToImage'].toString(),
                  listSiences[index]['publishedAt'].toString(),
                  listSiences[index]['content'].toString()),context);
            },
            separatorBuilder: (context,index){ return Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[200],
            );},
            itemCount: listSiences.length);
      },

    );
  }
}
