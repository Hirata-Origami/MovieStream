import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class VideoPlayerScreen extends StatefulWidget {
  final bool isTv;
  final String movieId;
  final String seriesId;
  final int seasonNumber;
  final int episodeNumber;

  const VideoPlayerScreen(
      {Key? key,
      required this.isTv,
      required this.movieId,
      required this.seriesId,
      required this.seasonNumber,
      required this.episodeNumber})
      : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with WidgetsBindingObserver {
  WebViewController? _webViewController;
  bool _isLoading = true;
  String _currentUrl = '';
  String site = 'https://vidsrc.xyz/embed/movie/5';
  List<String> _blockedRules = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _loadBlockedRules().then((rules) {
      setState(() {
        _blockedRules = rules;
      });
      _initializeWebViewController();
    });
    if (widget.isTv) {
      site =
          'https://vidsrc.xyz/embed/tv?tmdb=${widget.seriesId}&season=${widget.seasonNumber}&episode=${widget.episodeNumber}';
    } else {
      site = 'https://vidsrc.xyz/embed/movie/${widget.movieId}';
    }
  }

  Future<List<String>> _loadBlockedRules() async {
    final url = 'https://easylist-downloads.adblockplus.org/easylist.txt';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final lines = response.body.split('\n');
        final rules = <String>[];
        for (var line in lines) {
          line = line.trim();
          if (line.isEmpty || line.startsWith('!')) continue;
          if (line.startsWith('||')) {
            line = line.substring(2);
          }
          line = line.replaceAll('^', '');
          rules.add(line);
        }
        return rules;
      }
    } catch (e) {
      print("Error loading EasyList rules: $e");
    }
    return [];
  }

  void _initializeWebViewController() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            print(request.url);
            for (var rule in _blockedRules) {
              if (request.url.contains(rule)) {
                print('Blocked URL: ${request.url} due to rule: $rule');
                return NavigationDecision.prevent;
              }
            }
            setState(() {
              _currentUrl = request.url;
            });
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _currentUrl = url;
            });
          },
          onPageFinished: (String url) async {
            setState(() {
              _isLoading = false;
              _currentUrl = url;
            });
            await _webViewController?.runJavaScript('''
              // Override devtool redirection if present.
              if (window.DisableDevtool && window.DisableDevtool.ondevtoolopen) {
                window.DisableDevtool.ondevtoolopen = function(){
                  console.log("DevTool open intercepted; no redirection.");
                };
              }
              
              // Wait for the video element and play it when ready.
              function waitForVideo() {
                var video = document.querySelector('video');
                if (video) {
                  video.oncanplay = function() {
                    VideoReadyChannel.postMessage('videoReady');
                    video.play(); // Ensure play is called here
                  };
                  //video.play(); // Moved inside oncanplay
                } else {
                  setTimeout(waitForVideo, 200);
                }
              }
              waitForVideo();
            ''');
          },
          onWebResourceError: (WebResourceError error) {
            print("Web error: ${error.description}");
            if (!_blockedRules.any((rule) => _currentUrl.contains(rule))) {
              _webViewController?.loadRequest(
                Uri.parse('https://vidsrc.xyz/embed/movie/${widget.movieId}'),
              );
            }
          },
        ),
      )
      ..addJavaScriptChannel(
        'VideoReadyChannel',
        onMessageReceived: (JavaScriptMessage message) {
          setState(() {
            _isLoading = false;
          });
        },
      )
      ..loadRequest(
        Uri.parse(site),
      );
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_webViewController != null)
            WebViewWidget(controller: _webViewController!),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
