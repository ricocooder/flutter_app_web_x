import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_web_x/streamBuilder.dart';

final _firestore = FirebaseFirestore.instance;

class SeconsScreen extends StatefulWidget {
  @override
  _SeconsScreenState createState() => _SeconsScreenState();
}

class _SeconsScreenState extends State<SeconsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('NWW')
            .doc('Areas')
            .collection('areasTest')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data.docs;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final areaName = message.data()['AreaName'];
            final areaId = message.id;
            final areasCount = messages.length;

            final messageBubble = MessageBubble(
              areaNameFrom: areaName,
              areaIdFrom: areaId,
                areasCountFrom: areasCount,
            );
            messageBubbles.add(messageBubble);
          }
          // return ListView(
          //   children: messageBubbles,
          // );
            return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: messageBubbles,
          );
        },
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    @required this.areaNameFrom,
    @required this.areaIdFrom,
    @required this.areasCountFrom,
  });

  final String areaNameFrom;
  final String areaIdFrom;
  final int areasCountFrom;

  @override
  Widget build(BuildContext context) {
    print('areaNameFrom: ---------->>>>>>>$areaNameFrom');
    print('areaIdFrom: ---------->>>>>>>$areaIdFrom');
    print('areasCountFrom: ---------->>>>>>>$areasCountFrom');
    print(MediaQuery.of(context).size.width);

    if(MediaQuery.of(context).size.width / areasCountFrom > 240){
      return Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$areaNameFrom ($areaIdFrom)'),
            Text('areasCountFrom: $areasCountFrom'),
            Text('${MediaQuery.of(context).size.width}'),
            Text('${MediaQuery.of(context).size.width/areasCountFrom}'),
            EventStream(
              passedId: areaNameFrom,
            ),
          ],
        ),
      );
    }else{
      return Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$areaNameFrom ($areaIdFrom)'),
            // Text('areasCountFrom: $areasCountFrom'),
            // Text('${MediaQuery.of(context).size.width}'),
            Text('${MediaQuery.of(context).size.width/areasCountFrom}'),
            EventStream(
              passedId: areaNameFrom,
            ),
          ],
        ),
      );
    }

  }
}
