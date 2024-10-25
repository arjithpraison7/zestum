import 'package:fluent_ui/fluent_ui.dart';

class ConnectionStatus extends StatelessWidget {
  final bool isConnected;

  const ConnectionStatus({
    super.key,
    required this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isConnected ? FluentIcons.plug_connected : FluentIcons.plug_disconnected,
          color: isConnected ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 8),
        Text(
          isConnected ? 'Device Connected' : 'Device Disconnected',
          style: TextStyle(
            fontSize: 16,
            color: isConnected ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
