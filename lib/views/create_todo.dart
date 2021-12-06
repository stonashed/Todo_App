import 'package:flutter/material.dart';
import 'package:todo_app/utiles.dart';

class ClassTodoView extends StatefulWidget {
  const ClassTodoView({Key? key}) : super(key: key);

  @override
  State<ClassTodoView> createState() => _ClassTodoViewState();
}

class _ClassTodoViewState extends State<ClassTodoView> {
  get height => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New To Do'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    label: Text('Title'),
                    hintText: ('Please input your title'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: customBlue),
                    ))),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 5,
              decoration: InputDecoration(
                  label: Text('Description'),
                  hintText: 'Please enter desscription here',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: customBlue))),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 365)));
                  },
                  keyboardType: TextInputType.datetime,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  decoration: InputDecoration(
                    label: Text('Date'),
                    hintText: ('Please enter a date'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: customBlue),
                    ),
                  ),
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextFormField(
                        onTap: () {
                          showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                        },
                        keyboardType: TextInputType.datetime,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          label: Text('Time'),
                          hintText: ('Please a time'),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: customBlue),
                          ),
                        )))
              ],

            ),
            const SizedBox(height: 35),
            TextButton(
              onPressed: () {},
              child: Text(
                'Create To Do',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: customBlue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
