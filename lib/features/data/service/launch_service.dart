// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LunchWeb {
  Future<void> openWebsite(BuildContext context, final Uri url) async {
    try {
      if (!await canLaunchUrl(url)) {
        _showErrorDialog(context, 'This website can not be open');
      }

      final success = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
      if (!success) {
        _showErrorDialog(context, 'Falid to open this webside');
      }
    } catch (e) {
      _showErrorDialog(context, 'There is an error $e');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
