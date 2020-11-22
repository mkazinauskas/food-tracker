import 'package:dartz/dartz.dart';
import 'package:foodtracker/domain/diary/entities/diary_entry.dart';

import 'failures.dart';

abstract class DiaryEntriesRepository {

  Future<Either<Failure, DiaryEntry>> save(DiaryEntry diaryEntry);

  Future<Either<Failure, List<DiaryEntry>>> getDiaryEntries();
}
