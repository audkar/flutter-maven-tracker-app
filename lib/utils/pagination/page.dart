import 'package:flutter/foundation.dart';

@immutable
class Page {
  final int totalItemCount;
  final int itemCount;
  final int currentPage;

  static Page initial() => Page();

  Page({
    this.totalItemCount = -1,
    this.itemCount = 0,
    this.currentPage = -1,
  });

  int get nextPageIndex => currentPage + 1;
  bool get hasMoreItems => itemCount < totalItemCount;
}
