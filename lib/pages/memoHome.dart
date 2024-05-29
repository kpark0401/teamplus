import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teamplus/pages/memo.dart';

class MemoHome extends StatefulWidget {
  const MemoHome({super.key});

  @override
  State<MemoHome> createState() => _MemoHomeState();
}

class _MemoHomeState extends State<MemoHome> {
  final fireDB = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildCards());
  }

  Widget _buildCards() {
    return StreamBuilder(
      stream: fireDB.collection('memos').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        final docs = snapshot.data?.docs;
        if (docs == null) {
          return Container();
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          itemCount: docs!.length,
          itemBuilder: (context, index) {
            Memo memoitem = Memo(
              body: docs[index]['body'],
              title: docs[index]['title'],
            );
            return _buildCard(memoitem);
          },
        );
      },
    );
  }

  Widget _buildCard(Memo memo) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                memo.title.isEmpty ? '(제목없음)' : memo.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Text(
                  memo.body,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
