import '../../domain/entities/session_entity.dart';

class SessionModel extends SessionEntity {
  SessionModel({
    required super.caseNumber,
    required super.caseType,
    required super.startTime,
    required super.endTime,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      caseNumber: json['caseNumber'] as String,
      caseType: json['caseType'] as String,
      startTime: DateTime.parse(json['start'] as String),
      endTime: DateTime.parse(json['end'] as String),
    );
  }
}
