import 'package:flutter/material.dart';
import 'package:flutter_practice/extantion/nullable_extantion.dart';

import '../model/counter.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  // nullableの場合
  Counter? counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          // 拡張関数を使用して、nullじゃない場合のみvalueを取得
          'カウント：${counter.ifNotNullReturn((value) => value.value) ?? 0}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // 拡張関数を使用して、nullじゃない場合のみincrementを実行
            counter.ifNotNullExecute((value) => value.increment());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
