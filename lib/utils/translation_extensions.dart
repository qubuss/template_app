import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:templateapp/localization/generated/l10n.dart';

extension TranslationExtensions on BuildContext {
  I10n get translate => I10n.of(this);

  String translateByName(String name, [List<Object> args = const <Object>[]]) {
    return Intl.message(
      '',
      name: name,
      args: args,
    );
  }
}
