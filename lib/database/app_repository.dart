import 'package:todo_list/database/app_database.dart';
import 'package:todo_list/database/todo.dart';

abstract class AppRepository {
  List<Todo> getList();

  void addTask(Todo todo);
}

class AppRepositoryImplementation extends AppRepository {
final AppDatabase db;

   AppRepositoryImplementation ({required this.db});

   @override
  List<Todo> getList() => db.getList();

  @override
  void addTask(Todo todo) => db.addTodo(todo);


}