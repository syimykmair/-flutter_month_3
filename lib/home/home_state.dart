import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/database/todo.dart';
class HomeState {
  final List<Todo> items;
  final bool isEmpty;

  const HomeState ({required this.items, required this.isEmpty});

  //исходное состояние до получения данных (до вызова методов)
  factory HomeState.intitial() => const HomeState(items: [], isEmpty: true);
  
  //используем копию обьекта для изменения свойств
  HomeState copyWith ({List<Todo>? items, bool? isEmpty}) {
    return HomeState(items: items?? this.items, isEmpty: isEmpty?? this.isEmpty);
  }
}