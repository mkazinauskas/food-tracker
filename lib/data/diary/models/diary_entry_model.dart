import 'package:flutter/foundation.dart';
import 'package:foodtracker/domain/diary/entities/diary_entry.dart';

class DiaryEntryModel extends DiaryEntry {
  DiaryEntryModel({
    int id,
    @required String photo,
    @required DateTime dateTime,
    @required String reason,
    @required String notes,
  }) : super(
          id: id,
          photo: photo,
          dateTime: dateTime,
          reason: reason,
          notes: notes,
        );

  factory DiaryEntryModel.fromMap(Map<String, dynamic> json) {
    return DiaryEntryModel(
      id: json['id'],
      photo: json['photo'],
      dateTime: DateTime.parse(json['dateTime']),
      reason: json['reason'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photo': photo,
      'dateTime': dateTime.toIso8601String(),
      'reason': reason,
      'notes': notes,
    };
  }
}
