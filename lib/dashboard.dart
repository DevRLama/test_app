import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_app/userData.dart';

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
          child: FutureBuilder<List<UserData>>(
              future: getUsers(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  List<UserData>? users = snapShot.data;
                  return ListView.builder(
                      itemCount: users!.length,
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
                                      '${users[index].picture}',
                                      errorBuilder: (e, _, __) {
                                        return Container(
                                          height: 100,
                                          width: 60,
                                          child: Text('No Image'),
                                        );
                                      },
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        Text('First Name: ${users[index].firstName}'),
                                        SizedBox(height: 5),
                                        Text('Last Name: ${users[index].lastName}'),
                                        SizedBox(height: 5),
                                        Text('ID: ${users[index].id}'),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      });
                }
                return CircularProgressIndicator();
              }),
        ));
  }

  // Method for fetching data from Api and return that data

  Future<List<UserData>> getUsers() async {
    List<UserData> userData = [];
    var dio = Dio();
    dio.options.headers['app-id'] = "63343abb5fbacb5bc06cc2d1";
    try {
      Response response = await dio.get(
        'https://dummyapi.io/data/v1/user?limit=10',
      );
      if (response.statusCode == 200) {
        userData = [];
        print('Data Fetched ');
        List users = response.data['data'];
        users.forEach((element) {
          userData.add(UserData.fromJson(element));
        });
      }
    } catch (e) {
      print('Error $e');
    }
    // print('Error ${response.statusCode}  ${response.statusMessage}');

    return userData;
  }
}
