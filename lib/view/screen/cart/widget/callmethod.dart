import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

void phoneCallMethod(String phone) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phone,
  );
  await launchUrl(launchUri);
}

void whatsAppMethod(String phone) async {
  String whats = '';
  if (Platform.isIOS) {
    if (phone.startsWith('20')) {
      whats = "whatsapp://wa.me/$phone/?text=${Uri.encodeFull('')}";
    } else {
      whats = "whatsapp://wa.me/20$phone/?text=${Uri.encodeFull('')}";
    }
  } else {
    if (phone.startsWith('20')) {
      whats = "whatsapp://send?phone=$phone&text=${Uri.encodeFull('')}";
    } else {
      whats = "whatsapp://send?phone=20$phone&text=${Uri.encodeFull('')}";
    }
  }
  await launchUrl(Uri.parse(whats ?? ''), mode: LaunchMode.externalApplication);
}
