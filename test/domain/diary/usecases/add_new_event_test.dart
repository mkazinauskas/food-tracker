import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodtracker/domain/diary/diary_entries_repository.dart';
import 'package:foodtracker/domain/diary/entities/diary_entry.dart';
import 'package:foodtracker/domain/diary/usecases/add_new_event.dart';
import 'package:mockito/mockito.dart';

class MockDiaryEntriesRepository extends Mock
    implements DiaryEntriesRepository {}

void main() {
  AddNewEvent usecase;
  MockDiaryEntriesRepository mockDiaryEntriesRepository;

  setUp(() {
    mockDiaryEntriesRepository = MockDiaryEntriesRepository();
    usecase = AddNewEvent(mockDiaryEntriesRepository);
  });

  DiaryEntry _toRepoParam(DiaryEntry expectedResult) {
    return DiaryEntry(
      photo: expectedResult.photo,
      dateTime: expectedResult.dateTime,
      reason: expectedResult.reason,
      notes: expectedResult.notes,
    );
  }

  AddNewEventParams _toRequest(DiaryEntry expectedResult) {
    return AddNewEventParams(
      photo: expectedResult.photo,
      dateTime: expectedResult.dateTime,
      reason: expectedResult.reason,
      notes: expectedResult.notes,
    );
  }

  test(
    'should get save diary entry to repository',
    () async {
      DiaryEntry expectedResult = new DiaryEntry(
        id: 10,
        photo: 'photo',
        dateTime: DateTime.now(),
        reason: 'reason',
        notes: 'notes',
      );

      var repoParam = _toRepoParam(expectedResult);
      when(mockDiaryEntriesRepository.save(repoParam))
          .thenAnswer((_) async => Right(expectedResult));

      var params = _toRequest(expectedResult);

      final result = await usecase.execute(params);

      expect(result, Right(expectedResult));

      verify(mockDiaryEntriesRepository.save(repoParam)).called(1);

      verifyNoMoreInteractions(mockDiaryEntriesRepository);
    },
  );
}
