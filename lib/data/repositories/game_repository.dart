import 'package:beanies/data/constants/hive.dart';
import 'package:beanies/data/models/game.dart';
import 'package:hive/hive.dart';

class GameRepository {
  final Box<Game> _gameBox = Hive.box(HiveGameBoxKey);

  void add(Game game) {
    _gameBox.put(game.id, game);
  }

  void update(Game game) {
    _gameBox.put(game.id, game);
  }

  void delete(Game game) {
    _gameBox.delete(game.id);
  }

  List<Game> get() {
    return _gameBox.values.toList();
  }
}
