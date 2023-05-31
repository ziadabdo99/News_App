import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/news_cubit/news_cubit.dart';
import '../../shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {


      },
      builder: (context, state) {
        var list = NewsCubit.get(context).sports; 
        return articaleBuilder(list,context);
      },
    );
  }
}