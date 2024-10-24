import 'package:fluent_ui/fluent_ui.dart';
import 'home_screen.dart';

void main() {
  runApp(const ZestumScentBarApp());
}

class ZestumScentBarApp extends StatelessWidget {
  const ZestumScentBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Zestum Scent Bar',
      theme: FluentThemeData(
        accentColor: Colors.blue,
      ),
      home: const ZestumScentBarHome(),
    );
  }
}
