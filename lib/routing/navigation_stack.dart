import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation_stack_item.dart';


final navigationStackProvider = ChangeNotifierProvider((ref) => NavigationStack([DashboardScreenPage()]));

class NavigationStack with ChangeNotifier {
  List<NavigationStackItem> _items;

  NavigationStack(List<NavigationStackItem> items) : _items = List.of(items);

  UnmodifiableListView<NavigationStackItem> get items => UnmodifiableListView(_items);

  Completer _resultCompleter = Completer();

  set items(List<NavigationStackItem> newItems) {
    _items = List.from(newItems);
    notifyListeners();
  }

  NavigationStackItem get topItem => _items.last;

  void push(NavigationStackItem item) {
    _items.add(item);
    notifyListeners();
  }

  Future pushAndWait(NavigationStackItem item) async {
    _resultCompleter = Completer();
    _items.add(item);
    notifyListeners();
    return _resultCompleter.future;
  }

  dynamic popWithValue(var value) {
    if (_items.isNotEmpty) {
      _items.removeLast();
      notifyListeners();
      return _resultCompleter.complete(value);
    }
  }

  void pop() {
    if (_items.isNotEmpty) {
      _items.removeLast();
      notifyListeners();
    }
  }

  void pushReplacement(NavigationStackItem item) {
    if (_items.isNotEmpty) {
      _items.removeLast();
      _items.add(item);
      notifyListeners();
    }
  }

  void pushAndRemoveAll(NavigationStackItem item) {
    _items.clear();
    _items.add(item);
    notifyListeners();
  }

  void pushAndRemoveUntil({required NavigationStackItem item, required NavigationStackItem until}) {
    if (_items.isNotEmpty) {
      int index = _items.indexWhere((element) => element == until);
      _items.removeRange(index + 1, _items.length);
      _items.add(item);
      notifyListeners();
    }
  }

  void popUntil(NavigationStackItem until) {
    if (_items.isNotEmpty) {
      int index = _items.indexWhere((element) => element == until);
      _items.removeRange(index + 1, _items.length);
      notifyListeners();
    }
  }

  void removeLast({int removeCount = 1}) {
    if (_items.length > removeCount + 1) {
      for (int i = 0; i < removeCount; i++) {
        _items.removeLast();
      }
      notifyListeners();
    }
  }

  void updateLoanLocation(String location) {
    final index = _items.lastIndexWhere((item) => item is DashboardScreenLoan);
    if (index == -1) return;
    final current = _items[index] as DashboardScreenLoan;
    if (current.location == location) return;
    _items[index] = DashboardScreenLoan(location: location);
    notifyListeners();
  }
}
