class Validator{



static String? validateName( value) {
    if (value.isEmpty ) {
      return 'Enter Name';
    }else {
      return null;
    }
  }



//  static String? validatePhone( value) {
//    String pattern = r'(^[0-9]*$)';
//    RegExp regExp =RegExp(pattern);
//    if (value.isEmpty) {
//      return 'Enter Phone'.tr();
//    }
////    else if(!regExp.hasMatch(pattern)){
////      return 'Phone Must be digits';
////
////    }
//    else {
//    return null;
//    }
//  }


  static String? validateEmail( value) {
    String pattern=
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Enter Email';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Invalid Email';
    }
    else {
      return null;
    }
  }

static String?  validatePassword(value){
  String pattern=r'^(?=.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$';
  RegExp regExp = RegExp(pattern);

  if(value.isEmpty){
   return 'Enter Passsword';
 }else if(value.length<8){
   return 'Password must be more than 8';

 }
  else if (!regExp.hasMatch(value)) {
    return 'Weak Password';

 }
 else {
   return null;
 }
  }

  static String? validateEmpty( value) {
    if(value.isEmpty) {
      return "It Can't be empty";
    }else {
  return null;
  }
}
  static String? validateConfirmPass( confirmPass,pass) {
    if(pass!=confirmPass) {
      return "Incorrect Password";
    }
//    else if(confirmPass.toString.isEmpty){
//      return "It Can't be empty";
//
//    }
    else {
      return null;
    }
  }
}