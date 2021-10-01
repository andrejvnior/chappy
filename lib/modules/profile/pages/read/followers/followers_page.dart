import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projects/modules/profile/models/profile.dart';
import 'package:projects/modules/profile/pages/read/profile_controller.dart';
import 'package:projects/modules/profile/pages/read/profile_page.dart';
import 'package:projects/widgets/chappy_list_tile.dart';

class FollowersPage extends StatefulWidget {
  final Profile profile;

  const FollowersPage({Key? key, required this.profile}) : super(key: key);

  @override
  _FollowersPageState createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  late ProfileController controller;

  @override
  void initState() {
    controller = ProfileController(widget.profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers'),
      ),
      body: Observer(builder: (_) {
        final list = controller.profiles;

        if (list.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              // TODO: Substitute image
              return ChappyListTile(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfilePage(
                          profile: widget.profile, other: list[index]),
                    ),
                  );
                },
                title: Text(list[index].name),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                  color: Colors.grey.shade400,
                ),
              );
            });
      }),
    );
  }
}
