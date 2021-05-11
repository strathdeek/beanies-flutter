import 'package:beanies/data/models/game.dart';

extension GameUtils on Game {
  Map<String, int> getTotalScores() {
    var returnMap = <String, int>{};
    if (scores.isEmpty) {
      users.forEach((user) {
        returnMap[user] = 0;
      });
    } else {
      users.forEach((user) {
        returnMap[user] = scores.map((e) => e[user]).reduce((a, b) => a! + b!)!;
      });
    }
    return returnMap;
  }
  // ···
}
