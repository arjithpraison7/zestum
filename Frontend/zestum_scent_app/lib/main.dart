import 'package:flutter/material.dart';

void main() {
  runApp(ZestumScentBarApp());
}

class ZestumScentBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zestum Scent Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ZestumScentBarHome(),
    );
  }
}

class ZestumScentBarHome extends StatefulWidget {
  @override
  _ZestumScentBarHomeState createState() => _ZestumScentBarHomeState();
}

class _ZestumScentBarHomeState extends State<ZestumScentBarHome> {
  String activePane = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Zestum Scent Bar'),
            Row(
              children: [
                const Text(
                  'Connection Status: Device Connected',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green, // Green color for "Connected" status
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          // Left menu bar
          Container(
            width: 200,
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MenuButton(
                  title: 'Share Screen',
                  onPressed: () {
                    setState(() {
                      activePane = 'share';
                    });
                  },
                ),
                MenuButton(
                  title: 'Debug',
                  onPressed: () {
                    setState(() {
                      activePane = 'debug';
                    });
                  },
                ),
                MenuButton(
                  title: 'Scent Level',
                  onPressed: () {
                    setState(() {
                      activePane = 'scent';
                    });
                  },
                ),
                MenuButton(
                  title: 'About',
                  onPressed: () {
                    setState(() {
                      activePane = 'about';
                    });
                  },
                ),
              ],
            ),
          ),
          // Main content area
          Expanded(
            child: Column(
              children: [
                if (activePane == 'share')
                  Expanded(
                    child: Container(
                      color: Colors.grey[300],
                      margin: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'Shared Content Preview',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                if (activePane == 'share')
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add logic for sharing window here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text('Share Window'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Add logic for sharing screen here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text('Share Screen'),
                        ),
                      ],
                    ),
                  ),
                if (activePane == 'debug')
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey[300],
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Detected Scents:',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ...List.generate(
                                    10,
                                    (index) => Text(
                                      'Scent ${index + 1}: ${40 - index * 2}%',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              color: Colors.grey[300],
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Triggered Fans:',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ...List.generate(
                                    10,
                                    (index) => Text(
                                      'Fan ${index + 1}: ${index % 2 == 0 ? 'On' : 'Off'}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (activePane == 'scent')
                  Expanded(
                    child: Container(
                      color: Colors.grey[300],
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Scent Levels (ml):',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...List.generate(
                            10,
                            (index) => Text(
                              'Scent ${index + 1}: ${100 - index * 5} ml',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (activePane == 'about')
                  Expanded(
                    child: Container(
                      color: Colors.grey[300],
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About Us',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat, nulla a convallis ullamcorper, sapien erat suscipit velit, nec elementum risus ligula nec nunc. Curabitur gravida tortor ac eros laoreet, non fermentum magna venenatis.',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac velit sed neque tincidunt gravida. Aenean in suscipit sem, vel viverra sapien. Integer euismod vehicula velit, eu sollicitudin lorem dignissim id.',
                            style: TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add logic for writing to the company
                                },
                                child: const Text('Write To Us'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Add logic for visiting the website
                                },
                                child: const Text('Visit Our Site'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Add logic for Instagram link
                                },
                                child: const Text('Instagram'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Add logic for Facebook link
                                },
                                child: const Text('Facebook'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Add logic for YouTube link
                                },
                                child: const Text('YouTube'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                if (activePane.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text(
                        'Welcome to Zestum Scent Bar!',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const MenuButton({required this.title, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        child: Text(title),
      ),
    );
  }
}
