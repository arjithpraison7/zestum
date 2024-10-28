import 'dart:typed_data';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:fluent_ui/fluent_ui.dart';

class DebugPane extends StatefulWidget {
  const DebugPane({super.key});

  @override
  State<DebugPane> createState() => _DebugPaneState();
}

class _DebugPaneState extends State<DebugPane> {
  late SerialPort? _port;
  bool isConnected = false;
  final int baudRate = 115200;
  final List<bool> fanStates = List.generate(10, (_) => false); // Lüfterstatus

  @override
  void initState() {
    super.initState();
    _initializeSerialConnection();
  }

  // Funktion zur seriellen Verbindung
  void _initializeSerialConnection() {
    final availablePorts = SerialPort.availablePorts;
    if (availablePorts.isNotEmpty) {
      _port = SerialPort(availablePorts[0]); // Erster gefundener Port
      _port!.config.baudRate = baudRate;

      if (_port!.openReadWrite()) {
        setState(() => isConnected = true);
        print("Verbindung erfolgreich hergestellt.");
        _sendCommandToESP("-1, connected"); // Befehl nach Verbindungsaufbau senden

        // Alle Lüfter ausschalten, nachdem die Verbindung hergestellt wurde
        _turnOffAllFans(); // Funktion zum Ausschalten aller Lüfter
      } else {
        print("Verbindung konnte nicht hergestellt werden.");
        setState(() => isConnected = false);
      }
    } else {
      print("Keine verfügbaren seriellen Ports gefunden.");
      setState(() => isConnected = false);
    }
  }

  // Funktion zum Senden von Kommandos an den ESP
  void _sendCommandToESP(String command) {
    if (_port != null && isConnected) {
      final data = Uint8List.fromList('$command\n'.codeUnits);
      _port!.write(data);
    }
  }

  // Alle Lüfter ausschalten
  void _turnOffAllFans() {
    for (int fanNumber = 1; fanNumber <= 10; fanNumber++) {
      _toggleFan(fanNumber, false); // Alle Lüfter ausschalten
    }
  }

  // Lüfter Ein-/Ausschalten
  void _toggleFan(int fanNumber, bool turnOn) {
    final action = turnOn ? 'on' : 'off';
    final command = '$fanNumber, $action';
    _sendCommandToESP(command);
    setState(() {
      fanStates[fanNumber - 1] = turnOn; // Status des Lüfters aktualisieren
    });
  }

  // Button zur erneuten Verbindung
  void _reconnect() {
    _port?.close();
    _initializeSerialConnection();
  }

  @override
  void dispose() {
    _port?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                isConnected ? 'Verbindung hergestellt' : 'Keine Verbindung',
                style: TextStyle(
                  color: isConnected ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 16),
              Button(
                onPressed: isConnected ? _reconnect : _initializeSerialConnection,
                child: Text(isConnected ? 'Neu verbinden' : 'Verbinden'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16, // Abstand zwischen den Lüftern
            runSpacing: 16, // Abstand zwischen den Zeilen
            children: List.generate(10, (index) {
              final fanNumber = index + 1;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Lüfter $fanNumber'),
                  const SizedBox(height: 4),
                  Button(
                    onPressed: () {
                      final turnOn = !fanStates[index]; // Status umkehren
                      _toggleFan(fanNumber, turnOn);
                    },
                    child: Text(fanStates[index] ? 'Ausschalten' : 'Einschalten'),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
