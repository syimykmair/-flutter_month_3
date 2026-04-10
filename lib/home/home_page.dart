import 'package:flutter/material.dart';
import 'package:todo_list/add/add_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> tasks = [];

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
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('HomePage - didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: tasks.isEmpty
                ? Center(child: Text('Нет задач',style:
                 TextStyle( fontSize: 18),))
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 77, 172, 250),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            tasks[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
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
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: const Color.fromARGB(255, 77, 172, 250),
                ),
                child: Text(
                  '+  Добавить задачу',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddPage()),
    );
    if (result != null) {
      setState(() {
       tasks.insert(0, result);
      });
    }
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
