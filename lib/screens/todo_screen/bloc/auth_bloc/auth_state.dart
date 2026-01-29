part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {
  
}
class UnAuthenticatedState extends AuthState {
  
}
class AuthenticatedState extends AuthState {
  final AuthModel user;

  const AuthenticatedState({required this.user});
  @override
  List<Object> get props => [user];
}
class AuthErrorState extends AuthState {
  final String messaage;

  const AuthErrorState({required this.messaage});
  
}