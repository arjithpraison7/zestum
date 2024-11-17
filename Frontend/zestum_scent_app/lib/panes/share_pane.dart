import 'package:fluent_ui/fluent_ui.dart';
import 'package:videosdk_webrtc/flutter_webrtc.dart';
import '../screen_select_dialog.dart';  // Import the ScreenSelectDialog widget

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
              onPressed: () async {
                // Open ScreenSelectDialog to choose a window
                final selectedSource = await showDialog<DesktopCapturerSource>(
                  context: context,
                  builder: (BuildContext context) {
                    return const ScreenSelectDialog();  // Show screen/window selection dialog
                  },
                );

                if (selectedSource != null) {
                  // Handle the selected source for sharing the window
                  // You can add the logic here to start window sharing with selectedSource
                  print('Window selected: ${selectedSource.name}');
                }
              },
            ),
            const SizedBox(height: 8),
            Button(
              child: const Text('Share Screen'),
              onPressed: () async {
                // Open ScreenSelectDialog to choose a screen
                final selectedSource = await showDialog<DesktopCapturerSource>(
                  context: context,
                  builder: (BuildContext context) {
                    return const ScreenSelectDialog();  // Show screen/window selection dialog
                  },
                );

                if (selectedSource != null) {
                  // Handle the selected source for sharing the screen
                  // You can add the logic here to start screen sharing with selectedSource
                  print('Screen selected: ${selectedSource.name}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
