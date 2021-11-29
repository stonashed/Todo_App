import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.only(left: 15),
            child:
                CircleAvatar(backgroundImage: AssetImage('assets/africa.jpg')),
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
        body: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.pink,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plan a trip to Germany',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(37, 43, 103, 1)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'this is my first trip to germany on a plane,if it is your first time please come to the back',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ]),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.pink,
                    ),
                    Text('Yesterday', style: TextStyle(color: Colors.pink)),
                  ],
                )
              ])),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {},
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
                child: Row(
                  children: [
                    Icon(Icons.check_circle_rounded),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
