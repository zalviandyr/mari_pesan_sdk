import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:mari_pesan_sdk/src/constants/constants.dart';
import 'package:mari_pesan_sdk/src/enums/enums.dart';

class FormInput extends StatefulWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FormInputType inputType;
  final String hint;
  final bool readonly;
  final String? note;
  final String? label;
  final String? Function(String?)? validator;
  final Widget? icons;
  final Function(String)? onFieldSubmitted;

  const FormInput({
    Key? key,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.inputType = FormInputType.normal,
    this.hint = '',
    this.readonly = false,
    this.note,
    this.label,
    this.validator,
    this.icons,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  late FocusNode _suffixFocus;
  late bool _obscureText;
  late String? Function(String?) _validator;

  @override
  void initState() {
    _suffixFocus = FocusNode(skipTraversal: true);
    _obscureText = widget.inputType == FormInputType.password;
    _validator = widget.validator ?? ValidationBuilder().required().build();

    super.initState();
  }

  void _passwordToggleAction() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
        ],
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            validator: _validator,
            readOnly: widget.readonly,
            onFieldSubmitted: widget.onFieldSubmitted,
            style: widget.readonly
                ? const TextStyle(color: Pallette.outline)
                : null,
            decoration: InputDecoration(
              fillColor: Pallette.formInput,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: widget.hint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              suffixIcon: _buildSuffixIcon(),
            ),
          ),
        ),
        if (widget.note != null)
          Text(
            widget.note!,
            style: TextStyle(color: Pallette.textSecondary),
          ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    return widget.icons ??
        (widget.inputType == FormInputType.password
            ? MaterialButton(
                focusNode: _suffixFocus,
                minWidth: 0,
                shape: const CircleBorder(),
                onPressed: _passwordToggleAction,
                child: _obscureText
                    ? SvgPicture.asset(
                        AssetIcons.eyeClosed,
                        color: Pallette.primary,
                        width: 20,
                        height: 20,
                      )
                    : SvgPicture.asset(
                        AssetIcons.eye,
                        color: Pallette.primary,
                        width: 20,
                        height: 20,
                      ),
              )
            : null);
  }
}
