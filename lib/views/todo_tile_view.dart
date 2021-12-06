import 'package:flutter/material.dart';

class TodoTileView extends StatelessWidget {
  const TodoTileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
            Expanded(
              child: Column(
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
                      'this is my first trip to germany on a plane, if it is your first time please come to the back',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ]),
            ),
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
    );
  }
}
