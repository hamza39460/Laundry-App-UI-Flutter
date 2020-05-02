import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:laundry_app/utils/Common.dart';
import 'package:laundry_app/utils/colors.dart';

class BottomNavBarWidget extends StatefulWidget {
  int selectedIndex = 0;
  final Function(int) callBack;
  BottomNavBarWidget({@required this.callBack});
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    final _items = [
      _BottomNavBarItem(
        icon: Icon(Icons.home,size: Common.getSPfont(30),),
        index: 0,
        color: (widget.selectedIndex == 0) ? greenColor : greyColor2,
        onCountSelected: _onPress,
      ),
      _BottomNavBarItem(
        icon: Icon(Icons.pin_drop,size: Common.getSPfont(30)),
        index: 1,
        color: (widget.selectedIndex == 1) ? greenColor : greyColor2,
        onCountSelected: _onPress,
      ),
      _BottomNavBarItem(
        icon: Icon(Icons.favorite,size: Common.getSPfont(30)),
        index: 2,
        color: (widget.selectedIndex == 2) ? greenColor : greyColor2,
        onCountSelected: _onPress,
      ),
      _BottomNavBarItem(
        icon: Icon(Icons.settings,size: Common.getSPfont(30)),
        index: 3,
        color: (widget.selectedIndex == 3) ? greenColor : greyColor2,
        onCountSelected: _onPress,
      ),
    ];
    //_items[selectedIndex].color=greenColor0;
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
          
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _items),
    );
  }

  _onPress(int selectedIdex) {
    setState(() {
      widget.selectedIndex = selectedIdex;
    });
    widget.callBack(widget.selectedIndex);
  }
}

class _BottomNavBarItem extends StatelessWidget {
  final Icon icon;
  final Color color;
  final int index;
  final Function(int) onCountSelected;
  _BottomNavBarItem(
      {@required this.icon,
      @required this.color,
      @required this.index,
      @required this.onCountSelected});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      color: color,
      onPressed: () => onCountSelected(index),
    );
  }
}
