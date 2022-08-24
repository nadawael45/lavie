import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data/repo/blog_repo.dart';
import 'package:lavie/domain/cubit/blogs/blogs_state.dart';
import 'package:lavie/domain/cubit/profile/profile_state.dart';
import 'package:lavie/domain/cubit/quantity/quantity_state.dart';

import '../../../data/api/api.dart';
import '../../../data/local/cacheHelper.dart';
import '../../../shared/constants/keys/keys.dart';

class QuantityCubit  extends Cubit<QuantityState> {
  QuantityCubit() : super(Loading());

  static QuantityCubit get(context) => BlocProvider.of(context);
  increment(homeListIndex,context){
    homeListIndex.quantity++;

emit(Increase(homeListIndex));


  }
  decrement(homeListIndex,context){
    if(homeListIndex.quantity>=0) {
      homeListIndex.quantity--;
emit(Decrease(homeListIndex));
    }



  }

  }
