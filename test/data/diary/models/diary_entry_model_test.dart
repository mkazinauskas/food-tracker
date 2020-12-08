import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodtracker/data/diary/models/diary_entry_model.dart';
import 'package:foodtracker/domain/diary/diary_entries_repository.dart';
import 'package:foodtracker/domain/diary/entities/diary_entry.dart';
import 'package:foodtracker/domain/diary/usecases/add_new_event.dart';
import 'package:mockito/mockito.dart';

void main() {
  test(
    'should create diary entry model from json',
    () async {
      var result = DiaryEntryModel.fromMap({
        'id': 10,
        'photo': 'photo',
        'dateTime': '2020-01-02 03:04:05.006007',
        'reason': 'reason',
        'notes': 'notes'
      });

      expect(result.id, 10);
      expect(result.photo, 'photo');
      expect(result.dateTime, DateTime(2020, 1, 2, 3, 4, 5, 6, 7));
      expect(result.reason, 'reason');
      expect(result.notes, 'notes');
    },
  );

  test(
    'should create json from diary entry model',
    () async {
      var result = DiaryEntryModel(
              id: 10,
              photo: 'photo',
              dateTime: DateTime(2020, 1, 2, 3, 4, 5, 6, 7),
              reason: 'reason',
              notes: 'notes')
          .toMap();

      expect(result, {
        'id': 10,
        'photo': 'photo',
        'dateTime': '2020-01-02T03:04:05.006007',
        'reason': 'reason',
        'notes': 'notes'
      });
    },
  );
}
