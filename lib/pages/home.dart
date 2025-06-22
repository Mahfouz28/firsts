import 'package:first/cubit/conter_cupit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(create: (_) => CounterCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Cubit Example')),
        body: Column(
          children: [
            Center(
              child: BlocBuilder<CounterCubit, int>(
                builder: (context, count) {
                  return Text('$count', style: const TextStyle(fontSize: 40));
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () => context.read<CounterCubit>().decrement(),
                      child: Text("-")),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<CounterCubit>().increment(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
