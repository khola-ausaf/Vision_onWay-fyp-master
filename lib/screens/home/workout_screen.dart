import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Workout_screen extends StatefulWidget {
  const Workout_screen({Key? key}) : super(key: key);

  @override
  State<Workout_screen> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout_screen> {
  
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('progress');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'workout',
          style: TextStyle(
              fontSize: 21, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                //   defaultChild: Text('loading'),
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot
                        .child(
                          'title',
                        )
                        .value
                        .toString()),
                  );
                }),
          )
        ],
      ),
    );
  }
}
