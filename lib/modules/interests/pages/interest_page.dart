import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/modules/interests/models/interest.dart';
import 'package:projects/modules/interests/pages/interest_controller.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/themes/chappy_colors.dart';
import 'package:projects/themes/chappy_texts.dart';
import 'package:projects/widgets/chappy_app_bar.dart';
import 'package:projects/widgets/chappy_grid_item.dart';

class InterestPage extends StatefulWidget {
  final Profile profile;
  final List<int>? interests;
  final bool isSelection;

  const InterestPage({
    Key? key,
    required this.profile,
    this.interests = const <int>[],
    this.isSelection = false,
  }) : super(key: key);

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  late InterestController controller;

  @override
  void initState() {
    controller = InterestController(widget.profile);
    for (final interest in widget.interests!) {
      controller.toggleInterest(interest);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75), // Set Set this height
        child: ChappyAppBar(
          title: 'Choose your interests',
          titleAlign: TextAlign.left,
          actions: [
            GestureDetector(
              onTap: () async {
                if (widget.isSelection) {
                  final interest = controller.interests?.first;
                  Navigator.pop(context, interest);
                } else {
                  if (controller.isValid) {
                    final result = await controller.updateProfileInterests();
                    if (result == SaveResult.success) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            profile: controller.profile!,
                          ),
                        ),
                      );
                    }
                  } else {
                    controller.setErrorMessage();
                  }
                }
              },
              child: SizedBox(
                width: 50,
                child: Text(
                  'Done',
                  style: ChappyTexts.subtitle2
                      .apply(color: ChappyColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) {
              if (controller.errorMessage.isEmpty) return Container();
              return Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(controller.errorMessage),
              );
            },
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
                itemCount: interestList.length - 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Observer(builder: (_) {
                    return ChappyGridItem(
                      title: interestList[index].title ?? '',
                      onPressed: () =>
                          controller.toggleInterest(interestList[index].id!),
                      isSelected: controller.interests!
                          .contains(interestList[index].id),
                    );
                  });
                }),
          )),
        ],
      ),
    );
  }
}
