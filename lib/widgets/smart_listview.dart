import 'package:flutter/material.dart';

class SmartListView extends StatefulWidget {
  final IndexedWidgetBuilder builder;
  final EdgeInsetsGeometry padding;
  final Function onListReachedEnd;
  final int itemCount;

  const SmartListView(
      {required this.builder,
      required this.padding,
      required this.onListReachedEnd,required this.itemCount,
      Key? key})
      : super(key: key);

  @override
  State<SmartListView> createState() => _SmartListViewState();
}

class _SmartListViewState extends State<SmartListView> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print('Start reached');
        } else {
          print('End reached');
          widget.onListReachedEnd();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: widget.builder,
  itemCount: widget.itemCount,
        padding: widget.padding,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ),
    );
  }
}
