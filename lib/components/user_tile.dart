import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suitmedia_mobile_dev_test/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;
  final void Function()? onTap;
  const UserTile({
    super.key,
    required this.user,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      title: Text("${user.firstName} ${user.lastName}"),
      subtitle: Text(user.email),
    );
  }
}
