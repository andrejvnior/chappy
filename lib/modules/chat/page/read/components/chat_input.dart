import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/chat/page/read/chat_controller.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/widgets/chappy_text_input.dart';

class ChatInput extends StatelessWidget {
  ChatInput({Key? key, required this.controller}) : super(key: key);

  final ChatController controller;
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Observer(builder: (_) {
              if (controller.text.isNotEmpty) {
                textEditingController.clear();
                textEditingController.text = controller.text;
                textEditingController.selection = TextSelection.fromPosition(
                    TextPosition(offset: textEditingController.text.length));
              }
              return ChappyTextInput(
                onChanged: controller.setText,
                hintText: 'Send message',
                controller: textEditingController,
                maxLenght: controller.profiles.isNotEmpty
                    ? 180
                    : controller.text.length,
              );
            }),
          ),
          Observer(
            builder: (_) {
              return TextButton(
                style: TextButton.styleFrom(
                  primary: ChappyColors.primaryColor,
                ),
                onPressed: () {
                  if (controller.search.isEmpty) {
                    controller.sendMessage();
                    textEditingController.clear();
                  } else {}
                },
                child: Text(controller.search.isEmpty ? 'Enviar' : 'Cancelar'),
              );
            },
          )
        ],
      ),
    );
  }
}
