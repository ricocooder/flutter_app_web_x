import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_web_x/customCard.dart';
import 'package:flutter_app_web_x/seconsScreen.dart';

final _firestore = FirebaseFirestore.instance;

void main() async {
  // await Firebase.initializeApp();
  runApp(webWiev());
}

class webWiev extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SeconsScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    var widthSingleColumn = MediaQuery.of(context).size.width * 0.25;
    return Row(children: [
//       Container(
//         width: widthSingleColumn,
//         child: Card(
//           color: Colors.red[800],
//           child: Column(
//             children: [
//               Text('Proszki',
//                   style: TextStyle(
//                       fontSize: MediaQuery.of(context).size.height * 0.04)),
//               SizedBox(
//                 height: 20.0,
//               ),
//               StreamBuilder<QuerySnapshot>(
//                 stream: _firestore
//                     .collection('NWW')
//                     .doc('Events')
//                     .collection('EventsUUID')
//                     .doc('Data')
//                     .collection('DataUUID')
// //                  .orderBy('CreateTime', descending: false)
// //          .where('CreateTime', isEqualTo: null)
// //          .where('CreateTime', isEqualTo: '2020-09-06 23:24:14')
// //          .where('CreatorEmail', isEqualTo: null)
// //          .where('Description', isEqualTo: null)
// //                  .where('FerstRegion', isEqualTo: "Multipacking")
// //          .where('FerstRegion', isEqualTo: "Proces")
//                     .where('FerstRegion', isEqualTo: "Proszki")
// //          .where('FerstRegion', isEqualTo: "Proces")
// //          .where('SecondRegion', isEqualTo: null)
//          .where('StatusForDisplay', isEqualTo: 'InProgress')
// //          .where('StatusNumber', isEqualTo: null)
// //          .where('ThirdRegion', isEqualTo: null)
// //          .where('StatusNumber', isGreaterThan: null)
// //                                .orderBy('CreateTimeInMilis', descending: false)
//
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.lightBlueAccent,
//                       ),
//                     );
//                   }
//                   final messages = snapshot.data.docs;
//                   List<MessageBubble> messageBubbles = [];
//                   for (var message in messages) {
//                     final createTime = message.data()['CreateTime'];
//                     final creatorEmail = message.data()['CreatorEmail'];
//                     final description = message.data()['Description'];
//                     final firstRegion = message.data()['FerstRegion'];
//                     final secondRegion = message.data()['SecondRegion'];
//                     final thirdRegion = message.data()['ThirdRegion'];
//                     final status = message.data()['Status'];
//                     final statusColor = message.data()['StatusColor'];
// //                    final eventId = message.documentID;
//
//                     final messageBubble = MessageBubble(
//                       createTimeFrom: createTime,
//                       creatorEmailFrom: creatorEmail,
//                       descriptionFrom: description,
//                       firstRegionFrom: firstRegion,
//                       secondRegionFrom: secondRegion,
//                       thirdRegionFrom: thirdRegion,
//                       statusFrom: status,
//                       statusColorFrom: statusColor,
// //                      eventIdFrom: eventId,
//                     );
//                     messageBubbles.add(messageBubble);
//                   }
//                   return Expanded(
//                     child: ListView(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
//                       children: messageBubbles,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
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
//                    .orderBy('CreateTimeInMilis', descending: true)
//                  .orderBy('CreateTime', descending: false)
//          .where('CreateTime', isEqualTo: null)
//          .where('CreateTime', isEqualTo: '2020-09-06 23:24:14')
//          .where('CreatorEmail', isEqualTo: null)
//          .where('Description', isEqualTo: null)
//                  .where('FerstRegion', isEqualTo: "Multipacking")
                    .where('FerstRegion', isEqualTo: 'Proces')
//          .where('FerstRegion', isEqualTo: "Packing")
//          .where('FerstRegion', isEqualTo: "Proces")
                    .where('StatusForDisplay', isEqualTo: 'InProgress')

//          .where('SecondRegion', isEqualTo: null)
//          .where('Status', isEqualTo: 'Waiting for maitenance')
//          .where('StatusNumber', isEqualTo: null)
//          .where('ThirdRegion', isEqualTo: null)
//          .where('StatusNumber', isGreaterThan: null)

                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
//                    final eventId = message.documentID;

                    final messageBubble = MessageBubble(
                      createTimeFrom: createTime,
                      creatorEmailFrom: creatorEmail,
                      descriptionFrom: description,
                      firstRegionFrom: firstRegion,
                      secondRegionFrom: secondRegion,
                      thirdRegionFrom: thirdRegion,
                      statusFrom: status,
                      statusColorFrom: statusColor,
//                      eventIdFrom: eventId,
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
//                  .orderBy('CreateTime', descending: false)
//          .where('CreateTime', isEqualTo: null)
//          .where('CreateTime', isEqualTo: '2020-09-06 23:24:14')
//          .where('CreatorEmail', isEqualTo: null)
//          .where('Description', isEqualTo: null)
//                  .where('FerstRegion', isEqualTo: "Multipacking")
//          .where('FerstRegion', isEqualTo: "Proces")
                    .where('FerstRegion', isEqualTo: "Filing")
//          .where('FerstRegion', isEqualTo: "Proces")
//          .where('SecondRegion', isEqualTo: null)
                    .where('StatusForDisplay', isEqualTo: 'InProgress')

//          .where('Status', isEqualTo: 'Waiting for maitenance')
//          .where('StatusNumber', isEqualTo: null)
//          .where('ThirdRegion', isEqualTo: null)
//          .where('StatusNumber', isGreaterThan: null)
//                                .orderBy('CreateTimeInMilis', descending: false)

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
//                    final eventId = message.documentID;

                    final messageBubble = MessageBubble(
                      createTimeFrom: createTime,
                      creatorEmailFrom: creatorEmail,
                      descriptionFrom: description,
                      firstRegionFrom: firstRegion,
                      secondRegionFrom: secondRegion,
                      thirdRegionFrom: thirdRegion,
                      statusFrom: status,
                      statusColorFrom: statusColor,
//                      eventIdFrom: eventId,
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
//              Divider(
//                height: 10.0,
//                color: Colors.white,
//              ),
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
//                  .orderBy('CreateTimeInMilis', descending: true)
//          .where('CreateTime', isEqualTo: null)
//          .where('CreateTime', isEqualTo: '2020-09-06 23:24:14')
//          .where('CreatorEmail', isEqualTo: 'tadek@gmail.com')
//          .where('Description', isEqualTo: null)
          .where('FerstRegion', isEqualTo: "PKG_MPG")
//          .where('FerstRegion', isEqualTo: "Proces")
//          .where('FerstRegion', isEqualTo: "Packing")
//          .where('FerstRegion', isEqualTo: "Proces")
                    .where('StatusForDisplay', isEqualTo: 'InProgress')

//          .where('SecondRegion', isEqualTo: 'CL4')
//          .where('Status', isEqualTo: 'Waiting for maitenance')
//          .where('StatusNumber', isEqualTo: null)
//          .where('ThirdRegion', isEqualTo: 'IMA')
//                    .where('ThirdRegion', isEqualTo: 'MixTray')
//                    .where('ThirdRegion', isEqualTo: 'Schubert Closer')
//                    .where('ThirdRegion', isEqualTo: 'Schubers Picker')
//                    .where('ThirdRegion', isEqualTo: 'VectorTransporter')
//          .where('StatusNumber', isEqualTo: 9)
//                    .orderBy('CreateTimeInMilis', descending: true)
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
//                    final eventId = message.documentID;

                    final messageBubble = MessageBubble(
                      createTimeFrom: createTime,
                      creatorEmailFrom: creatorEmail,
                      descriptionFrom: description,
                      firstRegionFrom: firstRegion,
                      secondRegionFrom: secondRegion,
                      thirdRegionFrom: thirdRegion,
                      statusFrom: status,
                      statusColorFrom: statusColor,
//                      eventIdFrom: eventId,
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
//                  .orderBy('CreateTime', descending: false)
//          .where('CreateTime', isEqualTo: null)
//          .where('CreateTime', isEqualTo: '2020-09-06 23:24:14')
//          .where('CreatorEmail', isEqualTo: null)
//          .where('Description', isEqualTo: null)
//                  .where('FerstRegion', isEqualTo: "Multipacking")
//          .where('FerstRegion', isEqualTo: "Proces")
                    .where('FerstRegion', isEqualTo: "Utility")
//          .where('FerstRegion', isEqualTo: "Proces")
//          .where('SecondRegion', isEqualTo: null)
                    .where('StatusForDisplay', isEqualTo: 'InProgress')

//          .where('Status', isEqualTo: 'Waiting for maitenance')
//          .where('StatusNumber', isEqualTo: null)
//          .where('ThirdRegion', isEqualTo: null)
//          .where('StatusNumber', isGreaterThan: null)
//                                .orderBy('CreateTimeInMilis', descending: false)

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
//                    final eventId = message.documentID;
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
//                      eventIdFrom: eventId,
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
      //TODO tu zczytywac on tap ?
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      color: colorPicker(colornumber: firstRegionFrom),
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: InkWell(
        onTap: () {
          print('Taped: $eventIdFrom');
//          Navigator.pushNamed(context, MaterialPageRoute(builder: (context)));
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => DetailPage(
//                    passedId: '$eventIdFrom',
//                  )));
//          navigateToDetailPage(eventIdFrom);
          //TODO open "DetailPage" passing eventIdFrom and display all detail
        },
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

//
//      Row(
//      children: [
//        Column(
//          children: [
//            StreamBuilder<QuerySnapshot>(
//              stream: _firestore
//                  .collection('Purina')
//                  .document('Events')
//                  .collection('EventsUUID')
//                  .document('Data')
//                  .collection('DataUUID')
//                  .orderBy('CreateTime', descending: false)
////                  .where('FerstRegion', isEqualTo: "Proces")
//                  .snapshots(),
//              builder: (context, snapshot) {
//                return ListView.builder(itemBuilder: (context, index){
//                  return
//
//
//
//
//
//
//
//
//
////                    Card(
////                    color: Colors.blue,
////                    child: Column(
////                      crossAxisAlignment: CrossAxisAlignment.start,
////                      mainAxisAlignment: MainAxisAlignment.start,
////                      children: [
////                        Text(
////                          'Proces',
////                          style: TextStyle(
////                              color: Colors.black,
////                              fontSize: MediaQuery.of(context).size.height *
////                                  0.04),
////                        ),
////                        Card(
////                          child: Column(
////                            crossAxisAlignment: CrossAxisAlignment.start,
////                            children: [
////                              CustomCard(
////                                firstText: "Create Time: ",
////                                secondText:
////                                "${snapshot.data.documents[index]['CreateTime']}",
////                              ),
////                              CustomCard(
////                                firstText: "Created by: ",
////                                secondText:
////                                "${snapshot.data.documents[index]["CreatorEmail"]}",
////                              ),
////                              CustomCard(
////                                firstText: "Description: ",
////                                secondText:
////                                "${snapshot.data.documents[index]["Description"]}",
////                              ),
////                              CustomCard(
////                                firstText: "Area: ",
////                                secondText:
////                                "${snapshot.data.documents[index]["FerstRegion"] + '/' + snapshot.data.documents[index]["SecondRegion"] + '/' + snapshot.data.documents[index]["ThirdRegion"]}",
////                              ),
////                              CustomCard(
////                                firstText: 'Status',
////                                secondText: "${snapshot.data.documents[index]["Status"]}",
////                              ),
////                            ],
////                          ),
////                        ),
////                      ],
////                    ),
////                  );
//                },
//                );
//
//
//
//
//
//
//
//
//
////                  Row(
////                  children: [
////                    Container(
////                      width: MediaQuery.of(context).size.width * 0.2,
////                      child: Card(
////                        color: Colors.blue,
////                        child: Column(
////                          crossAxisAlignment: CrossAxisAlignment.start,
////                          mainAxisAlignment: MainAxisAlignment.start,
////                          children: [
////                            Text(
////                              'Proces',
////                              style: TextStyle(
////                                  color: Colors.black,
////                                  fontSize: MediaQuery.of(context).size.height *
////                                      0.04),
////                            ),
////                            Card(
////                              child: Column(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////                                children: [
////                                  CustomCard(
////                                    firstText: "Create Time: ",
////                                    secondText:
////                                        "${snapshot.data.documents[]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Created by: ",
////                                    secondText:
////                                        "${snapshot.data["CreatorEmail"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Description: ",
////                                    secondText:
////                                        "${snapshot.data["Description"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Area: ",
////                                    secondText:
////                                        "${snapshot.data["FerstRegion"] + '/' + snapshot.data["SecondRegion"] + '/' + snapshot.data["ThirdRegion"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: 'Status',
////                                    secondText: "${snapshot.data["Status"]}",
////                                  ),
////                                ],
////                              ),
////                            ),
////                          ],
////                        ),
////                      ),
////                    ),
////                    Container(
////                      width: MediaQuery.of(context).size.width * 0.2,
////                      child: Card(
////                        color: Colors.yellow,
////                        child: Column(
////                          crossAxisAlignment: CrossAxisAlignment.start,
////                          mainAxisAlignment: MainAxisAlignment.start,
////                          children: [
////                            Text(
////                              'Packing',
////                              style: TextStyle(
////                                  color: Colors.black,
////                                  fontSize: MediaQuery.of(context).size.height *
////                                      0.04),
////                            ),
////                            Card(
////                              child: Column(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////                                children: [
////                                  CustomCard(
////                                    firstText: "Create Time: ",
////                                    secondText:
////                                        "${snapshot.data["CreateTime"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Created by: ",
////                                    secondText:
////                                        "${snapshot.data["CreatorEmail"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Description: ",
////                                    secondText:
////                                        "${snapshot.data["Description"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Area: ",
////                                    secondText:
////                                        "${snapshot.data["FerstRegion"] + '/' + snapshot.data["SecondRegion"] + '/' + snapshot.data["ThirdRegion"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: 'Status',
////                                    secondText: "${snapshot.data["Status"]}",
////                                  ),
////                                ],
////                              ),
////                            ),
////                          ],
////                        ),
////                      ),
////                    ),
////                    Container(
////                      width: MediaQuery.of(context).size.width * 0.2,
////                      child: Card(
////                        color: Colors.lightGreen,
////                        child: Column(
////                          crossAxisAlignment: CrossAxisAlignment.start,
////                          mainAxisAlignment: MainAxisAlignment.start,
////                          children: [
////                            Text(
////                              'Multipacking',
////                              style: TextStyle(
////                                  color: Colors.black,
////                                  fontSize: MediaQuery.of(context).size.height *
////                                      0.04),
////                            ),
////                            Card(
////                              child: Column(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////                                children: [
////                                  CustomCard(
////                                    firstText: "Create Time: ",
////                                    secondText:
////                                        "${snapshot.data["CreateTime"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Created by: ",
////                                    secondText:
////                                        "${snapshot.data["CreatorEmail"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Description: ",
////                                    secondText:
////                                        "${snapshot.data["Description"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Area: ",
////                                    secondText:
////                                        "${snapshot.data["FerstRegion"] + '/' + snapshot.data["SecondRegion"] + '/' + snapshot.data["ThirdRegion"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: 'Status',
////                                    secondText: "${snapshot.data["Status"]}",
////                                  ),
////                                ],
////                              ),
////                            ),
////                          ],
////                        ),
////                      ),
////                    ),
////                    Container(
////                      width: MediaQuery.of(context).size.width * 0.2,
////                      child: Card(
////                        color: Colors.red,
////                        child: Column(
////                          crossAxisAlignment: CrossAxisAlignment.start,
////                          mainAxisAlignment: MainAxisAlignment.start,
////                          children: [
////                            Text(
////                              'Proszki',
////                              style: TextStyle(
////                                  color: Colors.black,
////                                  fontSize: MediaQuery.of(context).size.height *
////                                      0.04),
////                            ),
////                            Card(
////                              child: Column(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////                                children: [
////                                  CustomCard(
////                                    firstText: "Create Time: ",
////                                    secondText:
////                                        "${snapshot.data["CreateTime"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Created by: ",
////                                    secondText:
////                                        "${snapshot.data["CreatorEmail"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Description: ",
////                                    secondText:
////                                        "${snapshot.data["Description"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Area: ",
////                                    secondText:
////                                        "${snapshot.data["FerstRegion"] + '/' + snapshot.data["SecondRegion"] + '/' + snapshot.data["ThirdRegion"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: 'Status',
////                                    secondText: "${snapshot.data["Status"]}",
////                                  ),
////                                ],
////                              ),
////                            ),
////                          ],
////                        ),
////                      ),
////                    ),
////                    Container(
////                      width: MediaQuery.of(context).size.width * 0.2,
////                      child: Card(
////                        color: Colors.brown,
////                        child: Column(
////                          crossAxisAlignment: CrossAxisAlignment.start,
////                          mainAxisAlignment: MainAxisAlignment.start,
////                          children: [
////                            Text(
////                              'Utility',
////                              style: TextStyle(
////                                  color: Colors.black,
////                                  fontSize: MediaQuery.of(context).size.height *
////                                      0.04),
////                            ),
////                            Card(
////                              child: Column(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////                                children: [
////                                  CustomCard(
////                                    firstText: "Create Time: ",
////                                    secondText:
////                                        "${snapshot.data["CreateTime"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Created by: ",
////                                    secondText:
////                                        "${snapshot.data["CreatorEmail"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Description: ",
////                                    secondText:
////                                        "${snapshot.data["Description"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: "Area: ",
////                                    secondText:
////                                        "${snapshot.data["FerstRegion"] + '/' + snapshot.data["SecondRegion"] + '/' + snapshot.data["ThirdRegion"]}",
////                                  ),
////                                  CustomCard(
////                                    firstText: 'Status',
////                                    secondText: "${snapshot.data["Status"]}",
////                                  ),
////                                ],
////                              ),
////                            ),
////                          ],
////                        ),
////                      ),
////                    ),
////                  ],
////                );
//              },
//            )
//          ],
//        ),
//      ],
//    );
//  }
//}
