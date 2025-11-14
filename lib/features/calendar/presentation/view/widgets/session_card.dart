import 'package:nader_mohamed_task/core/src/app_export.dart';

class SessionCard extends StatelessWidget {
  final SessionEntity session;
  const SessionCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('نوع الدعوى', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 6),
                  Text(session.caseType, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('رقم الدعوى', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 6),
                Text(session.caseNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('حضور الجلسة'),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF22BDB7)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
