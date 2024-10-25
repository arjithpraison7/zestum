import 'package:fluent_ui/fluent_ui.dart';
import 'panes/about_pane.dart';
import 'panes/debug_pane.dart';
import 'panes/share_pane.dart';
import 'widgets/connection_status.dart';

class ZestumScentBarHome extends StatefulWidget {
  const ZestumScentBarHome({super.key});

  @override
  ZestumScentBarHomeState createState() => ZestumScentBarHomeState();
}

class ZestumScentBarHomeState extends State<ZestumScentBarHome> {
  String activePane = 'home';

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        header: const Text("Scent-Bar Configuration Board"),
        selected: _getSelectedIndex(activePane),
        onChanged: (index) {
          setState(() {
            activePane = _getPaneName(index);
          });
        },
        displayMode: PaneDisplayMode.compact,
        items: [
          PaneItemSeparator(),
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
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.add_connection),
            title: const Text("Status: "),
            body: const ConnectionStatus(isConnected: true,),
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
