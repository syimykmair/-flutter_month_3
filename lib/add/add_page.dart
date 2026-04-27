import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/add/add_view_model.dart';
import 'package:todo_list/add/add_state.dart';
import 'package:todo_list/database/app_database.dart';
import 'package:todo_list/database/app_repository.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
 late final AddViewModel vm;
  final TextEditingController _textEditingController =
      TextEditingController();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final db = AppDatabase();
    final repo = AppRepositoryImplementation(db: db);
    vm = AddViewModel(repo);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Добавить задачу"),
  //       centerTitle: true,
  //     ),

  //     body: Padding(
  //       padding: const EdgeInsets.all(16),

  //       /// 👇 ВОТ ЗДЕСЬ ПОДКЛЮЧАЕМ STATE
  //       child: BlocBuilder<AddViewModel, AddState>(
  //         builder: (context, state) {
  //           return Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               /// TEXTFIELD
  //               TextField(
  //                 controller: _textEditingController,
  //                 decoration: const InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: 'Введите название задачи',
  //                 ),
  //               ),

  //               const SizedBox(height: 8),

  //               /// ❌ ОШИБКА
  //               if (!state.isInitial && !state.isSucceed)
  //                 const Text(
  //                   'Введите название',
  //                   style: TextStyle(color: Colors.red),
  //                 ),

  //               /// ✅ УСПЕХ
  //               if (!state.isInitial && state.isSucceed)
  //                 const Text(
  //                   'Сохранено!',
  //                   style: TextStyle(color: Colors.green),
  //                 ),

  //               const Spacer(),

  //               /// BUTTON
  //               SizedBox(
  //                 width: double.infinity,
  //                 child: ElevatedButton(
  //                   onPressed: () {
  //                     context
  //                         .read<AddViewModel>()
  //                         .addTask(_textEditingController.text);
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                     minimumSize: const Size(double.infinity, 50),
  //                     backgroundColor:
  //                         const Color.fromARGB(255, 77, 172, 250),
  //                   ),
  //                   child: const Text(
  //                     'Сохранить',
  //                     style: TextStyle(color: Colors.white),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    print("AddPage - build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Добавить задачу"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(), 
                label: Text("Введите название задачи")
                )
              ),
            Visibility(child: Text("", style: TextStyle(color: Colors.red)), visible: false),
            TextButton(onPressed: () => vm.addTask(_textEditingController.text), child: Text("Сохранить"))
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}


// import 'package:flutter/material.dart';
// import 'dart:async';

// class AddPage extends StatefulWidget {
//   const AddPage({super.key});

//   @override
//   State<StatefulWidget> createState() => _AddPage();
// }

// class _AddPage extends State<AddPage> {
//   late Timer _timer;
//   TextEditingController _textEditingController = TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print('AddPage - initState');
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       final date = DateTime.now();
//       print("${date.minute}: ${date.second}");
//     });
//   }

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     print('AddPage - didChangeDependencies');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text("Добавить задачу"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: _textEditingController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text('Введите название задчи'),
//               ),
//             ),
         
//             const Spacer(),

//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _saveTodo,
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50),
//                   backgroundColor: const Color.fromARGB(255, 77, 172, 250),
//                 ),
//                 child: Text('Сохранить', style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _saveTodo() {
//     Navigator.pop(context, _textEditingController.text);
//   }

  // @override
  // void didUpdateWidget(covariant AddPage oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  //   print('AddPage - didUpdateWidget');
  // }

  // @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   super.deactivate();
  //   print('AddPage - deactivate');
  // }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     print('AddPage - dispose');
//     _timer.cancel();
//     _textEditingController.dispose();
//   }
// }