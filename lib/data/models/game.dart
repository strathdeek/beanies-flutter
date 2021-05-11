import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'game.g.dart';

@HiveType(typeId: 1)
class Game extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final List<String> users;
  @HiveField(2)
  final List<Map<String, int>> scores;
  @HiveField(3)
  final int currentRound;
  @HiveField(4)
  final bool isDone;
  @HiveField(5)
  final String winner;

  Game({
    required this.id,
    required this.users,
    required this.scores,
    required this.currentRound,
    required this.isDone,
    required this.winner,
  });

  @override
  List<Object> get props {
    return [
      id,
      users,
      scores,
      currentRound,
      isDone,
      winner,
    ];
  }

  Game copyWith({
    String? id,
    List<String>? users,
    List<Map<String, int>>? scores,
    int? currentRound,
    bool? isDone,
    String? winner,
  }) {
    return Game(
      id: id ?? this.id,
      users: users ?? this.users,
      scores: scores ?? this.scores,
      currentRound: currentRound ?? this.currentRound,
      isDone: isDone ?? this.isDone,
      winner: winner ?? this.winner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'users': users,
      'scores': scores,
      'currentRound': currentRound,
      'isDone': isDone,
      'winner': winner,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'],
      users: List<String>.from(map['users']),
      scores: List<Map<String, int>>.from(map['scores']?.map((x) => x)),
      currentRound: map['currentRound'],
      isDone: map['isDone'],
      winner: map['winner'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String source) => Game.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
