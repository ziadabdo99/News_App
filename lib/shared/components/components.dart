
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';


Widget buildArticleItem(articale,context)=> Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(children: [
        Container(
          height: 120,
          width: 120,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(image: NetworkImage("${articale['urlToImage']}",
      ),
      fit: BoxFit.cover
      )
       
    ),
        ),
        SizedBox(width: 20,),
    
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Expanded(
                child: Text("${articale['title']}",
                style:Theme.of(context).textTheme.bodyLarge,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                ),
              ),
               Text("${articale['publishedAt']}",
              style:TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              )
            ],),
          ),
        )
      ],),
    );

Widget articaleBuilder(list,context)=>BuildCondition(
          condition: list.length > 0 ,
          builder: (context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=> buildArticleItem(list[index],context) , separatorBuilder: (context,index)=> 
          Divider(
               height: 20,
            thickness: 2,
            indent: 25,
            endIndent: 25,
            color: Colors.grey,


          ) , itemCount: 10),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
    
          
          
          
          );
    
  