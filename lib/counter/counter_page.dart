import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/counter/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Center(
          child: Text('$count'),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => context.bloc<CounterCubit>().increment()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () => context.bloc<CounterCubit>().decrement()),
          ),
        ],
      ),
    );
  }
}
