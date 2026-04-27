import 'package:flutter/material.dart';
import 'package:todo_list/add/add_page.dart';
import 'package:todo_list/add/add_view_model.dart';
import 'dart:math';

import 'package:todo_list/database/app_database.dart';
import 'package:todo_list/database/app_repository.dart';
import 'package:todo_list/home/home_state.dart';
import 'package:todo_list/home/home_view_model.dart';
import 'package:todo_list/setting/setting_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final HomeViewModel vm;
  int _counter = 0;
  List<String> tasks = [];
  bool isVisible = true;
  Color containerColor = Colors.blue;
  List<Color> colorList = [Colors.red, Colors.blue, Colors.black, Colors.amber];
  AppDatabase db = AppDatabase();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('HomePage - initState');

    final db = AppDatabase();
    final repo = AppRepositoryImplementation(db: db);
    vm = HomeViewModel(repo: repo);
    vm.getList();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('HomePage - didChangeDependencies');
  }
  // @override
  // Widget build(BuildContext context) {
  //   print("HomePage - build");
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: Text(widget.title), centerTitle: true,
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: .center,
  //         children: [
  //           Visibility(
  //             visible: isVisible,
  //           child:  const Text('You have pushed the button this many times:'), ),
  //           Text(
  //             '$_counter',
  //             style: Theme.of(context).textTheme.headlineMedium,
  //           ),
  //           Container(width: 200, height: 100,color: containerColor),
  //           TextButton(onPressed: _upadateUI,
  //            child: Text('Test'))
  //         ],
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: _incrementCounter,
  //       tooltip: 'Increment',
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    print('HomePage - build');
    return BlocProvider.value(
  value: vm,
  child: Scaffold(
    appBar:
       AppBar(
            backgroundColor:
                Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingPage(),
                    ),
                  );
                },
              ),
            ],
          ),

    body: BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (state.isEmpty) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: Text('У вас еще нет задачи'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _navigateToPage,
                    child: Text('+ Добавить задачу'),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final todo = state.items[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 77, 172, 250),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          todo.title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _navigateToPage,
                    child: Text('+ Добавить задачу'),
                  ),
                ),
              ),
            ],
          );
        }
      },
    ),
  ),
);
//     return BlocProvider.value(
//       value: vm,
//       child: Scaffold(
//         body: BlocBuilder<HomeViewModel, HomeState>(
//           builder: (context, state) {
//             if (state.isEmpty) {
//               return Column(
//     children: [
//       Expanded(
//         child: Center(
//           child: Text('У вас еще нет задачи'),
//         ),
//       ),

//       Padding(
//         padding: const EdgeInsets.all(16),
//         child: SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: _navigateToPage,
//             style: ElevatedButton.styleFrom(
//               minimumSize: Size(double.infinity, 50),
//               backgroundColor: const Color.fromARGB(255, 77, 172, 250),
//             ),
            
//             child: Text(
//               '+  Добавить задачу',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     ],
//   );

//             } else {
//               return Scaffold(
//                 appBar: AppBar(
//                   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//  actions: [
//       IconButton(
//         icon: Icon(Icons.settings),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => SettingPage(),
//             ),
//           );
//         },
//       ),
//     ],


//                   title: Text(widget.title),
//                   centerTitle: true,
//                 ),
//                 body: Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: state.items.length,
//                         //itemCount: tasks.length,
//                         itemBuilder: (context, index) {
//                           final todo = state.items[index];
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 8,
//                             ),
//                             child: Container(
//                               padding: EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 77, 172, 250),
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Text(
//                                 todo.title,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: _navigateToPage,
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: Size(double.infinity, 50),
//                             backgroundColor: const Color.fromARGB(
//                               255,
//                               77,
//                               172,
//                               250,
//                             ),
//                           ),
//                           child: Text(
//                             '+  Добавить задачу',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
    //   return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,

    // actions: [
    //   IconButton(
    //     icon: Icon(Icons.settings),
    //     onPressed: () {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => SettingPage(),
    //         ),
    //       );
    //     },
    //   ),
    // ],

    //       title: Text(widget.title),
    //       centerTitle: true,
    //     ),
    //     body: Column(
    //       children: [
    //         Expanded(
    //           child:  ListView.builder(
    //                   itemCount: db.todoList.length,
    //                   //itemCount: tasks.length,
    //                   itemBuilder: (context, index) {
    //                     final todo = db.todoList[index];
    //                     return Padding(
    //                       padding: const EdgeInsets.symmetric(
    //                         horizontal: 16,
    //                         vertical: 8,
    //                       ),
    //                       child: Container(
    //                         padding: EdgeInsets.all(16),
    //                         decoration: BoxDecoration(
    //                           color: const Color.fromARGB(255, 77, 172, 250),
    //                           borderRadius: BorderRadius.circular(12),
    //                         ),
    //                         child: Text(
    //                           todo.title,
    //                           style: const TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 16,
    //                           ),
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 ),
    //         ),

    //         Padding(
    //           padding: const EdgeInsets.all(16),
    //           child: SizedBox(
    //             width: double.infinity,
    //             child: ElevatedButton(
    //               onPressed: _navigateToPage,
    //               style: ElevatedButton.styleFrom(
    //                 minimumSize: Size(double.infinity, 50),
    //                 backgroundColor: const Color.fromARGB(255, 77, 172, 250),
    //               ),
    //               child: Text(
    //                 '+  Добавить задачу',
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),

    //   );
  }

 void _navigateToPage() async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => AddPage()),
  );

  if (result != null) {
    setState(() {
      tasks.insert(0, result);
    });
  }
}

  void _upadateUI() {
    setState(() {
      isVisible = !isVisible;
      containerColor = colorList[Random().nextInt(colorList.length)];
    });
    print('isVisible : $isVisible');
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('HomePage - didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('HomePage - deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('HomePage - dispose');
  }
}

// extension on Random {
//   void nextInt(int lenth) {}
// }