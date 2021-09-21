import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/Article.dart';
import 'package:news_app/shared/Cubit/cubit.dart';
import 'package:news_app/shared/Cubit/states.dart';
import 'package:news_app/shared/components/articleWidget.dart';
import 'package:news_app/shared/consts/listsData.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return  listBusiness.length==0?Center(child: CircularProgressIndicator())
            :
        ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index){
              print("$index :"+ listBusiness[index]['content'].toString());
              print(listBusiness.length);
              return MyArticle(new Article(listBusiness[index]['source']['name'].toString(),
                  listBusiness[index]['title'].toString(),
                  listBusiness[index]['url'].toString(),
                  listBusiness[index]['urlToImage'].toString(),
                  listBusiness[index]['publishedAt'].toString(),
                  listBusiness[index]['content'].toString()),context);
            },
            separatorBuilder: (context,index){ return Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[200],
            );},
            itemCount: listBusiness.length);
      },

    );

  }
}
