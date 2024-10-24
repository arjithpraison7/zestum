import 'package:fluent_ui/fluent_ui.dart';
import 'panes.dart';

class ZestumScentBarHome extends StatefulWidget {
  const ZestumScentBarHome({super.key});

  @override
  _ZestumScentBarHomeState createState() => _ZestumScentBarHomeState();
}

class _ZestumScentBarHomeState extends State<ZestumScentBarHome> {
  String activePane = 'home';

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        selected: _getSelectedIndex(activePane),
        onChanged: (index) {
          setState(() {
            activePane = _getPaneName(index);
          });
        },
        displayMode: PaneDisplayMode.compact,
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.screen_cast),
            title: const Text('Share Screen'),
            body: const SharePane(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.branch_commit),
            title: const Text('Test Device'),
            body: const DebugPane(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.info),
            title: const Text('About'),
            body: const AboutPane(),
          ),
        ],
      ),
    );
  }

  int _getSelectedIndex(String paneName) {
    switch (paneName) {
      case 'share':
        return 0;
      case 'debug':
        return 1;
      case 'about':
        return 2;
      default:
        return 0;
    }
  }

  String _getPaneName(int index) {
    switch (index) {
      case 0:
        return 'share';
      case 1:
        return 'debug';
      case 2:
        return 'about';
      default:
        return 'share';
    }
  }
}
