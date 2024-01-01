import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:task_app/feature/screens/add_task_screen.dart';
import 'package:task_app/feature/screens/completed_task_screen.dart';
import 'package:task_app/feature/screens/demo/demo_panding.dart';
import 'package:task_app/feature/screens/favorite_task_screen.dart';
import 'package:task_app/feature/screens/pending_screen.dart';
import 'package:task_app/product/widgets/drawer.dart';

class DemoHome extends StatefulWidget {
  const DemoHome({super.key});

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

final List<Map<String, dynamic>> _pages = [
  {'pageName': const DemoPanding(), 'title': "Demo pending Task"},
  {'pageName': const CompletedScreen(), 'title': "Completed Task"},
  {'pageName': const FavoriteScreen(), 'title': "Favorite Task"},
];
var _selectedPage = 0;

void _addTask(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SingleChildScrollView(
            child: AddTaskScreen(),
          ));
}

class _DemoHomeState extends State<DemoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_selectedPage]['pageName'],
      drawer: DrawerWidget(),
      floatingActionButton: _selectedPage == 0
          ? FloatingActionButton(
              tooltip: 'Add Task',
              onPressed: () => _addTask(context),
              child: Icon(
                Icons.add,
                color: context
                    .general.appTheme.floatingActionButtonTheme.foregroundColor,
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,

        elevation: 10,
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.list,
            ),
            label: _pages[0]['title'],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.done),
            label: _pages[1]['title'],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: _pages[2]['title'],
          )
        ],
      ),
    );
  }
}
