import 'package:flutter/material.dart';
import 'downloads_page.dart';

class DownloadsRouter {
  static void goToDownloadsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DownloadPage()),
    );
  }
}
