import 'package:alwataniya/widgets/app_drawer.dart';
import 'package:alwataniya/widgets/entaji.dart';
import 'package:alwataniya/widgets/fin_study.dart';
import 'package:alwataniya/widgets/watani.dart';
import 'package:alwataniya/widgets/zraee.dart';

import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  static const routeName = '/calc';

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return DefaultTabController(
      initialIndex: 3,
      length: 4,
      child: Scaffold(
        key: _drawerKey,
        drawer: const AppDrawer(),
        floatingActionButton: FloatingActionButton(
        // FloatingActionButtonLocation.centerFloat,
        //
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        onPressed: () {
          Navigator.of(context).pop();
      // _drawerKey.currentState!.openDrawer();
    },
          child: const Icon(Icons.arrow_back_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('حاسبة القروض'),
          bottom: const TabBar(
            labelStyle:TextStyle(
              fontSize: 19,
            ),
            unselectedLabelColor:Colors.orangeAccent,
            tabs: <Widget>[
              Tab(
                // icon: Icon(Icons.cloud_outlined),
                text: 'زراعي',

              ),
              Tab(
                text: 'إنتاجي',
              //   icon: Icon(Icons.beach_access_sharp),
               ),
              Tab(
                text: 'وطني',
                // icon: Icon(Icons.brightness_5_sharp),
              ),
          Tab(
          text: 'الدراسة المالية',
          // icon: Icon(Icons.brightness_5_sharp),
        )
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            ZraeeWidget(),
            EntajiWidget(),
            WataniWidget(),
            FinanceStudy(),

          ],
        ),
      ),
    );
  }
}
