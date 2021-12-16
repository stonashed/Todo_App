import 'package:flutter/material.dart';
import 'package:todo_app/utiles.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:intl/intl.dart';

class ClassTodoView extends StatefulWidget {
  const ClassTodoView({Key? key}) : super(key: key);

  @override
  State<ClassTodoView> createState() => _ClassTodoViewState();
}

class _ClassTodoViewState extends State<ClassTodoView> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TodoController _todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New To Do'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titlecontroller,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  label: Text('Title'),
                  hintText: ('Please input your title'),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: customBlue))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please Enter a Title';
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 5,
                decoration: InputDecoration(
                    label: Text('Description'),
                    hintText: 'Please enter desscription here',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: customBlue))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter a description';
                  }
                }),
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
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)))
                              .then((value) {
                            setState(() {
                              _dateController.text =
                                  DateFormat.yMMMM().format(value!);
                              {}
                            });
                          });
                        },
                        controller: _dateController,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please select a date';
                          }
                          if (value ==
                              DateFormat.yMMMMd().format(DateTime.now())) {
                            return 'you selected today\'s date';
                          }
                        })),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextFormField(
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            setState(() {
                              _timeController.text = value!.format(context);
                            });
                          });
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
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please select time';
                          }
                        }))
              ],
            ),
            const SizedBox(height: 35),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String dateTime =
                      _dateController.text + " " + _timeController.text;
                  //todo is loading
                  setState(() {});
                  bool isSuccessful = await _todoController.createTodo(
                      title: _titlecontroller.text,
                      description: _descriptionController.text,
                      dateTime: dateTime);
                }
              },
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
