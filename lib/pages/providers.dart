import 'package:teamplus/pages/memoManager.dart';

MemoManager? _memoManager;

MemoManager memoManager() {
  _memoManager ??= MemoManager();
  return _memoManager!;
}
