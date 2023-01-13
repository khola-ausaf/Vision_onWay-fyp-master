// ignore_for_file: non_constant_identifier_names

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:sign_in/screens/home/congratulation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: camel_case_types
class LDay5_Exercises extends StatefulWidget {
  const LDay5_Exercises({Key? key}) : super(key: key);

  @override
  State<LDay5_Exercises> createState() => _LDay5_ExercisesState();
}

// ignore: camel_case_types
class _LDay5_ExercisesState extends State<LDay5_Exercises> {
  late YoutubePlayerController controller;
    late final dref = FirebaseDatabase.instance.reference().child("progress");
  late DatabaseReference databaseReference;
  setData() {
    dref.child("leg day 5").set({
       
      'title':"congralution you are successfully done your leg day 5 you are burn 100 calories in 10 mints"
    });
  }

  showData() {
    dref.once().then((snapshot) {
      print(snapshot);
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    databaseReference = dref;

    const url ='https://youtu.be/EvVpF5J6oeg';

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void deactivate() {
    controller.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (Context, Player) => Scaffold(
          appBar: AppBar(
            title: Text(
              ' Leg Day 5',
              style: TextStyle(
                  fontSize: 21, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            elevation: 1.0,
            backgroundColor: Color.fromARGB(255, 22, 142, 172),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Color.fromARGB(255, 255, 255, 255),
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: ListView(
            children: [
              Player,
              const ExpansionTile(
                title: Text('\n Leg Day 5: \n8 Exercises in 6 minutes duration',
                    style: TextStyle(
                      height: 0.98,
                      fontSize: 19.0,
                    )),
                textColor: Color.fromARGB(255, 6, 58, 70),
                children: <Widget>[
                  ListTile(
                      title: Text(
                          ' \nI hope you have learned how to perform each exercise from the cards right on the previous page. \n\nif not, then go back & tab on any exercise to find out the way to perform exercises easily. \n'),
                          
                           textColor:  Color.fromARGB(255, 6, 58, 70),),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  minimumSize: Size(10, 40),
                  side: BorderSide(
                    width: 2.5,
                    color: Color.fromARGB(255, 22, 142, 172),
                  ),
                ),
              onPressed:setData,
                child: const Text(
                  'Done!!',
                  style: TextStyle(
                    fontSize: 22,
                      color: Color.fromARGB(255, 6, 58, 70),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
