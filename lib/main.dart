import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_web_x/customCard.dart';
import 'package:flutter_app_web_x/seconsScreen.dart';

final _firestore = FirebaseFirestore.instance;

void main() async {
  runApp(webWiev());
}

class webWiev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SeconsScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var widthSingleColumn = MediaQuery.of(context).size.width * 0.25;
    return Row(children: [
      Container(
        width: widthSingleColumn,
        child: Card(
          color: Colors.blue[900],
          child: Column(
            children: [
              Text(
                'Proces',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.04),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('NWW')
                    .doc('Events')
                    .collection('EventsUUID')
                    .doc('Data')
                    .collection('DataUUID')
                    .where('FerstRegion', isEqualTo: 'Proces')
                    .where('StatusForDisplay', isEqualTo: 'InProgress')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  final messages = snapshot.data.docs.reversed;
                  List<MessageBubble> messageBubbles = [];
                  for (var message in messages) {
                    final createTime = message.data()['CreateTime'];
                    final creatorEmail = message.data()['CreatorEmail'];
                    final description = message.data()['Description'];
                    final firstRegion = message.data()['FerstRegion'];
                    final secondRegion = message.data()['SecondRegion'];
                    final thirdRegion = message.data()['ThirdRegion'];
                    final status = message.data()['Status'];
                    final statusColor = message.data()['StatusColor'];

                    final messageBubble = MessageBubble(
                      createTimeFrom: createTime,
                      creatorEmailFrom: creatorEmail,
                      descriptionFrom: description,
                      firstRegionFrom: firstRegion,
                      secondRegionFrom: secondRegion,
                      thirdRegionFrom: thirdRegion,
                      statusFrom: status,
                      statusColorFrom: statusColor,
                    );
                    messageBubbles.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      children: messageBubbles,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      Container(
        width: widthSingleColumn,
        child: Card(
          color: Colors.yellow[800],
          child: Column(
            children: [
              Text('Filing',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04)),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('NWW')
                    .doc('Events')
                    .collection('EventsUUID')
                    .doc('Data')
                    .collection('DataUUID')
                    .where('FerstRegion', isEqualTo: "Filing")
                    .where('StatusForDisplay', isEqualTo: 'InProgress')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  final messages = snapshot.data.docs.reversed;
                  List<MessageBubble> messageBubbles = [];
                  for (var message in messages) {
                    final createTime = message.data()['CreateTime'];
                    final creatorEmail = message.data()['CreatorEmail'];
                    final description = message.data()['Description'];
                    final firstRegion = message.data()['FerstRegion'];
                    final secondRegion = message.data()['SecondRegion'];
                    final thirdRegion = message.data()['ThirdRegion'];
                    final status = message.data()['Status'];
                    final statusColor = message.data()['StatusColor'];

                    final messageBubble = MessageBubble(
                      createTimeFrom: createTime,
                      creatorEmailFrom: creatorEmail,
                      descriptionFrom: description,
                      firstRegionFrom: firstRegion,
                      secondRegionFrom: secondRegion,
                      thirdRegionFrom: thirdRegion,
                      statusFrom: status,
                      statusColorFrom: statusColor,
                    );
                    messageBubbles.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      children: messageBubbles,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      Container(
        width: widthSingleColumn,
        child: Card(
          color: Colors.green[800],
          child: Column(
            children: [
              Text(
                'PKG_MPK',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.04),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('NWW')
                    .doc('Events')
                    .collection('EventsUUID')
                    .doc('Data')
                    .collection('DataUUID')
                    .where('FerstRegion', isEqualTo: "PKG_MPG")
                    .where('StatusForDisplay', isEqualTo: 'InProgress')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  final messages = snapshot.data.docs.reversed;
                  List<MessageBubble> messageBubbles = [];
                  for (var message in messages) {
                    final createTime = message.data()['CreateTime'];
                    final creatorEmail = message.data()['CreatorEmail'];
                    final description = message.data()['Description'];
                    final firstRegion = message.data()['FerstRegion'];
                    final secondRegion = message.data()['SecondRegion'];
                    final thirdRegion = message.data()['ThirdRegion'];
                    final status = message.data()['Status'];
                    final statusColor = message.data()['StatusColor'];

                    final messageBubble = MessageBubble(
                      createTimeFrom: createTime,
                      creatorEmailFrom: creatorEmail,
                      descriptionFrom: description,
                      firstRegionFrom: firstRegion,
                      secondRegionFrom: secondRegion,
                      thirdRegionFrom: thirdRegion,
                      statusFrom: status,
                      statusColorFrom: statusColor,
                    );
                    messageBubbles.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      children: messageBubbles,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      Container(
        width: widthSingleColumn,
        child: Card(
          color: Colors.brown[800],
          child: Column(
            children: [
              Text('Utility',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04)),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('NWW')
                    .doc('Events')
                    .collection('EventsUUID')
                    .doc('Data')
                    .collection('DataUUID')
                    .where('FerstRegion', isEqualTo: "Utility")
                    .where('StatusForDisplay', isEqualTo: 'InProgress')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  final messages = snapshot.data.docs.reversed;
                  List<MessageBubble> messageBubbles = [];
                  for (var message in messages) {
                    final createTime = message.data()['CreateTime'];
                    final creatorEmail = message.data()['CreatorEmail'];
                    final description = message.data()['Description'];
                    final firstRegion = message.data()['FerstRegion'];
                    final secondRegion = message.data()['SecondRegion'];
                    final thirdRegion = message.data()['ThirdRegion'];
                    final status = message.data()['Status'];
                    final statusColor = message.data()['StatusColor'];

                    final timePass1 = DateTime.now().toString();

                    final messageBubble = MessageBubble(
                      createTimeFrom: createTime,
                      creatorEmailFrom: creatorEmail,
                      descriptionFrom: description,
                      firstRegionFrom: firstRegion,
                      secondRegionFrom: secondRegion,
                      thirdRegionFrom: thirdRegion,
                      statusFrom: status,
                      statusColorFrom: statusColor,
                      timePass: timePass1,
                    );
                    messageBubbles.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                      children: messageBubbles,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {this.createTimeFrom,
      this.creatorEmailFrom,
      this.descriptionFrom,
      this.firstRegionFrom,
      this.secondRegionFrom,
      this.statusFrom,
      this.statusColorFrom,
      this.thirdRegionFrom,
      this.eventIdFrom,
      this.timePass});

  final String createTimeFrom;
  final String creatorEmailFrom;
  final String descriptionFrom;
  final String firstRegionFrom;
  final String secondRegionFrom;
  final String thirdRegionFrom;
  final String statusFrom;
  final int statusColorFrom;
  final String eventIdFrom;
  final String timePass;

  @override
  Widget build(BuildContext context) {
    DateTime x = DateTime.parse(createTimeFrom);
    Duration y = DateTime.now().difference(x);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      color: colorPicker(colornumber: firstRegionFrom),
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(firstText: 'Create Time', secondText: createTimeFrom),
            CustomCard(firstText: 'Created by', secondText: creatorEmailFrom),
            CustomCard(firstText: 'Description', secondText: descriptionFrom),
            CustomCard(
                firstText: 'Area',
                secondText:
                    '$firstRegionFrom/$secondRegionFrom/$thirdRegionFrom'),
            CustomCard(firstText: 'Status', secondText: statusFrom),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Time pass: ${y.inHours.toString()} in hours ' +
                  '${y.inMinutes} in minutes'),
            ),
          ],
        ),
      ),
    );
  }

  colorPicker({String colornumber}) {
    if (colornumber == 'Proszki') {
      return Colors.red;
    }
    if (colornumber == 'Proces') {
      return Colors.blue;
    }
    if (colornumber == 'Filing') {
      return Colors.yellow;
    }
    if (colornumber == 'PKG_MPK') {
      return Colors.lightGreen;
    }
    if (colornumber == 'Utility') {
      return Colors.brown;
    } else {
      return Colors.purpleAccent;
    }
  }
}
