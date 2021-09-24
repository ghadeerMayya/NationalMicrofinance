import 'package:alwataniya/screens/calc_screen.dart';
import 'package:alwataniya/widgets/app_drawer.dart';
import 'package:alwataniya/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();           //////////////////drawer global key
    return Scaffold(

      ////////////////////////////////////////////////////////////////////////////Start floating
      key: _drawerKey,
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        // FloatingActionButtonLocation.centerFloat,
        //
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        onPressed: () {
          _drawerKey.currentState!.openDrawer();
        },
        child: const Icon(Icons.settings_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

      //////////////////////////////////////////////////////////////////////////////End floating
      // use Scaffold also in order to provide material app widgets
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 50,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/img/alwataniya_logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: null),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 250,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    // width: 100,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(88.0),
                                  side: BorderSide(color: Colors.blueAccent)))),
                      icon: const Icon(Icons.add_box_outlined, size: 35),
                      label: const Text(
                        'معاملة جديدة',
                        style: TextStyle(
                          fontSize: 18,
                          // fontFamily: 'jf',
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    // width: 200,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(88.0),
                                  side: BorderSide(color: Colors.blueAccent)))),
                      icon: const Icon(Icons.calculate_outlined, size: 35),
                      label: const Text(
                        'حاسبة القروض',
                        style: TextStyle(
                          fontSize: 18,
                          // fontFamily: 'jf',
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            CalculatorScreen.routeName);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 150,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
