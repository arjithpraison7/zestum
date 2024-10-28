import 'dart:typed_data';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'dart:async';

class DebugPane extends StatefulWidget {
  const DebugPane({super.key});

  @override
  State<DebugPane> createState() => _DebugPaneState();
}

class _DebugPaneState extends State<DebugPane> {
  late SerialPort? _port;
  bool isConnected = false;
  final int baudRate = 115200;
  final List<bool> fanStates = List.generate(10, (_) => false);
  Timer? _connectionCheckTimer;

  @override
  void initState() {
    super.initState();
    _initializeSerialConnection();
    _startConnectionCheck();
  }

  void _initializeSerialConnection() {
    final availablePorts = SerialPort.availablePorts;
    if (availablePorts.isNotEmpty) {
      _port = SerialPort(availablePorts[0]);
      _port!.config.baudRate = baudRate;

      if (_port!.openReadWrite()) {
        setState(() => isConnected = true);
        print("Connection successful.");
        _sendCommandToESP("-1, connected");
        _turnOffAllFans();
      } else {
        print("Not able to connect.");
        setState(() => isConnected = false);
      }
    } else {
      print("No ports found.");
      setState(() => isConnected = false);
    }
  }

  void _startConnectionCheck() {
    _connectionCheckTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_port == null || !_port!.isOpen) {
        setState(() {
          isConnected = false;
          _port?.close();
        });
        print("Connection to device is lost.");
        _turnOffAllFans();
      }
    });
  }

  void _sendCommandToESP(String command) {
    if (_port != null && isConnected && _port!.isOpen) {
      try {
        final data = Uint8List.fromList('$command\n'.codeUnits);
        _port!.write(data);
      } catch (e) {
        print("Error on sending data: $e");
      }
    } else {
      print("Port is not open or not connected.");
    }
  }


  void _turnOffAllFans() {
    for (int fanNumber = 1; fanNumber <= 10; fanNumber++) {
      _toggleFan(fanNumber, false);
    }
  }

  
  void _toggleFan(int fanNumber, bool turnOn) {
    final action = turnOn ? 'on' : 'off';
    final command = '$fanNumber, $action';
    _sendCommandToESP(command);
    setState(() {
      fanStates[fanNumber - 1] = turnOn;
    });
  }

  
  void _reconnect() {
    _port?.close();
    _initializeSerialConnection();
  }

  @override
  void dispose() {
    _connectionCheckTimer?.cancel();
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
                isConnected ? 'Device Connected' : 'Device Not Connected',
                style: TextStyle(
                  color: isConnected ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 16),
              Button(
                onPressed: isConnected ? _reconnect : _initializeSerialConnection,
                child: Text(isConnected ? 'Reconnect' : 'Connect'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(10, (index) {
              final fanNumber = index + 1;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Lüfter $fanNumber'),
                  const SizedBox(height: 4),
                  Button(
                    onPressed: () {
                      final turnOn = !fanStates[index];
                      _toggleFan(fanNumber, turnOn);
                    },
                    child: Text(fanStates[index] ? 'Off' : 'On'),
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
