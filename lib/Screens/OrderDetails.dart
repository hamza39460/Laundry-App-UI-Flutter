import 'package:flutter/material.dart';
import 'package:laundry_app/Widgets/BackgroundContainer.dart';
import 'package:laundry_app/Widgets/CardBackground.dart';
import 'package:laundry_app/Widgets/DashedSeprator.dart';
import 'package:laundry_app/utils/Common.dart';
import 'package:laundry_app/utils/appRoutes.dart';
import 'package:laundry_app/utils/colors.dart';

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Common.ScreenInit(context);
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundContainer(),
        _details(context),
      ],
    );
  }

  _details(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: SingleChildScrollView(
          child: ListView(

            shrinkWrap: true,
            children: <Widget>[
              _backButton(context),
              _headingText(context),
              _detailsCard(context),
              _finalCard(context),
            ],
          ),
        ));
  }

  _backButton(context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: whiteColor,
            size: 30,
          ),
          onPressed: () {
            AppRoutes.pop(context);
          }),
    );
  }

  _headingText(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      child: RichText(
        text: TextSpan(
            text: 'Details about\n',
            style: TextStyle(fontSize: Common.getSPfont(26)),
            children: <TextSpan>[
              TextSpan(
                  text: 'Order # 132',
                  style: TextStyle(
                      fontSize: Common.getSPfont(26),
                      fontWeight: FontWeight.bold))
            ]),
      ),
    );
  }

  _detailsCard(BuildContext context) {
    return CardBackground(
        child: Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: _CardBody(),
    ));
  }

  _finalCard(BuildContext context) {
    return Container(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: CardBackground(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text('Your clothes are now washing',style: TextStyle(fontSize: Common.getSPfont(18),fontWeight: FontWeight.bold),),
              ),
              Padding(padding: const EdgeInsets.only(top:4)),
              Align(alignment: Alignment.topLeft,child: Text('Estimated Delivery',style: TextStyle(fontSize: Common.getSPfont(14),color: greyColor3),)),
              Align(alignment: Alignment.topLeft,child: Text('12th Jan 2020',style: TextStyle(fontSize: Common.getSPfont(14),color: blackColor),)),
              
            ],
          ),
        ),
      ),
    );
  }

}

class _CardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Text(
          'Order Details',
          style: TextStyle(
              fontSize: Common.getSPfont(18), fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            'WASHING AND FOLDING',
            style: TextStyle(
                fontSize: Common.getSPfont(13),
                fontWeight: FontWeight.bold,
                color: greyColor3),
          ),
        ),
        _orderOne(context),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            'IRONING',
            style: TextStyle(
                fontSize: Common.getSPfont(13),
                fontWeight: FontWeight.bold,
                color: greyColor3),
          ),
        ),
        _orderTwo(context),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
          child: const MySeparator(color: Colors.grey),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Subtotal',
                    style: TextStyle(
                        fontSize: Common.getSPfont(15), color: greyColor3)),
                Text('\$200', style: TextStyle(fontSize: Common.getSPfont(15)))
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Delivery',
                    style: TextStyle(
                        fontSize: Common.getSPfont(15), color: greyColor3)),
                Text('\$25', style: TextStyle(fontSize: Common.getSPfont(15)))
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total',
                    style: TextStyle(
                        fontSize: Common.getSPfont(20),
                        color: blackColor,
                        fontWeight: FontWeight.bold)),
                Text('\$225',
                    style: TextStyle(
                        fontSize: Common.getSPfont(20),
                        color: greenColor,
                        fontWeight: FontWeight.bold))
              ],
            )),
      ],
    );
  }

  _orderOne(BuildContext context) {
    var qty = ['3', '2', '4', '1'];
    var orderDet = ['T-Shirts(man)', 'Shirts(man)', 'Pants(man)', 'Jeans(man)'];
    var cost = ['\$30', '\$40', '\$80', '\$20'];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: orderDet.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: '${qty[index]}',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: Common.getSPfont(15),
                        fontWeight: FontWeight.bold),
                    children: [
                      WidgetSpan(
                          //baseline: TextBaseline.alphabetic,
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                        child: Text(
                          'x',
                          style: TextStyle(
                              color: greyColor3,
                              fontSize: Common.getSPfont(15)),
                        ),
                      )),
                      TextSpan(
                        text: '${orderDet[index]}',
                        style: TextStyle(
                            color: greyColor3, fontSize: Common.getSPfont(15)),
                      )
                    ]),
              ),
              Text(
                cost[index],
                style: TextStyle(fontSize: Common.getSPfont(15)),
              ),
            ],
          ),
        );
      },
    );
  }

  _orderTwo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RichText(
          text: TextSpan(
              text: '3',
              style: TextStyle(
                  color: blackColor,
                  fontSize: Common.getSPfont(15),
                  fontWeight: FontWeight.bold),
              children: [
                WidgetSpan(
                    //baseline: TextBaseline.alphabetic,
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Text(
                    'x',
                    style: TextStyle(
                        color: greyColor3, fontSize: Common.getSPfont(15)),
                  ),
                )),
                TextSpan(
                  text: 'T-Shirts (man)',
                  style: TextStyle(
                      color: greyColor3, fontSize: Common.getSPfont(15)),
                )
              ]),
        ),
        Text(
          '\$30',
          style: TextStyle(fontSize: Common.getSPfont(15)),
        ),
      ],
    );
  }
}
