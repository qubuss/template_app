import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// TextField for password entries with show/hide suffix icon
///
class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validator;
  final bool isEnabled;

  const PasswordTextField({
    required this.controller,
    this.hint,
    this.validator,
    this.isEnabled = true,
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,

      // style: widget.isEnabled
      //     ? context.style.texts.plain
      //     : context.style.texts.plain.copyWith(
      //         color: context.style.colors.stroke,
      //       ),
      controller: widget.controller,
      validator: widget.validator,
      obscureText: !visible,
      maxLength: 1024,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: _buildIcon(context),
        hintText: widget.hint,
        counterText: '',
        contentPadding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        disabledBorder: widget.isEnabled
            ? Theme.of(context).inputDecorationTheme.disabledBorder
            : Theme.of(context).inputDecorationTheme.disabledBorder!.copyWith(
                  borderSide: BorderSide(
                    color: Colors.grey[100]!,
                  ),
                ),
      ),
      autocorrect: false,
      autofillHints: const <String>[],
      enableSuggestions: false,
    );
  }

  Widget _buildIcon(BuildContext context) {
    final IconData icon = visible ? Icons.visibility_off : Icons.visibility;
    return InkWell(
      onTap: widget.isEnabled ? () => setState(() => visible = !visible) : null,
      child: Icon(icon, color: widget.isEnabled ? Colors.white : Colors.grey),
    );
  }
}
