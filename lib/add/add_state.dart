import 'package:flutter_bloc/flutter_bloc.dart';
class AddState {
  final bool isInitial;
  final bool isSucceed;

  const AddState ({required this.isInitial, required this.isSucceed});
  factory AddState.initial() => const AddState(isInitial: true, isSucceed: false);
   
  AddState copyWith ({ bool? isSucceed,
    bool? isInitial,}) {
      return AddState( isSucceed: isSucceed ?? this.isSucceed,
      isInitial: isInitial ?? this.isInitial,);
    }
}