import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
          // Column(

          SingleChildScrollView(

        child: Column(

          children: [
            //   children: [
            AppBar(
              title: Text("Menu"),
              automaticallyImplyLeading: false,
            ),
            Divider(
              height: 50,
              color: Theme.of(context).primaryColor,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.person),
                title: Text("My Profile"),
                onTap: () {}
                // Navigator.of(context).pushReplacementNamed(
                //     ProfileScreen.routeName),
                ),
            Divider(),
            ListTile(
                leading: Icon(Icons.chat),
                title: Text("Chat"),
                onTap: () {}
                // Navigator.of(context).pushReplacementNamed(
                //     ChatScreen.routeName),
                ),
            Divider(),
            ListTile(
                leading: Icon(Icons.report_problem),
                title: Text("Reports"),
                onTap: () {}
                // Navigator.of(context).pushReplacementNamed(
                //     WareHouse.routeName),
                ),

            // Divider(),
            // ListTile(
            //     leading: Icon(Icons.payment),
            //     title: Text("Orders"),
            //     onTap: () {}
            //     // Navigator.of(context)
            //     //     .pushReplacementNamed(OrderScreen.routeName),
            //     ),
            Divider(),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text("App Setting"),
                onTap: () {}
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductScreen.routeName),
                ),
            Divider(),
            ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
                onTap: () {}
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductScreen.routeName),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app_rounded),
              title: Text("Log out"),
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).pushReplacementNamed('/');
                // Provider.of<Auth>(context, listen: false).logout();
              },
            ),
          ],
        ),
      ),

      //   ],
      // ),
    );
  }
}
