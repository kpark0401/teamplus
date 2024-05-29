import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamplus/pages/memoCalendar.dart';
import 'package:teamplus/pages/memoHome.dart';
import 'package:teamplus/pages/memoTeam.dart';

class SideMenu extends StatelessWidget {
  final int index;
  const SideMenu({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/camera.jpg'),
            ),
            accountName: Text(
              '사용자 이름',
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text('abc12356@naver.com',
                style: TextStyle(color: Colors.black)),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.create_outlined,
              color: Colors.grey[850],
            ),
            title: Text('Memo'),
            onTap: () {
              Get.to(MemoHome(), transition: Transition.noTransition);
            },
            trailing: Icon(Icons.arrow_back),
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month,
              color: Colors.grey[850],
            ),
            title: Text('Calendar'),
            onTap: () {
              Get.to(Memocalendar(), transition: Transition.noTransition);
            },
            trailing: Icon(Icons.arrow_back),
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.grey[850],
            ),
            title: Text('Team'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MemoTeam()));
            },
            trailing: Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
