
import 'package:flutter/material.dart';
import 'package:project_mars/data/task_dao.dart';
import 'package:project_mars/widgets/rating_stars.dart';

import '../data/strings.dart';
import '../model/task.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  double _difficulty = 0.0;
  TextEditingController titleController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TaskDao taskDao = TaskDao();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(Strings.newTask),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black26,
            ),
            child: ClipRRect(
              child: Image.network(
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Icon(Icons.add_a_photo,
                      color: Colors.white, size: 40);
                },
                imageController.text,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Flexible(
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (url) {
                        setState(() {});
                      },
                      controller: imageController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          hintText: Strings.imageUrl),
                      keyboardType: TextInputType.text,
                      validator: (value) => _checkField(value),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          hintText: Strings.taskTittle),
                      keyboardType: TextInputType.text,
                      validator: (value) => _checkField(value),
                    ),
                    const SizedBox(height: 30),
                    RatingStars(
                      taskDifficulty: 0.0,
                      ignoreGestures: false,
                      onRatingUpdated: (rating) {
                        setState(
                          () {
                            _difficulty = rating;
                          },
                        );
                      },
                      itemSize: 40,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Task task = Task(
                              id: DateTime.now().millisecond,
                              title: titleController.text,
                              image: imageController.text,
                              difficulty: _difficulty.toString(),
                              level: 0,
                            );
                            taskDao.save(task);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(Strings.creatingNewTask),
                              ),
                            );
                            Navigator.of(context).pop();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: const Text(
                          Strings.add,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String? _checkField(String? value) {
  if (value == null || value.isEmpty) {
    return Strings.imageUrl;
  }
  return null;
}
