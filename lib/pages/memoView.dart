import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamplus/pages/memo.dart';
import 'package:teamplus/pages/memoManager.dart';

class MemoView extends StatefulWidget {
  const MemoView({Key? key}) : super(key: key);

  @override
  State<MemoView> createState() => _MemoViewState();
}

class _MemoViewState extends State<MemoView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('제목 입력'),
                  ),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  controller: titleController,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '내용 입력',
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: bodyController,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveMemo,
        child: Icon(Icons.save),
        elevation: 1.0,
      ),
    );
  }

  void _saveMemo() {
    if (bodyController.text.isNotEmpty) {
      MemoManager().addMemo(Memo(
        body: bodyController.text,
        title: titleController.text,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('내용을 입력하세요.'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
