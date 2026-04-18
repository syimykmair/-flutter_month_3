import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_state.dart';

class AddViewModel extends Cubit<AddState> {
  AddViewModel() : super(AddState.initial());

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
      emit(
        state.copyWith(
          isInitial: false,
          isSucceed: true,
        ),
      );
    }
  }
}