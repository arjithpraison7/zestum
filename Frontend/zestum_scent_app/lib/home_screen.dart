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
        displayMode: PaneDisplayMode.compact,  // Kompakter Menü-Stil
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.screen_cast),
            title: const Text('Share Screen'),
            body: const SharePane(), // Hier wird der entsprechende Inhalt gesetzt
          ),
          PaneItem(
            icon: const Icon(FluentIcons.c_c_solid),
            title: const Text('Test Device'),
            body: const DebugPane(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.t_v_monitor_selected),
            title: const Text('Scent Level'),
            body: const ScentPane(),
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
      case 'scent':
        return 2;
      case 'about':
        return 3;
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
        return 'scent';
      case 3:
        return 'about';
      default:
        return 'share';
    }
  }
}
