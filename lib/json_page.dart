import 'dart:convert';

import 'package:flutter/material.dart';

class jsonPage extends StatefulWidget {
  @override
  _jsonPageState createState() => _jsonPageState();
}

class _jsonPageState extends State<jsonPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('JSON Example'),),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/currency.json"),
        builder: (context, snapshot){
          if(snapshot.hasError)
            {
              return Center(child :Text("Something went wrong"));
            }
          else if(snapshot.hasData){
            var showData= json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: showData.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(showData[index]["name"]),
                    subtitle: Text(showData[index]["code"]),
                    leading: CircleAvatar(
                      // radius: 50,

                      backgroundColor: Colors.deepOrange,
                      child: Icon(Icons.attach_money),

                    ),
                  );
                });
          }
          else {
            return Center(child: CircularProgressIndicator(),);
          }
        },

      ),
    );
  }
}
