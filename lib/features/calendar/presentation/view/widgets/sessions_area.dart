import 'package:nader_mohamed_task/core/src/app_export.dart';

class SessionsArea extends StatelessWidget {
  const SessionsArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.separated(
            itemCount: state.sessions.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final s = state.sessions[index];
              return Row(
                children: [
                  Container(
                      width: 110,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Text(
                            _formatTime(s.startTime),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _formatTime(s.endTime),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                  ),

                  const SizedBox(width: 8),

                  SessionCard(session: s),
                ],
              );
            },
          ),
        );
      },
    );
  }

  String _formatTime(DateTime t) {
    final String hour = t.hour.toString().padLeft(2, '0');
    final String minute = t.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
