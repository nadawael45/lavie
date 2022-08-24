import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SafeArea(
          child:
          Column(
            children: [
              SizedBox(height: 15,),
              Center(child: CustomText(text: 'Notification',fontWeight: FontWeight.bold,txtSize: 20,)),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) =>
                NotificationItem()),
              ),
            ],
          ),
        ),
      );
  }
}

class NotificationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(foregroundColor: ColorsManager.primaryColor,radius: 25,),
              SizedBox(width: 10,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'vyfygbyvg efyvbqybyuygtufriuvyfygbyvg'
                      'efyvbqybyuygtufriuvyf ygbyvgefyvbqybyuygtufriu'
                      ' fygbyvgefyvbqybyuygtufriu',
                    textAlign: TextAlign.start,txtSize: 15,fontWeight: FontWeight.w500,),
                  SizedBox(height: 10,),

                  CustomText(text: 'vyfygbyvgefyvbqy'
                    ,textAlign: TextAlign.start, color: ColorsManager.greyColor,),

                ],
              )),


            ],),
          SizedBox(height: 20,),
          Visibility(
            visible: true,
            child: Padding(
              padding:  EdgeInsets.only(left: 60,bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  //borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
                  border: Border(
                      left: BorderSide(width: 5,  color: Colors.grey.shade300,
                      )
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(text: '"ndaa\nndaa"'),
                ),
              ),
            ),
          ),
          Divider(thickness: 1,color: Colors.grey.shade300,)

        ],
      ),
    );
  }
}
