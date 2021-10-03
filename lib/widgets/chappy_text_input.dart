import 'package:flutter/material.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';

class ChappyTextInput extends StatefulWidget {
  final String? initialValue;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final Function(String)? onChanged;
  final String errorMessage;
  final bool isPassword;

  const ChappyTextInput({
    Key? key,
    this.initialValue,
    this.hintText,
    this.prefix,
    this.suffixIcon,
    this.borderRadius,
    this.onChanged,
    this.errorMessage = '',
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<ChappyTextInput> createState() => _ChappyTextInputState();
}

class _ChappyTextInputState extends State<ChappyTextInput> {
  late bool obscureText;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            initialValue: widget.initialValue,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: obscureText ? 1 : 4,
            controller: controller,
            obscureText: obscureText,
            onChanged: widget.onChanged,
            // TODO: Change color when active
            style: ChappyTexts.subtitle2.apply(color: ChappyColors.grey900),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              fillColor: ChappyColors.grey100,
              filled: true,
              hintText: widget.hintText,
              prefix: widget.prefix,
              suffix: GestureDetector(
                // TODO: Verifiry is its correct use setState in this case;
                onTap: () => setState(() {
                  obscureText = !obscureText;
                }),
                child: widget.isPassword
                    ? Text(
                        obscureText ? 'Show' : 'Hide',
                        style: ChappyTexts.subtitle2
                            .apply(color: ChappyColors.primaryColor),
                      )
                    : const Text(''),
              ),
              suffixIcon: widget.suffixIcon,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ChappyColors.primaryColor, width: 1),
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ChappyColors.grey300, width: 1),
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        if (widget.errorMessage.isNotEmpty) Text(widget.errorMessage),
      ],
    );
  }
}
