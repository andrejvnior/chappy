import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/create/profile_edit_page.dart';
import 'package:projects/modules/profile/pages/read/follow_page.dart';
import 'package:projects/modules/profile/pages/read/profile_controller.dart';
import 'package:projects/widgets/chappy_avatar.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;

  // TODO: rename
  final Profile? other;

  const ProfilePage({Key? key, required this.profile, this.other})
      : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileController controller;

  @override
  void initState() {
    controller = ProfileController(widget.profile, other: widget.other);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Observer(
          builder: (_) => Text('@${controller.profile!.nickname}'),
        )),
        body: Observer(
          builder: (_) {
            return Column(
              children: [
                Container(
                    height: 100,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ChappyAvatar(
                              image: controller.profile?.picture,
                            ),
                            const SizedBox(width: 16),
                            const SizedBox(width: 16),
                            GestureDetector(
                              // TODO: GET RESULT AND DO EFFECT
                              onTap: () {
                                if (controller.followers.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FollowPage(
                                        follows: controller.followers,
                                        profile: widget.profile,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Observer(
                                    builder: (_) => Text(
                                        controller.followers.length.toString()),
                                  ),
                                  const Text('followers'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              // TODO: GET RESULT AND DO EFFECT
                              onTap: () {
                                if (controller.following.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FollowPage(
                                        follows: controller.following,
                                        profile: widget.profile,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Observer(
                                    builder: (_) => Text(
                                        controller.following.length.toString()),
                                  ),
                                  const Text('following'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(controller.profile!.bio.isNotEmpty
                            ? controller.profile!.bio
                            : 'Hello, my name is ${controller.profile!.name}.'),
                      ],
                    )),
                if (controller.isOther) ...[
                  Observer(
                    builder: (_) => TextButton(
                      onPressed: () => controller.isFollowing
                          ? controller.unfollow()
                          : controller.follow(),
                      child:
                          Text(controller.isFollowing ? 'Unfollow' : 'Follow'),
                    ),
                  ),
                ] else ...[
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfileEditPage(profile: widget.profile),
                      ),
                    ).then((value) => controller.setProfile(

                        value)),
                    child: const Text('Edit Profile'),
                  ),
                ],
                const Expanded(
                  child: Text('Feed'),
                ),
              ],
            );
          },
        ));
  }
}
