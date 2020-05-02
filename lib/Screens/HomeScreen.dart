import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/Screens/OrderDetails.dart';
import 'package:laundry_app/Widgets/BackgroundContainer.dart';
import 'package:laundry_app/Widgets/BottomNavigationBarWidget.dart';
import 'package:laundry_app/Widgets/CardBackground.dart';
import 'package:laundry_app/utils/Common.dart';
import 'package:laundry_app/utils/appRoutes.dart';
import 'package:laundry_app/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Common.ScreenInit(context);
    return Scaffold(
      body: _body(context),
      bottomNavigationBar: BottomNavBarWidget(
        callBack: (int selectedIndex) {
          print('selected Index $selectedIndex');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: greenColor,
        onPressed: () {
          print('FAB PRESSED');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _body(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundContainer(),
        _form(context),
      ],
    );
  }

  _form(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _nameAndPic(context),
          _homeCard(context),
        ],
      ),
    );
  }

  _nameAndPic(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
              text: TextSpan(
                  text: 'Welcome back,\n',
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: Common.getSPfont(26),
                      fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                TextSpan(
                  text: 'Hamza!',
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: Common.getSPfont(26),
                      fontWeight: FontWeight.bold),
                )
              ])),
          CircleAvatar(
            //child: Image(image: ),
            backgroundColor: transparentColor,
            backgroundImage: AssetImage("assets/images/profile_pic.png"),
            radius: ScreenUtil().setHeight(120),
          )
        ],
      ),
    );
  }

  _homeCard(BuildContext context) {
    return CardBackground(
      child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: _Home()),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Text(
            'New locations',
            style: TextStyle(fontSize: Common.getSPfont(22)),
          ),
          _locationsView(),
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Latest Orders',
                    style: TextStyle(fontSize: Common.getSPfont(22)),
                  ),
                  FlatButton(
                    child: Text(
                      'View all orders',
                      style: TextStyle(
                          color: greenColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Common.getSPfont(14)),
                      //textAlign: TextAlign.,
                    ),
                    onPressed: (){
                      AppRoutes.push(context, OrderDetails());
                    },
                  ),
                ],
              )),
          _ordersView(context)
        ],
      ),
    );
  }

  _locationsView() {
    var locations = [
      '1745 T Street Southeast,\nWashington',
      '6007 Applegate Lane,\nLouisville',
      '560 Penstock Drive,\nGrass Valley',
      '150 Carter Street,\nManchester'
    ];
    var colors = [blueColor, orangeColor];
    return Container(
      height: 90,
      child: ListView.builder(
        itemCount: locations.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                color: (index % 2 == 0) ? colors[0] : colors[1],
                image: DecorationImage(
                  image: AssetImage("assets/images/locationBG.png"),
                  fit: BoxFit.fitWidth,
                  colorFilter: ColorFilter.mode(
                      blackColor.withOpacity(0.15), BlendMode.dstATop),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            margin: EdgeInsets.all(2.0),
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 0, 0),
            width: 220,
            child: Card(
              color:
                  transparentColor, //(index % 2 == 0) ? colors[0] : colors[1],
              elevation: 0,
              child: Text(locations[index],
                  style: TextStyle(
                      fontSize: Common.getSPfont(16),
                      color: whiteColor,
                      fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }

  _ordersView(BuildContext context) {
    var _order = ['Picking up Order', 'Delivering order'];
    var _secondLine = ['Placed on: 12 Jan 2020', 'Arrival on: 14th Jan 2020'];
    var _thirdLine = [
      'Placed at: New Times Square',
      'Arrival Place: Victoria Square'
    ];
    var _icon = [
      AssetImage("assets/images/arrivalIcon.png"),
      AssetImage("assets/images/pickingIcon.png")
    ];
    return Container(
      padding: const EdgeInsets.only(right: 10),
      //height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _order.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Image(image: _icon[index]),
                    backgroundColor: lightBgColor,
                  ),
                  title: Text(
                    _order[index],
                    style: TextStyle(fontSize: Common.getSPfont(20)),
                  ),
                ),
                ListTile(
                  leading: Opacity(
                    opacity: 0,
                    child: CircleAvatar(
                      child: Image(image: _icon[index]),
                      backgroundColor: lightBgColor,
                    ),
                  ),
                  title: Text(
                    _secondLine[index],
                    style: TextStyle(fontSize: Common.getSPfont(14)),
                  ),
                  subtitle: Text(
                    _thirdLine[index],
                    style: TextStyle(fontSize: Common.getSPfont(14)),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
