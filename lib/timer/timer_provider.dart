import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  late Stopwatch _stopwatch;
  late Timer _timer;
  List<String> laps = [];

  TimerProvider() {
    _stopwatch = Stopwatch();
  }

void startTimer() {
  if (!_stopwatch.isRunning) {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      notifyListeners();
    });
    _stopwatch.start();
    notifyListeners(); // Tambahkan pemanggilan notifyListeners() di sini.
  }
}

void stopTimer() {
  if (_stopwatch.isRunning) {
    _timer.cancel();
    _stopwatch.stop();
    notifyListeners();
  }
}


  void resetTimer() {
    _timer.cancel();
    _stopwatch.reset();
    laps.clear();
    notifyListeners();
  }

  void recordLap() {
    if (_stopwatch.isRunning) {
      laps.add(formatTime(_stopwatch.elapsedMilliseconds));
      notifyListeners();
    }
  }

  bool isRunning() {
    return _stopwatch.isRunning;
  }

  String getElapsedTime() {
    return formatTime(_stopwatch.elapsedMilliseconds);
  }

  List<String> getLaps() {
    return laps;
  }

  String formatTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    hundreds %= 100;
    seconds %= 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String hundredsStr = hundreds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr:$hundredsStr';
  }
}
