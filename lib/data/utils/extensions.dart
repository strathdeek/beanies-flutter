import 'package:beanies/data/models/game.dart';

extension GameUtils on Game {
  Map<String, int> toTotalScores() {
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

extension CardNames on int {
  String toCardName() {
    switch (this) {
      case 1:
        return 'Ace';
      case 2:
        return 'Two';
      case 3:
        return 'Three';
      case 4:
        return 'Four';
      case 5:
        return 'Five';
      case 6:
        return 'Six';
      case 7:
        return 'Seven';
      case 8:
        return 'Eight';
      case 9:
        return 'Nine';
      case 10:
        return 'Ten';
      case 11:
        return 'Joker';
      case 12:
        return 'Queen';
      case 13:
        return 'King';
      case 14:
        return 'Ace';
      default:
        return '';
    }
  }
  // ···
}
