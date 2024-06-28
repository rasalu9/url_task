import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlTask extends StatefulWidget {
  const UrlTask({super.key});

  @override
  State<UrlTask> createState() => _UrlTaskState();
}

class _UrlTaskState extends State<UrlTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextButton(
            onPressed: () {
              _launchUrl("https://github.com/rasalu9");
            },
            child: Text("url")),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              onPressed: () {
                _launchDial("+91 6284475711");
              },
              child: Text("Phone number")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              onPressed: () {
                _launchsms("+91 6284475711");
              },
              child: Text("SMS")),
        ),
      ],
    ));
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _launchDial(String url) async {
    if (!await launchUrl(Uri.parse("tel:$url"))) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchsms(String url) async {
    if (!await launchUrl(Uri.parse("sms:$url"))) {
      throw Exception('Could not launch $url');
    }
  }
}
