import 'package:flutter/material.dart';
import 'package:teamplus/pages/memoCalendar.dart';
import 'package:teamplus/pages/memoEdit.dart';
import 'package:teamplus/pages/memoHome.dart';
import 'package:teamplus/pages/memoTeam.dart';

class Sidenavigator extends StatefulWidget {
  const Sidenavigator({super.key});

  @override
  State<Sidenavigator> createState() => _SidenavigatorState();
}

class _SidenavigatorState extends State<Sidenavigator> {
  int _selectedIndex = 0;
  static const List<Widget> sidemenu = <Widget>[
    MemoHome(),
    Memocalendar(),
    MemoTeam(),
    MemoEdit()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TeamPlus'),
        centerTitle: true,
        shape: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      body: sidemenu[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                _onItemTapped(3);
              },
              child: Icon(Icons.edit),
              elevation: 1.0,
            )
          : null,
      drawer: Drawer(
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
                _onItemTapped(0);
                Navigator.pop(context);
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
                _onItemTapped(1);
                Navigator.pop(context);
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
                _onItemTapped(2);
                Navigator.pop(context);
              },
              trailing: Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }
}
