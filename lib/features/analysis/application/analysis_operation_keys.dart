import 'dart:math';

final class AnalysisOperationKeys {
  final Map<String, ({String payload, String value})> _values = {};

  String value(String operation, String payload) {
    final current = _values[operation];
    if (current?.payload == payload) return current!.value;
    final nonce = Random.secure().nextInt(0x7fffffff).toRadixString(16);
    final value = 'app-ai-${DateTime.now().microsecondsSinceEpoch}-$nonce';
    _values[operation] = (payload: payload, value: value);
    return value;
  }

  void clear(String operation) => _values.remove(operation);

  void clearAll() => _values.clear();
}
