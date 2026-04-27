import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/database/app_repository.dart';
import 'package:todo_list/database/todo.dart';
import 'add_state.dart';

class AddViewModel extends Cubit<AddState> {
  AppRepository repo;
  AddViewModel(this.repo) : super(AddState.initial());

  void addTask(String text) {
    final trimmedText = text.trim();

    if (trimmedText.isEmpty) {
      emit(
        state.copyWith(
          isInitial: false,
          isSucceed: false,
        ),
      );
    } else {
      repo.addTask(Todo(id: 5, title: text, date: DateTime.now().toString(), isDone: false));
      emit(
        state.copyWith(
          isInitial: false,
          isSucceed: true,
        ),
      );
    }
  }
}