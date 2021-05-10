// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameAdapter extends TypeAdapter<Game> {
  @override
  final int typeId = 1;

  @override
  Game read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Game(
      id: fields[0] as String,
      users: (fields[1] as List).cast<String>(),
      scores: (fields[2] as List)
          .map((dynamic e) => (e as Map).cast<String, int>())
          .toList(),
      currentRound: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.users)
      ..writeByte(2)
      ..write(obj.scores)
      ..writeByte(3)
      ..write(obj.currentRound);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
