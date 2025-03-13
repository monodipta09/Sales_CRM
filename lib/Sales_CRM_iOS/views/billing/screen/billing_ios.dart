import 'package:flutter/cupertino.dart';

class BillingIos extends StatelessWidget {
const BillingIos({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(child: Center(child: Text("Billing Screen")));
  }
}