part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String name;
  final String password;

  const AuthLoginEvent({required this.name, required this.password});
  @override
  List<Object> get props => [name,password];
  
}
class AuthLogoutEvent extends AuthEvent{
  
}