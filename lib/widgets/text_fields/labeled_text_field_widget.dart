import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:templateapp/utils/input_validators.dart';
import 'package:templateapp/widgets/text_fields/password_text_field_widget.dart';

class LabeledTextField extends StatelessWidget {
  final UniqueKey alertKey = UniqueKey();
  final String? label;
  final String? hint;
  final bool isRequired;
  final TextEditingController? controller;
  final TextInputType type;
  final TextInputAction? action;
  final FocusNode? node;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final void Function(String?)? onSave;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final double spacing;
  final String? errorCustom;
  final int maxLength;
  final String? prefix;
  final bool isTitleBold;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;

  final String? initialValue;

  LabeledTextField({
    this.hint,
    this.action,
    this.autovalidateMode,
    this.controller,
    this.errorCustom,
    this.initialValue,
    this.inputFormatters,
    this.isEnabled = true,
    this.isRequired = false,
    this.isTitleBold = true,
    this.label,
    this.maxLength = 1024,
    this.node,
    this.onChanged,
    this.onSave,
    this.onSubmitted,
    this.prefix,
    this.spacing = 0,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.type = TextInputType.text,
    String? Function(String?)? validator,
    super.key,
  }) : validator = isRequired && validator == null ? InputValidators.notEmpty : validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Text.rich(
            TextSpan(
              text: label,
              children: <TextSpan>[
                if (isRequired)
                  const TextSpan(
                    text: '*',
                  ),
              ],
            ),
          ),
        SizedBox(height: spacing),
        if (type == TextInputType.visiblePassword)
          PasswordTextField(
            isEnabled: isEnabled,
            controller: controller,
            hint: hint,
            validator: validator,
          )
        else
          TextFormField(
            controller: controller,
            initialValue: initialValue,
            focusNode: node,
            decoration: InputDecoration(
              hintText: hint,
              errorText: errorCustom,
              errorMaxLines: 5,
              isCollapsed: true,
              contentPadding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 12),
              prefixText: prefix,
              suffixIcon: suffixIcon,
              counterText: '',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              disabledBorder: isEnabled
                  ? Theme.of(context).inputDecorationTheme.disabledBorder
                  : Theme.of(context).inputDecorationTheme.disabledBorder!.copyWith(
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                      ),
            ),
            keyboardType: type,
            textCapitalization: textCapitalization,
            textInputAction: action ?? TextInputAction.done,
            obscureText: type == TextInputType.visiblePassword,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            maxLength: maxLength,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            onSaved: onSave,
            validator: validator,
            enabled: isEnabled,
            autovalidateMode: autovalidateMode,
          ),
      ],
    );
  }
}
