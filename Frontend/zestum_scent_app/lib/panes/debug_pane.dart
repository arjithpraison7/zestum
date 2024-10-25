import 'package:fluent_ui/fluent_ui.dart';

class DebugPane extends StatelessWidget {
  const DebugPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[30],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(10, (index) {
                  return Text(
                    'Scent ${index + 1}: ${40 - index * 2}%',
                    style: const TextStyle(fontSize: 16),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[30],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(10, (index) {
                  return Text(
                    'Fan ${index + 1}: ${index % 2 == 0 ? 'On' : 'Off'}',
                    style: const TextStyle(fontSize: 16),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}