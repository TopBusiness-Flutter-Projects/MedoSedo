import 'package:flutter/material.dart';
import 'package:medosedo_ecommerce/localization/app_localization.dart';

String getTranslated(String key, BuildContext context) {
  print(key+" "+AppLocalization.of(context)!.translate(key)!);
  return AppLocalization.of(context)!.translate(key)!;
}