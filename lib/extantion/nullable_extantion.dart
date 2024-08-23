// ジェネリクスを使用しているため、nullableならどのような型でも使用可能
extension NullableExtension<T> on T? {
  // nullではない場合は、受け取った関数を実行する、nullの場合は何もしない
  void ifNotNullExecute(void Function(T value) function) {
    // thisはT?型でnullableなので、nullチェックを行うためにlocalに代入
    final local = this;
    // ｎullの場合はreturnする
    if (local == null) return;
    // nullじゃない場合は、受け取った関数を実行する
    function(local);
  }

  // nullではない場合は、受け取った関数を実行して戻り値を返す、nullの場合はnullを返す
  R? ifNotNullReturn<R>(R Function(T value) function) {
    // Rは引数の無名関数の戻り値の型に自動で決まるので、ifNotNullReturn()<int>のように指定しなくていい
    // thisはT?型でnullableなので、nullチェックを行うためにlocalに代入
    final local = this;
    if (local == null) return null;
    return function(local);
  }
}
