import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/data/todo.dart';
import 'package:flutter_todo_app/todo_bloc/todo_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  addTodo(Todo todo) {
    context.read<TodoBloc>().add(AddTodo(
          todo,
        ));
  }

  removeTodo(Todo todo) {
    context.read<TodoBloc>().add(RemoveTodo(
          todo,
        ));
  }

  alterTodo(int index) {
    context.read<TodoBloc>().add(AlterTodo(
          index,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leading: Icon(
          CupertinoIcons.check_mark_circled,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          "My Todo App",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state.status == TodoStatus.success) {
            return Container();
          } else if (state.status == TodoStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
