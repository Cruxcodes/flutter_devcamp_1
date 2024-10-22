import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';

class HappyBirthday extends StatefulWidget {
  const HappyBirthday({super.key});

  @override
  State<HappyBirthday> createState() => _HappyBirthdayState();
}

class _HappyBirthdayState extends State<HappyBirthday> {
  DateTime selectedDate = DateTime.now();
  DateTime todaysDate = DateTime.now();
  late ConfettiController _controllerCenterRight;
  String age ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  Path drawStar(Size size) {
    // Method to convert degrees to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerCenterRight.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1780, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }

      if (selectedDate.day == todaysDate.day &&
          selectedDate.month == todaysDate.month) {
        _controllerCenterRight.play();
        player.stop();
        player.play(AssetSource("audio/bday_song.mp3"));
        age = (todaysDate.year - selectedDate.year).toString();
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Please Input your birthday"),
            SizedBox(height: 20,),
            age.isNotEmpty ?Text("Congrats you're $age now!!! I wish you all the best"):SizedBox(),
            Align(
              alignment: Alignment.centerRight,
              child: ConfettiWidget(
                confettiController: _controllerCenterRight,
                blastDirection: pi, // radial value - LEFT
                particleDrag: 0.05, // apply drag to the confetti
                emissionFrequency: 0.05, // how often it should emit
                numberOfParticles: 20, // number of particles to emit
                gravity: 0.05, // gravity - or fall speed
                shouldLoop: false,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink
                ], // manually specify the colors to be used
                strokeWidth: 1,
                strokeColor: Colors.white,
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Birth Date'),
            ),
          ],
        ),
      ),
    );
  }
}
