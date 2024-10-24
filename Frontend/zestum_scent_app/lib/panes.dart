import 'package:fluent_ui/fluent_ui.dart';

class SharePane extends StatelessWidget {
  const SharePane({Key? key}) : super(key: key);

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

class DebugPane extends StatelessWidget {
  const DebugPane({Key? key}) : super(key: key);

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

class ScentPane extends StatelessWidget {
  const ScentPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Acrylic(
      luminosityAlpha: 0.5,
      blurAmount: 20.0,
      tint: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(10, (index) {
            return Text(
              'Scent ${index + 1}: ${100 - index * 5} ml',
              style: const TextStyle(fontSize: 16),
            );
          }),
        ),
      ),
    );
  }
}

class AboutPane extends StatelessWidget {
  const AboutPane({Key? key}) : super(key: key);

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
