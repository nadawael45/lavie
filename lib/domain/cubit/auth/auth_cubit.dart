
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lavie/data/models/GoogleModel.dart';
import 'package:lavie/data/models/UserModel.dart';
import 'package:lavie/domain/cubit/auth/auth_states.dart';
import '../../../data/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthLoading());
  String token='';
  static AuthCubit get(context) => BlocProvider.of(context);
  signIn(userModel){
  var response=   Api().postHttp(url: '/api/v1/auth/signin',data: userModel.toJson());


       response
       .then((value) => {
      token=value['data']['accessToken'],
      print('//////////////////////////////'),
      print(value),

      emit(SignInSuccess()),
      print(token),
         print(response),


         print('Success')

    }).onError((error, stackTrace) => {
      emit(SignInFailed()),
      print('Failed'),
      print(error.toString()),
      print(token),




    });


  }

  signUp(userModel){
  var response =
  Api().postHttp(url: '/api/v1/auth/signup',data: userModel.toJson());

    print(response);



  response.then((value) => {
    token=value['data']['accessToken'],

    print(token),
       print( value['data']['user']),
      emit(SignUpSuccess())

    }).onError((error, stackTrace) => {
      emit(SignUpFailed()),
    print(error),

    });

  }

   signInWithGoogle() async {
emit(SignInGoogleLoading());
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn().catchError((e){
      print(e.toString());
    });
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    print('pppppppppppppppp');
    print(googleUser!.id);
GoogleModel userModel=GoogleModel(firstName:googleUser.displayName,email: googleUser.email,
    id: googleUser.id,picture: googleUser.photoUrl==null?'https://pixy.org/src/474/4741220.jpg':
        googleUser.photoUrl,lastName: 'wael'
    );
    print(userModel.id);

var response=   Api().postHttp(url: '/api/v1/auth/google',data: userModel.toJson());

     response
         .then((value) => {
      // token=value['data']['accessToken'],

       print('//////////////////////////////'),
       print(value),

       emit(SignInGoogleSuccess()),
       print(response),


       print('Success')

     }).onError((error, stackTrace) => {
       emit(SignInGoogleFailed()),
       print('Failed'),
       print(error.toString()),





     });

   }
}