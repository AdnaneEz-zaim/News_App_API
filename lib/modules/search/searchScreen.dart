import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/Article.dart';
import 'package:news_app/shared/Cubit/cubit.dart';
import 'package:news_app/shared/Cubit/states.dart';
import 'package:news_app/shared/components/articleWidget.dart';
import 'package:news_app/shared/consts/listsData.dart';

class SearchScreen extends StatelessWidget {
  var emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          print(listSearch.length);
          print(listBusiness.length);
          return
      Scaffold(
      appBar: AppBar(
        title: TextField(

          onChanged: (value){
            NewsCubit.get(context).getSearch('$value');
          },
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: Icon(Icons.search,color: Colors.grey[400],),
            labelStyle: TextStyle(
               color: Colors.blue,
            ),

          ),

        ),
      ),
      // appBar: AppBar(
      //   actions: [
      //     TextField(
      //       decoration:
      //       InputDecoration(border: InputBorder.none, hintText: 'Search'),
      //     ),
      //   ],
      // ),
      body:state is NewsLadingDataStates?Center(child: CircularProgressIndicator())
              :
      ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
                print("$index :"+ listBusiness[index]['content'].toString());
                print(listBusiness.length);

                return MyArticle(new Article(listSearch[index]['source']['name'].toString(),
                    listSearch[index]['title'].toString(),
                    listSearch[index]['url'].toString(),
                    listSearch[index]['urlToImage'].toString(),
                    listSearch[index]['publishedAt'].toString(),
                    listSearch[index]['content'].toString()),context);
              },
              separatorBuilder: (context,index){ return Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[200],
              );},
              itemCount: listSearch.length
          ),
      );
        },

      );

  }
}
// return BlocProvider(
//   create: (BuildContext context) => NewsCubit()..getSearch(''),
//   child: BlocConsumer<NewsCubit,NewsStates>(
//   listener: (context,state){},
//   builder: (context,state){
//     return Scaffold(
//     body: Column(
//     children: [
//     Padding(
//           padding: const EdgeInsets.only(right: 20.0,left: 0,bottom: 20,top: 33),
//             child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                         IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_outlined)),
//                         Expanded(child: Container(
//                           child: MyTextField(emailController, TextInputType.text, "Rechercher ", Icons.search_rounded,
//                     (value){
//                             print(listSearch.length);
//                             print("------------------>>"+value);
//                           NewsCubit.get(context).getSearch(value);
//                       }),
//                         )),
//                   ],
//                 ),
//     ),
//    listSiences.length==0?Center(child: CircularProgressIndicator())
//         :
//     ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context,index){
//           return MyArticle(new Article(listSearch[index]['source']['name'].toString(),
//               listSearch[index]['title'].toString(),
//               listSearch[index]['url'].toString(),
//               listSearch[index]['urlToImage'].toString(),
//               listSearch[index]['publishedAt'].toString(),
//               listSearch[index]['content'].toString()),context);
//         },
//         separatorBuilder: (context,index){
//           return Container(
//             width: double.infinity,
//             height: 1,
//             color: Colors.grey[200],
//           );},
//         itemCount: listSearch.length
//     ),
//     ],
//   ),
//   );
//   }
//   ),
// );