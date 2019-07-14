

import 'package:bloc_sample/model/counter_store.dart';
import 'package:flutter/widgets.dart';

class BlocProvider extends InheritedWidget {
  BlocProvider({
    Key key,
    @required this.counterStore,
    @required Widget child,
  }) : super(key: key, child: child);

  final CounterStore counterStore;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static CounterStore of(BuildContext context) {
    return (context
        .ancestorInheritedElementForWidgetOfExactType(BlocProvider)
        .widget as BlocProvider).counterStore;
  }
}