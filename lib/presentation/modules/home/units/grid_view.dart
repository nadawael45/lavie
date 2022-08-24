import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/domain/cubit/cart/cart_cubit.dart';
import 'package:lavie/domain/cubit/cart/cart_state.dart';
import 'package:lavie/domain/cubit/home/home_cubit.dart';
import '../../../../data/models/Data.dart';
import '../../../../domain/cubit/home/home_states.dart';
import '../../../../domain/cubit/quantity/quantity_cubit.dart';
import '../../../../shared/constants/colors/colors.dart';
import '../../../widgets/custom_card.dart';

class CardGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          if(state is GetToolsSuccess ){
            return  CardGridWidget(list: state.toolList,);
          }else if(state is GetSeedsSuccess){
            return  CardGridWidget(list: state.seedsList,);
          }
          else if(state is GetPlantSuccess){
            return  CardGridWidget(list: state.plantList,);
          } else if(state is GetAllPlantSuccess) {
            return CardGridAllProduct(list: state.allplantList,);
          } else{
            return const Center(child: CircularProgressIndicator(color: ColorsManager.primaryColor,));
          }
        },

      );
  }
}

class CardGridWidget extends StatelessWidget {
  var list;

   CardGridWidget({this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child:
      GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.77
              ),
              itemBuilder:(context,index)=>
                CustomCard(toolsModel: list[index],
                        name: list[index].name,
                        img: list[index].imageUrl,
                        price: 200,
                        quantity: list[index].quantity,
                  decremntFunc: (){
                  QuantityCubit.get(context).decrement(list[index], context);
                  print( list[index].quantity);
                  print('pppppppppppppppppppppppppp');

                  },
                  incrementFunc: (){QuantityCubit.get(context).increment(list[index], context);
                  print( list[index].quantity);
                  print( 'qqqqqqqqqqqqqqqqqqqqq');


                  },







                )

                  )

    );
  }
}

class CardGridAllProduct extends StatelessWidget {
  List<Datum> list;

  CardGridAllProduct({ required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.77
          ),
          itemBuilder:(context,index)=>
              CustomCard(toolsModel: list[index],
                name: list[index].name,
                img: list[index].imageUrl,
                price: list[index].price,

    quantity: list[index].quantity,
    decremntFunc: (){QuantityCubit.get(context).decrement(list[index], context);
    print( list[index].quantity);

    },
    incrementFunc: (){QuantityCubit.get(context).increment(list[index], context);
    print( list[index].quantity);
    print( 'qqqqqqqqqqqqqqqqqqqqq');
    },







              )

      )

    );
  }
}

