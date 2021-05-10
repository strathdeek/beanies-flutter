part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameLoadInProgress extends GameState {}

class GameLoadSuccess extends GameState {
  final List<Game> games;
  GameLoadSuccess(
    this.games,
  );

  @override
  List<Object> get props => [games];
}

class GameLoadFailed extends GameState {
  final String error;

  GameLoadFailed(this.error);

  @override
  List<Object> get props => [error];
}
