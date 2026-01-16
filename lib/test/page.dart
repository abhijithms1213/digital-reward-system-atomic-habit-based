import 'dart:developer';
import 'dart:ffi';

import 'package:drewardsystem/test/bloc/test_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestHomeScreen extends StatelessWidget {
  const TestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TestBloc testBloc = BlocProvider.of<TestBloc>(context);
    return BlocBuilder<TestBloc, CounterTestState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(child: Column(
            children: [
              SizedBox(height: 200,),
              Text("state: ${state.currentState}"),
              FloatingActionButton(onPressed: (){
                testBloc.add(DecreamentalEvent(decreaseCountValue: state.currentState));
              }),
            ],
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              testBloc.add(
                IncreaseCountEvent(encreasingCount: state.currentState),
              );

                log("state: ${state.currentState}");
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
