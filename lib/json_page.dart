import 'dart:convert';
import 'package:flutter/material.dart';

class jsonPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON Example'),),
      body:FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/currency.json') ,
        builder: (context, snapshot){
             if(snapshot.hasError)
               {
                 return Center(
                   child: Text('Something went wrong'),
                 );
               }
             if(snapshot.hasData)
               {  var showData = json.decode(snapshot.data);
                 return ListView.builder(
                     itemCount:showData.length ,
                     itemBuilder: (context, index){
                       return buildTile(showData[index]);
                     });
               }
             else {
               return Center( child: CircularProgressIndicator(),);
             }
        },
      )
    );
  }
  buildTile(Map<String, dynamic> obj){
    return ListTile(
      title: Text('${obj['name']}'),
      subtitle: Text('${obj['code']}'),
      leading: CircleAvatar(
        backgroundColor: Colors.indigo[400],
        child: Icon(Icons.money),
      ),
    );
  }
}
