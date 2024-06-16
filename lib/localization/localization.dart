import 'package:flutter/material.dart';
import 'package:templateapp/localization/generated/l10n.dart';
import 'package:templateapp/utils/ioc.dart';

class Localization {
  static init() async {
    final I10n i10n = await I10n.load(const Locale('en')); //TODO: change to get locale from device settings

    await Ioc.register<I10n>(i10n);
  }
}
