import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/local/cacheHelper.dart';
import 'package:lavie/domain/cubit/home/home_cubit.dart';
import 'package:lavie/domain/cubit/home/home_states.dart';
import 'package:lavie/presentation/modules/qr_details.dart';
import 'package:lavie/presentation/widgets/custom_button.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
import 'package:lavie/shared/constants/images/images.dart';
import 'package:lavie/shared/constants/keys/keys.dart';
import 'package:lavie/shared/router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../widgets/custom_text.dart';

class QrView extends StatefulWidget {
const QrView({Key? key}) : super(key: key);

@override
State<StatefulWidget> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  //Barcode? result;
  String result='';
  String title='';
  String desc='';
  var elementList;
  QRViewController? controller;
  String text='Click here';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImagesManager.background_qr,),fit: BoxFit.fill)
            ),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: ()async{
//                      if(result!.code==null||result!.code==''){
//                        await controller?.resumeCamera();
//                    }else{
//                        await controller?.pauseCamera();
//
//                      }
                    },
                    child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: _buildQrView(context)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
//                        if (result != null)
//                          Text(
//                              'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//                        else
//                          const Text('Scan a code'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(30),
                                child: CustomButton('pause', ()async{await controller?.pauseCamera();},),
                              ),
                            ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: CustomButton('resume', ()async{await controller?.resumeCamera();}),
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                  BlocConsumer<HomeCubit,HomeStates>(
                    listener: (BuildContext context, state) {

                    },
                    builder: (BuildContext context,state){
                        if(state is GetPlantSuccess){
                        if(result==''){
                        }else {
                          print('getPlantById');
                          for(var element in state.plantList){
                            print(element.id);
                            if(element.id!.contains(result)){
                              print(element.name);
                              title=element.name!;
                              desc=element.description!;
                              elementList=element;
                              print(title);
                              print(desc);

                            }

                          }
                          print('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
                          print(title);
                          print(desc);
                        }




                      }
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 50,right: 45,left: 45,top: 40),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(color: Color(0xffB7B4B6).withOpacity(0.7)),
                          child: Padding(
                            padding: const EdgeInsets.all(19),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: title.toUpperCase(),fontWeight: FontWeight.bold,txtSize: 16,),
                                    SizedBox(height: 10,),
                                    Expanded(
                                      child: CustomText(text: desc,txtSize: 14,
                                        textAlign: TextAlign.start,
                                        lines: 1,
                                      ),
                                    ),

                                  ],),
                                InkWell(
                                  onTap: (){
                                    MagicRouter.navigateTo(QrDetails(elementList));
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(color:ColorsManager.primaryColor,borderRadius: BorderRadius.circular(50) ),
                                    child: Icon(Icons.arrow_forward,color: Colors.white,),),
                                )
                              ],),
                          ),
                        ),
                      );
                    }

                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    String token;
    setState(() {
      this.controller = controller;

    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code!.toString();

      });
        token =CacheHelper.getString(SharedKeys.token);
      HomeCubit.get(context).getPlantCubit(token, 1);
      print(result);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
