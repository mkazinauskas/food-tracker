import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodtracker/domain/diary/entities/diary_entry.dart';
import 'package:foodtracker/domain/diary/diary_entries_repository.dart';
import 'package:foodtracker/domain/failures.dart';
import 'package:foodtracker/domain/usecase.dart';

class AddNewEvent extends UseCase<DiaryEntry, AddNewEventParams> {

  final DiaryEntriesRepository _diaryEntriesRepository;

  AddNewEvent(this._diaryEntriesRepository);

  @override
  Future<Either<Failure, DiaryEntry>> execute(AddNewEventParams params) async {
    DiaryEntry entry = DiaryEntry(
      photo: params.photo,
      dateTime: params.dateTime,
      reason: params.reason,
      notes: params.notes,
    );
    return await _diaryEntriesRepository.save(entry);
  }
}

class AddNewEventParams extends Equatable {
  final String photo;
  final DateTime dateTime;
  final String reason;
  final String notes;

  AddNewEventParams({
    @required this.photo,
    @required this.dateTime,
    @required this.reason,
    @required this.notes,
  });

  @override
  List<Object> get props => [dateTime];
}
