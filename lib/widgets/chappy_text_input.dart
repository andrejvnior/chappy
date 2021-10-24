import 'package:flutter/material.dart';
import 'package:hashtagable/widgets/hashtag_text_field.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';

class ChappyTextInput extends StatefulWidget {
  final String? initialValue;
  final String? hintText;
  final Widget? prefix;
  final String? prefixText;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final Function(String)? onChanged;
  final String errorMessage;
  final bool isPassword;
  final TextEditingController? controller;
  final Function(String)? onMention;
  final VoidCallback? onHashtag;
  final int maxLenght;

  const ChappyTextInput({
    Key? key,
    this.initialValue,
    this.hintText,
    this.prefix,
    this.prefixText,
    this.suffixIcon,
    this.borderRadius,
    this.onChanged,
    this.errorMessage = '',
    this.isPassword = false,
    this.controller,
    this.onMention,
    this.onHashtag,
    this.maxLenght = 2000,
  }) : super(key: key);

  @override
  State<ChappyTextInput> createState() => _ChappyTextInputState();
}

class _ChappyTextInputState extends State<ChappyTextInput> {
  late bool obscureText;

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
          child: HashTagTextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: obscureText ? 1 : 4,
            controller: widget.controller,
            obscureText: obscureText,
            onChanged: widget.onChanged,
            maxLength: widget.maxLenght,
            basicStyle:
                ChappyTexts.subtitle2.apply(color: ChappyColors.grey900),
            decoratedStyle:
                ChappyTexts.subtitle2.apply(color: ChappyColors.primaryColor),
            decorateAtSign: true,
            onDetectionTyped: (text) {
              if (text[0] == '#') {
              } else {}
            },
            onDetectionFinished: () {
              print("detection finished");
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              fillColor: ChappyColors.grey100,
              filled: true,
              hintText: widget.hintText,
              prefix: widget.prefix,
              prefixText: widget.prefixText,
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
