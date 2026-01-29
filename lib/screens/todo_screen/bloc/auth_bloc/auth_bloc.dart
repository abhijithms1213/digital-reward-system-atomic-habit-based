import 'package:bloc/bloc.dart';
import 'package:drewardsystem/screens/todo_screen/model/auth_model.dart';
import 'package:drewardsystem/screens/todo_screen/repository/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      await Future.delayed(Duration(milliseconds: 102));
      final user = authRepo.authenticated(event.name, event.password);
      if (user != null) {
        emit(AuthenticatedState(user: user));
      } else {
        emit(AuthErrorState(messaage: 'please enter valid user credentials'));
      }
    });
    on<AuthLogoutEvent>((event, emit) {
      emit(AuthLoadingState());
      final String isLogout = authRepo.logout();
      if (isLogout == 'logout') {
        emit(UnAuthenticatedState());
      } else {
        emit(AuthErrorState(messaage: 'spelling of logout missmatch'));
      }
    });
  }

  // AuthBloc() : super(AuthInitial()) {
  // }
}
