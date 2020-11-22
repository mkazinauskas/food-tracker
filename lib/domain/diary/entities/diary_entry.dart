import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class DiaryEntry extends Equatable {
  final int id;
  final String photo;
  final DateTime dateTime;
  final String reason;
  final String notes;

  const DiaryEntry(
      {this.id,
      @required this.photo,
      @required this.dateTime,
      @required this.reason,
      @required this.notes});

  @override
  List<Object> get props => [id, dateTime];

  @override
  bool get stringify => false;
}
