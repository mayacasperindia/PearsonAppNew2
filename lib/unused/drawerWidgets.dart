

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/registration/login.dart';

class drawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 260,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage(
                              "assets/images/background.jpg")
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text('Hi Pearson!', style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Class: ', style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),),
                        Text(' XII', style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' 9876543456', style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' pearson@gmail.com', style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 260,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                    ),
                    ExpansionTile(
                      title: Text('Product'),
                      leading: Icon(Icons.pages),
                      children: [
                        ListTile(
                          dense:true,
                          leading: Icon(Icons.foundation),
                          title: Text('Foundation IX & X'),
                        ),
                        ListTile(
                          dense:true,
                          leading: Icon(Icons.eject),
                          title: Text('JEE Main'),
                        ),
                        ListTile(
                          dense:true,
                          leading: Icon(Icons.local_activity_rounded),
                          title: Text('JEE Advanced'),
                        ),
                        ListTile(
                          dense:true,
                          leading: Icon(Icons.lock_open),
                          title: Text('NEET'),
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.featured_play_list),
                      title: Text('Features'),
                    ),
                    ListTile(
                      leading: Icon(Icons.add_box_rounded),
                      title: Text('Packages'),
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text('Support'),
                    ),
                    ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text('About Us'),
                    ),
                    Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.red,),
                      title: Text('Logout', style: TextStyle(
                        fontSize: 15, color: Colors.red,fontWeight: FontWeight.w900,
                      ),),
                      onTap: () async {
                        // SharedPreferences prefs = await SharedPreferences.getInstance();
                        // prefs.remove('email');
                        // prefs.remove('password');
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
                      },
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
