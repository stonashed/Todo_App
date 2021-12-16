import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/views/todo_tile_view.dart';
import 'package:todo_app/utiles.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/controllers/todo_controller.dart';

import 'create_todo.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TodoController _todoController = TodoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: CircleAvatar(backgroundImage: AssetImage('assets/africa.jpg')),
        ),
        title: const Text(
          'My Task',
        ),
        elevation: 0,
        actions: [
          Icon(Icons.sort),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<Todo?>(
          future: _todoController.getAlltTodos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                snapshot.data == null) {
              // ignore: prefer_const_constructors
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data == null) {
              return const Text('Ooops! Something went wrong',
                  style: TextStyle(fontSize: 30));
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  return TodoTileView(
                    todo: snapshot.data!.data[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: snapshot.data!.data.length);
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const ClassTodoView();
          }));
        },
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(37, 43, 103, 0.4),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    showBarModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return completedTodoWidget();
                        });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_rounded, color: customBlue),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text('Completed',
                              style: TextStyle(
                                  color: customBlue,
                                  fontWeight: FontWeight.w600)),
                          Icon(Icons.keyboard_arrow_down, color: customBlue),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      const Spacer(),
                      Text(
                        '24',
                        style: TextStyle(color: customBlue),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class completedTodoWidget extends StatelessWidget {
  const completedTodoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.check_circle,
          color: Colors.blue,
        ),
        title: Text('Plan a Trip To Germany'),
        subtitle: Text(
          'this is my first trip to germany on a plane, if it is your first time please come to the back',
          style: TextStyle(fontSize: 10),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
            Text('Yesterday'),
          ],
        ),
      ),
    );
  }
}
