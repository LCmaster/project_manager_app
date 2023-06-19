import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Project Page",
        ),
      ),
      body: const Center(
        child: Text(
          "Project Page",
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Summary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Task Boards',
          ),
        ],
        currentIndex: _tabIndex,
        // selectedItemColor: Colors.blue[800],
        onTap: (index) => setState(
          () {
            _tabIndex = index;
          },
        ),
      ),
    );
  }
}
