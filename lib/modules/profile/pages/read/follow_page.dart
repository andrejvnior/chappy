import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/profile/models/follow.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/read/profile_controller.dart';
import 'package:projects/widgets/chappy_list_tile.dart';

class FollowPage extends StatefulWidget {
  final Profile profile;
  final List<Follow> follows;
  final bool isFollowing;

  const FollowPage(
      {Key? key,
      required this.follows,
      required this.profile,
      this.isFollowing = false})
      : super(key: key);

  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  late ProfileController controller;

  @override
  void initState() {
    controller = ProfileController(widget.profile, follows: widget.follows);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.isFollowing ? 'Following' : 'Followers'),
        ),
        body: Observer(builder: (_) {
          final list = controller.profiles;

          if (list.isEmpty) return Container();

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) => ChappyListTile(
              title: Text(list[index].nickname),
            ),
          );
        }));
  }
}
