abstract class AuthStates{
}

class AuthLoading extends AuthStates{}

class SignInSuccess extends AuthStates{}
class SignInFailed extends AuthStates{}

class SignUpSuccess extends AuthStates{}
class SignUpFailed extends AuthStates{}
class SignInGoogleLoading extends AuthStates{}


class SignInGoogleSuccess extends AuthStates{}
class SignInGoogleFailed extends AuthStates{}