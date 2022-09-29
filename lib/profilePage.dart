import 'package:flutter/material.dart';
import 'package:test_app/dashboard.dart';


class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      // This method is rerun every time setState is called, for instance as done
      // by the _incrementCounter method above.
      //
      // The Flutter framework has been optimized to make rerunning build methods
      // fast, so that you can just rebuild anything that needs updating rather
      // than having to individually change instances of widgets.
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Awesome App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child:SingleChildScrollView(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/download1.png"),
                    SizedBox(height: 20),
                    Text(
                      "Profile Info",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow:const [
                          BoxShadow(
                          color: Colors.grey,
                          blurRadius:10,
                          offset: Offset(2.0,5.0)
                      )
                        ]
                      ),

                        child: TextButton(
                          onPressed: () async{
                               Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>Dashboard()));},

                          child: Text('Employees Detail'),
                        ))

                  ],
                ),
              )),
        ),
        drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Dev Raghvendra Lama"),
                  accountEmail: Text("dev.lama007@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.teal,
                    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80") ,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Account"),
                  subtitle: Text("Personal"),
                  trailing: Icon(Icons.edit),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text("Email"),
                  subtitle: Text("dev.lama007@gmail.com"),
                  trailing: Icon(Icons.send),
                )
              ],
            )
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  
}