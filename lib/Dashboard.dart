import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = 0;
    double height = 0;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Dashboard"),
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                        elevation: 18,
                        child: Container(
                          width: double.infinity,
                          height: height / 4,
                          child: Row(
                            children: [
                              Image.network(
                                'picture',
                                errorBuilder: (e, _, __) {
                                  return Container(
                                    height: 100,
                                    width: 60,
                                    child: Text('No Image'),
                                  );
                                },
                              ),
                              Column(
                                children: const [
                                  Text('First Name'),
                                  Text('Last Name'),
                                  Text('Id Name'),
                                ],
                              )
                            ],
                          ),
                        )),
                  );
                })));
  }

  // Method for fetching data from Api and return that data


}
