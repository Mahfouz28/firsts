import 'package:first/cubit/conter_cupit.dart';
import 'package:first/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
          backgroundColor: Colors.amber,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.count.toString(),
                    style: TextStyle(fontSize: 40),
                  );
                },
              ),
              const SizedBox(height: 30),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<CounterCubit>().increment();
                          },
                          child: Text("+", style: TextStyle(fontSize: 30)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 70,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            if (state.count > 0) {
                              context.read<CounterCubit>().decrement();
                            }
                          },
                          child: Text("-", style: TextStyle(fontSize: 30)),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
