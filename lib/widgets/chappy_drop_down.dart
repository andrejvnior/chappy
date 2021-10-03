import 'package:flutter/material.dart';
import 'package:projects/modules/profile/models/gender.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';

// TODO: Modularize
class ChappyDropDown extends StatefulWidget {
  final String? value;
  final Function(String)? onSelected;

  const ChappyDropDown({Key? key, this.value, this.onSelected})
      : super(key: key);

  @override
  _ChappyDropDownState createState() => _ChappyDropDownState();
}

class _ChappyDropDownState extends State<ChappyDropDown> {
  TextEditingController controller = TextEditingController();
  bool showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            showOptions = !showOptions;
          }),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            decoration: BoxDecoration(
                color: ChappyColors.grey100,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                  bottomLeft: Radius.circular(showOptions ? 0 : 8),
                  bottomRight: Radius.circular(showOptions ? 0 : 8),
                ),
                border: Border.all(color: ChappyColors.grey300)),
            child: Row(
              children: [
                Text(
                  widget.value ?? 'Select gender',
                  style:
                      ChappyTexts.subtitle2.apply(color: ChappyColors.grey900),
                ),
              ],
            ),
          ),
        ),
        if (showOptions)
          Container(
            constraints: const BoxConstraints(maxHeight: 150),
            decoration: BoxDecoration(
              border: Border.all(color: ChappyColors.grey300),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: ListView.builder(
              itemCount: genderList.length,
              itemBuilder: (BuildContext context, int index) {
                return genderList[index] != genderList.last
                    ? GestureDetector(
                        onTap: () {
                          widget.onSelected!(genderList[index].title ?? '');
                          showOptions = !showOptions;
                        },
                        child: Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: ChappyColors.grey300)),
                            ),
                            child: Text(
                              genderList[index].title ?? '',
                              style: ChappyTexts.subtitle2
                                  .apply(color: ChappyColors.grey900),
                            )),
                      )
                    : Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: ChappyColors.grey300)),
                        ),
                        child: TextFormField(
                          controller: controller,
                          style: ChappyTexts.subtitle2
                              .apply(color: ChappyColors.grey900),
                          decoration: InputDecoration(
                            suffix: GestureDetector(
                              // TODO: Verifiry is its correct use setState in this case;
                              onTap: () {
                                widget.onSelected!(controller.text);
                                showOptions = !showOptions;
                              },
                              child: Text(
                                'Salvar',
                                style: ChappyTexts.subtitle2
                                    .apply(color: ChappyColors.primaryColor),
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: genderList.last.title,
                            border: InputBorder.none,
                          ),
                        ),
                      );
              },
            ),
          ),
      ],
    );
  }
}
