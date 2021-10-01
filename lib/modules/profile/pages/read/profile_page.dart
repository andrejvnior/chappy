import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/read/followers/followers_page.dart';
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
        title: Text('@${controller.profile!.nickname}'),
      ),
      body: Container(
        child: Column(
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
                        ChappyAvatar(),
                        const SizedBox(width: 16),
                        const SizedBox(width: 16),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('0'),
                              Text('followers'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FollowersPage(
                                    profile: controller.profile!)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Observer(
                                builder: (_) => Text(
                                    controller.followers.length.toString()),
                              ),
                              Text('followers'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      child: Text(controller.profile!.bio.isNotEmpty
                          ? controller.profile!.bio
                          : 'Hello, my name is ${controller.profile!.name}.'),
                    ),
                  ],
                )),
            if (controller.isOther)
              Observer(
                builder: (_) => TextButton(
                  onPressed: () => controller.isFollowing
                      ? controller.unfollow()
                      : controller.follow(),
                  child: Text(controller.isFollowing ? 'Unfollow' : 'Follow'),
                ),
              ),
            Expanded(
              child: Text('Feed'),
            ),
          ],
        ),
      ),
    );
  }
}
