import 'package:rxdart/rxdart.dart';

class CounterStore {
  final _subject = BehaviorSubject<int>.seeded(0);
  final _incrementController = PublishSubject<void>();

  CounterStore() {
    _incrementController
        .scan<int>((sum, _v, _i) => sum + 1, 0)
        .pipe(_subject);
  }

  ValueObservable<int> get count => _subject;
  Sink<void> get increment => _incrementController.sink;

  void dispose() async {
    await _incrementController.close();
    await _subject.close();
  }
}