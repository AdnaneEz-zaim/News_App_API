import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/Article.dart';
import 'package:news_app/modules/webview/webviewScreen.dart';

import 'navigatPage.dart';

Widget MyArticle(Article article,context)=>InkWell(
  onTap: (){
    navigatTo(context,WebViewScreen(article.url.toString()));
  },
  child:   Row(

    children: [

      Padding(

        padding: const EdgeInsets.all(8.0),

        child: Container(

          height: 130,

          width: 130,

          decoration: BoxDecoration(

              color: Colors.black45,

              borderRadius: BorderRadius.circular(15),

              image: DecorationImage(

                image: NetworkImage(article.image),

                fit: BoxFit.cover,

              )

          ),



        ),

      ),

      Expanded(

        child: Container(

          height: 130,

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              Expanded(

                  child: Text(article.title,

                    style: Theme.of(context).textTheme.bodyText1,

                    overflow: TextOverflow.ellipsis,

                    maxLines:6,

                  )),



              Text(article.publishedAt,style: TextStyle(color: Colors.grey[400]),)

            ],

          ),

        ),

      )

    ],

  ),
);