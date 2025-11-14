class SessionEntity {
  final bool isActive;
  final String caseNumber;
  final String caseType;
  final DateTime startTime;
  final DateTime endTime;

  SessionEntity({
    required this.isActive,
    required this.caseNumber,
    required this.caseType,
    required this.startTime,
    required this.endTime,
  });
}
