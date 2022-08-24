import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/presentation/modules/home/units/grid_view.dart';
import 'package:lavie/presentation/modules/home/units/search_formField.dart';
import 'package:lavie/shared/constants/images/images.dart';

import '../../../domain/cubit/home/home_cubit.dart';
import '../../../domain/cubit/home/home_states.dart';
class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(35),
            child: SearchFormField(readOnly: false,),
          ),
          Expanded(child:
          BlocConsumer<HomeCubit,HomeStates>(
              listener: (BuildContext context, state) {  },
              builder: (BuildContext context, Object? state) {
                if (state is SearchSuccessState&& state.dataList!=[]) {
                  return CardGridAllProduct(list: state.dataList);
                } else {
                  return Center(child: Image.asset(ImagesManager.frame),);
                }
              }
          ))
        ],
      )));
  }
}
