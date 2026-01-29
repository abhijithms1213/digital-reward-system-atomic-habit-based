import 'dart:developer';

import 'package:drewardsystem/screens/todo_screen/bloc/auth_bloc/auth_bloc.dart';
import 'package:drewardsystem/screens/todo_screen/bloc/todo_bloc/todo_bloc.dart';
import 'package:drewardsystem/screens/todo_screen/model/todo_model.dart';
import 'package:drewardsystem/screens/todo_screen/repository/auth_repo.dart';
import 'package:drewardsystem/screens/todo_screen/repository/todo_repo.dart';
import 'package:drewardsystem/screens/todo_screen/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenTodo extends StatelessWidget {
  const ScreenTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => TodoRepo()),
        RepositoryProvider(create: (context) => TestAuthRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                TodoBloc(todoRepo: context.read<TodoRepo>())
                  ..add(TodoLoadTodosEvent()),
          ),
          BlocProvider(
            create: (context) =>
                AuthBloc(authRepo: context.read<TestAuthRepo>())
                  ..add(AuthLoginEvent(name: 'admin', password: '123456')),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text("todo-test"),
            actions: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {

                  if (state is AuthenticatedState) {

                    return IconButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthLogoutEvent());
                        log("tapped logout");
                        // BlocProvider.of<AuthBloc>(
                        //   context,
                        // ).add(AuthLogoutEvent());
                      },
                      icon: Icon(Icons.person),
                    );
                  } else if (state is AuthLoadingState) {
                    log("loading");
                    return CircularProgressIndicator();
                  } else if (state is UnAuthenticatedState ||
                      state is AuthErrorState) {
                    // return Text("un auth state");
                    return ElevatedButton(
                      onPressed: () {
                        log("login");
                        BlocProvider.of<AuthBloc>(context).add(
                          AuthLoginEvent(name: 'admin', password: '123456'),
                        );
                        // context.read<TodoBloc>().add(TodoLoadTodosEvent());
                        // BlocProvider.of<TodoBloc>(context).add(TodoLoadTodosEvent());
                      },
                      child: Icon(Icons.abc),
                    );
                  } else if (state is AuthErrorState) {
                    return Text("errror");
                  }
                  return SizedBox.shrink();
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is UnAuthenticatedState) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          AuthLoginEvent(name: 'admin', password: '1234561'),
                        );
                        // context.read<TodoBloc>().add(TodoLoadTodosEvent());
                        // BlocProvider.of<TodoBloc>(context).add(TodoLoadTodosEvent());
                      },
                      child: Icon(Icons.local_gas_station),
                    );
                  }
                  return Text("else");
                },
              ),
            ],
          ),
          body: Column(
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthenticatedState) {
                    return Text("authenticated state");
                  } else if (state is UnAuthenticatedState) {
                    return ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.login),
                    );
                  } else if (state is AuthLoadingState) {
                    return Text("authenticated");
                  } else if (state is AuthErrorState) {
                    return Text("errror");
                  }
                  return Text("else worked $state");
                },
              ),
              BlocListener<AuthBloc, AuthState>(
                listenWhen: (previous, current) =>
                    current is UnAuthenticatedState,
                listener: (context, state) {
                  log("message listened $state but worked on logout");
                },
                child: Text("listening"),
              ),
              BlocListener<AuthBloc, AuthState>(
                listenWhen: (previous, current) => current is AuthErrorState,
                listener: (context, state) {
                  if (state is AuthErrorState) {
                    final snackBar = SnackBar(
                      content: AboutDialog(applicationName: state.messaage),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: SizedBox.shrink(),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return CircularProgressIndicator();
                  } else if (state is UnAuthenticatedState ||
                      state is AuthInitial || state is AuthErrorState) {
                    return LoginForm();
                  } else if (state is AuthenticatedState) {
                    return Text("congrats u logged in");
                  // } else if (state is AuthErrorState) {
                  //   return Text("error state");
                  } else
                    // ignore: curly_braces_in_flow_control_structures
                    return Text("else");
                },
              ),
              Expanded(
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state is TodoLoadingState) {
                      return CircularProgressIndicator();
                    } else if (state is TodoErrorState) {
                      return Center(child: Text("error occured"));
                    } else if (state is TodoLoadedState) {
                      return ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          final TodoModel todo = state.todos[index];
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<TodoBloc>(
                                context,
                              ).add(TodoToggleEvent(id: todo.id));
                            },
                            child: Container(
                              color: !todo.isCompleted
                                  ? Colors.blue.shade800
                                  : Colors.green,
                              child: ListTile(
                                title: Text("${todo.id}"),
                                subtitle: Text(todo.description),
                                leading: Text("${todo.isCompleted}"),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
