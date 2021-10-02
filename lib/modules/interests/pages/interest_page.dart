import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/models/firebase_model.dart';
import 'package:projects/modules/home/pages/home_page.dart';
import 'package:projects/modules/interests/models/interest.dart';
import 'package:projects/modules/interests/pages/interest_controller.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/widgets/chappy_grid_item.dart';
import 'package:projects/widgets/chappy_title.dart';

class InterestPage extends StatefulWidget {
  final Profile profile;
  final List<int>? interests;

  const InterestPage(
      {Key? key, required this.profile, this.interests = const <int>[]})
      : super(key: key);

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
      appBar: AppBar(
        title: const ChappyTitle(title: 'Choose unless one interests'),
        actions: [
          TextButton(
            onPressed: () async {
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
            },
            child: const Text(
              'Salvar',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) {
              if (controller.errorMessage.isEmpty) return Container();
              return SizedBox(
                height: 50,
                child: Text(controller.errorMessage),
              );
            },
          ),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}
