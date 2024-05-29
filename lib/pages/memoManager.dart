import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teamplus/pages/memo.dart';
import 'package:teamplus/pages/memoEdit.dart';

class MemoManager {
  final List<Memo> _memos = [];

  void addMemo(Memo memo) {
    FirebaseFirestore.instance
        .collection('memos')
        .add({'body': memo.body, 'title': memo.title});
  }

  void deleteMemo(int index) {
    _memos.removeAt(index);
  }

  Memo getMemo(int index) {
    return _memos[index];
  }

  List<Memo> listMemos() {
    return _memos;
  }

  void updateMemo(int index, Memo memo) {
    _memos[index] = memo;
  }
}
