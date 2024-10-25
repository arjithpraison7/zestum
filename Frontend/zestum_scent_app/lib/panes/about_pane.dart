import 'package:fluent_ui/fluent_ui.dart';

class AboutPane extends StatelessWidget {
  const AboutPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Acrylic(
      luminosityAlpha: 0.5,
      blurAmount: 20.0,
      tint: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat...',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(child: const Text('Write To Us'), onPressed: () {}),
                Button(child: const Text('Visit Our Site'), onPressed: () {}),
                Button(child: const Text('Instagram'), onPressed: () {}),
                Button(child: const Text('Facebook'), onPressed: () {}),
                Button(child: const Text('YouTube'), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}