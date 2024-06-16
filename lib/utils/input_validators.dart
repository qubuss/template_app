import 'package:templateapp/localization/generated/l10n.dart';
import 'package:templateapp/utils/ioc.dart';

class InputValidators {
  static final RegExp emailRGX = RegExp(r'^[_a-z0-9-+]+(\.[_a-z0-9-+]+)*(\+[a-z0-9-]+)?@\w+([\.-]?\w+)?(\.\w{2,3})+$');
  static const int charactersMin = 3;

  static String? characters(String? value, {int? characters}) {
    if (value != null && value.isNotEmpty) {
      final int minCharacters = characters ?? charactersMin;
      if (value.length < minCharacters) {
        return '${Ioc.get<I10n>().characters_minimum_leading} $minCharacters';
      }
    }
    return null;
  }

  static String? notEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return Ioc.get<I10n>().field_cannot_be_empty;
    }
    return null;
  }

  static String? email(String? value, {bool canBeEmpty = false, int? characters}) {
    return valdiate(emailRGX, value, Ioc.get<I10n>().email_enter_valid, canBeEmpty: canBeEmpty, characters: characters);
  }

  static String? valdiate(RegExp regexp, String? value, String invalid, {bool canBeEmpty = true, int? characters}) {
    if (value != null) {
      if (value.isNotEmpty) {
        final String? charactersValidation = InputValidators.characters(value, characters: characters);
        if (charactersValidation != null) {
          return charactersValidation;
        }

        if (!regexp.hasMatch(value)) {
          return invalid;
        }
      } else if (!canBeEmpty) {
        return Ioc.get<I10n>().field_cannot_be_empty;
      }
    } else if (!canBeEmpty) {
      return Ioc.get<I10n>().field_cannot_be_empty;
    }
    return null;
  }
}
