import 'package:fluent_ui/fluent_ui.dart';

class SharePane extends StatelessWidget {
  const SharePane({super.key});

  @override
  Widget build(BuildContext context) {
    return Acrylic(
      luminosityAlpha: 0.5,
      blurAmount: 20.0,
      tint: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Shared Content Preview',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 16),
            Button(
              child: const Text('Share Window'),
              onPressed: () {
                // Logic für Window Sharing
              },
            ),
            const SizedBox(height: 8),
            Button(
              child: const Text('Share Screen'),
              onPressed: () {
                // Logic für Screen Sharing
              },
            ),
          ],
        ),
      ),
    );
  }
}