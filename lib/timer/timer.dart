import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StopwatchApp extends StatefulWidget {
  @override
  _StopwatchAppState createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  var _stopwatch = Stopwatch();
  final _duration = const Duration(milliseconds: 10);
  List<String> laps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1450A3),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Immobile',
          style: GoogleFonts.goldman(fontSize: 25.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff191D88),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              formatTime(_stopwatch.elapsedMilliseconds),
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (!_stopwatch.isRunning) {
                        _stopwatch.start();
                        startTimer();
                      }
                    });
                  },
                  child: Icon(Icons.play_arrow),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_stopwatch.isRunning) {
                        _stopwatch.stop();
                      }
                    });
                  },
                  child: Icon(Icons.pause),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_stopwatch.isRunning) {
                        laps.add(formatTime(_stopwatch.elapsedMilliseconds));
                      }
                    });
                  },
                  child: Icon(Icons.flag),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _stopwatch.reset();
                      laps.clear();
                    });
                  },
                  child: Icon(Icons.stop),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Lap ${index + 1}: ${laps[index]}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    Timer(_duration, keepRunning);
  }

  void keepRunning() {
    if (_stopwatch.isRunning) {
      startTimer();
    }
    setState(() {});
  }

  String formatTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr.$hundredsStr';
  }
}
