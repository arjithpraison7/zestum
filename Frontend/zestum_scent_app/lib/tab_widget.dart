import 'package:flutter/material.dart';
import 'package:videosdk_webrtc/flutter_webrtc.dart';
import 'thumbnail_widget.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    Key? key,
    required List<DesktopCapturerSource> sources,
    required this.onSourceChange
  }) : _sources = sources, super(key: key);

  final List<DesktopCapturerSource> _sources;
  final ValueChanged<DesktopCapturerSource?> onSourceChange;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  SourceType _sourceType = SourceType.Screen;

  DesktopCapturerSource? _selectedSource;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            constraints:
                const BoxConstraints.expand(height: 24),
            child: TabBar(
                onTap: (value) => _sourceType = value == 0
                    ? SourceType.Screen
                    : SourceType.Window,
                tabs: const [
                  Tab(
                      child: Text(
                    'Entire Screen',
                    style: TextStyle(color: Colors.black54),
                  )),
                  Tab(
                      child: Text(
                    'Window',
                    style: TextStyle(color: Colors.black54),
                  )),
                ]),
          ),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            child: TabBarView(children: [
              Align(
                  alignment: Alignment.center,
                  child: GridView.count(
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                    children: widget._sources
                        .asMap()
                        .entries
                        .where((element) =>
                            element.value.type ==
                            SourceType.Screen)
                        .map((e) => ThumbnailWidget(
                              onTap: (source) {
                                if (context.mounted) {
                                  setState(() {
                                    _selectedSource = source;
                                    widget.onSourceChange(_selectedSource);
                                  });
                                }
                              },
                              source: e.value,
                              selected: _selectedSource?.id ==
                                 e.value.id,
                            ))
                        .toList(),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: GridView.count(
                    crossAxisSpacing: 8,
                    crossAxisCount: 3,
                    children: widget._sources
                        .asMap()
                        .entries
                        .where((element) =>
                            element.value.type ==
                            SourceType.Window)
                        .map((e) => ThumbnailWidget(
                              onTap: (source) {
                                if (context.mounted) {
                                  setState(() {
                                    _selectedSource = source;
                                    widget.onSourceChange(_selectedSource);
                                  });
                                }
                              },
                              source: e.value,
                              selected: _selectedSource?.id ==
                                  e.value.id,
                            ))
                        .toList(),
                  )),
            ]),
          )
        ],
      ),
    );
  }
}