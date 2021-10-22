import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/widgets/chappy_text_input.dart';

class ChatInput extends StatelessWidget {
  ChatInput({Key? key, required this.onChanged, required this.onSend})
      : super(key: key);

  final textEditingController = TextEditingController();
  final Function(String) onChanged;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Observer(
              builder: (_) => ChappyTextInput(
                onChanged: onChanged,
                hintText: 'Send message',
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: ChappyColors.primaryColor,
            ),
            onPressed: onSend,
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
