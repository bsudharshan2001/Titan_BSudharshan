import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'manageAccount.dart';
import 'viewProfile.dart';

class popupProfileButton extends StatefulWidget {
  @override
  _popupProfileButtonState createState() => _popupProfileButtonState();
}

class _popupProfileButtonState extends State<popupProfileButton> {
  @override
  void selectedItem(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('View Profile');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => displayProfile()));
        break;
      case 1:
        print('Manage Profile');
        break;
      case 2:
        print('logout');
        Navigator.pop(context);
        break;
    }
  }

  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/blank_profile.png')),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            title: Text('Name'),
            subtitle: Text('name@email.com'),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/blank_profile.png'),
            ),
          ),
          value: 0,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.manage_accounts,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Manage account'),
            ],
          ),
          value: 1,
        ),
        PopupMenuDivider(
          height: 5,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Logout'),
            ],
          ),
          value: 2,
        ),
      ],
      onSelected: (item) {
        selectedItem(context, item);
      },
    );
  }
}
