import 'package:beanies/data/models/game.dart';
import 'package:beanies/data/models/user.dart';
import 'package:beanies/data/repositories/game_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final GameRepository _gameRepository;
  GameCubit(this._gameRepository) : super(GameLoadInProgress());

  void loadGames() {
    try {
      var games = _gameRepository.get();
      emit(GameLoadSuccess(games));
    } catch (e) {
      emit(GameLoadFailed(e.toString()));
    }
  }

  void createGame(List<User> players) {
    try {
      var game = Game(
          id: Uuid().v4(),
          users: players.map<String>((e) => e.id).toList(),
          scores: <Map<String, int>>[],
          currentRound: 0);
      _gameRepository.add(game);
      emit(GameLoadSuccess(_gameRepository.get()));
    } catch (e) {
      emit(GameLoadFailed(e.toString()));
    }
  }

  void addScores(Game game, Map<String, int> scores) {
    try {
      var updatedScores = List<Map<String, int>>.from(game.scores);
      updatedScores.add(scores);
      var updatedGame = game.copyWith(
          scores: updatedScores, currentRound: game.currentRound + 1);
      _gameRepository.update(updatedGame);
      emit(GameLoadSuccess(_gameRepository.get()));
    } catch (e) {
      emit(GameLoadFailed(e.toString()));
    }
  }
}
