import 'package:flutter/material.dart';
import 'package:task_app/feature/screens/add_task_screen.dart';
import 'package:task_app/feature/screens/completed_task_screen.dart';
import 'package:task_app/feature/screens/favorite_task_screen.dart';
import 'package:task_app/feature/screens/pending_screen.dart';
import 'package:task_app/product/widgets/drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  static const id = 'tab_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => const SingleChildScrollView(
              child: AddTaskScreen(),
            ));
  }

  final List<Map<String, dynamic>> _pages = [
    {'pageName': const PendingScreen(), 'title': "Pending Task"},
    {'pageName': const CompletedScreen(), 'title': "Completed Task"},
    {'pageName': const FavoriteScreen(), 'title': "Favorite Task"}
  ];

  var _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
      ),
      drawer: const DrawerWidget(),
      body: _pages[_selectedPage]['pageName'],
      floatingActionButton: _selectedPage == 0
          ? FloatingActionButton(
              tooltip: 'Add Task',
              onPressed: () => _addTask(context),
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pending Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Complated Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite Task',
          )
        ],
      ),
    );
  }
}
