import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/news_cubit/news_cubit.dart';
import 'package:news/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {


      },
      builder: (context, state) {
        var list = NewsCubit.get(context).business; 
        return articaleBuilder(list,context);
      },
    );
    
    
    
     }
}