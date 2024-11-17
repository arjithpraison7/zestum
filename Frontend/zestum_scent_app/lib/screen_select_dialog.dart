import 'package:flutter/material.dart';
import 'package:videosdk_webrtc/flutter_webrtc.dart'; // Import the package to handle desktop capture
import 'tab_widget.dart';  // Assuming TabWidget is in a separate file for displaying the sources

class ScreenSelectDialog extends StatefulWidget {
  const ScreenSelectDialog({Key? key}) : super(key: key);

  @override
  _ScreenSelectDialogState createState() => _ScreenSelectDialogState();
}

class _ScreenSelectDialogState extends State<ScreenSelectDialog> {
  List<DesktopCapturerSource> _sources = []; // List to hold available screens and windows
  DesktopCapturerSource? _selectedSource; // To store the currently selected source

  // Callback to handle source change
  void _onSourceChange(DesktopCapturerSource? source) {
    setState(() {
      _selectedSource = source;
    });
  }

  // Function to fetch available screen/window sources
  Future<void> _fetchSources() async {
    try {
      // Get the list of screen/window sources (replace with actual logic)
      _sources = await getDesktopCapturerSources();
      setState(() {});
    } catch (e) {
      // Handle any errors in fetching sources
      print("Error fetching sources: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchSources(); // Fetch sources when the dialog is initialized
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Screen or Window'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display the TabWidget for selecting screen or window
          TabWidget(
            sources: _sources,
            onSourceChange: _onSourceChange,
          ),
          const SizedBox(height: 10),
          // Optionally show the name of the selected source
          if (_selectedSource != null)
            Text('Selected Source: ${_selectedSource?.name ?? "None"}'),
        ],
      ),
      actions: [
        // Cancel button to close the dialog
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        // Confirm button to select the source and return it
        TextButton(
          onPressed: () {
            if (_selectedSource != null) {
              // Return the selected source when confirmed
              Navigator.pop(context, _selectedSource);
            } else {
              // Show a Snackbar if no source is selected
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select a screen or window')),
              );
            }
          },
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}

// Example function to fetch desktop capturer sources
// Replace with actual logic for fetching screen/window sources
Future<List<DesktopCapturerSource>> getDesktopCapturerSources() async {
  // Placeholder: Replace with your method to get desktop capturer sources
  // Example return empty list (you should use a package or API to fetch actual sources)
  return [];
}
