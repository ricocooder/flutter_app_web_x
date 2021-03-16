import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_web_x/streamBuilder.dart';

final _firestore = FirebaseFirestore.instance;

class SeconsScreen extends StatefulWidget {
  @override
  _SeconsScreenState createState() => _SeconsScreenState();
}
///NWW/Areas/areasTest/001
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

            final messageBubble = MessageBubble(
              areaNameFrom: areaName,
              areaIdFrom: areaId,
            );
            messageBubbles.add(messageBubble);
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
            children: messageBubbles,
          );
        },
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {@required this.areaNameFrom,
      @required this.areaIdFrom,});

  final String areaNameFrom;
  final String areaIdFrom;

  @override
  Widget build(BuildContext context) {
    print('areaNameFrom: ---------->>>>>>>$areaNameFrom');
    print('areaIdFrom: ---------->>>>>>>$areaIdFrom');
    return Flexible(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$areaNameFrom'),
          Text('$areaIdFrom'),
          EventStream(passedId: areaNameFrom,),
        ],
      ),
    );




    //   Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(2.0),
    //     ),
    //   ),
    //   margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
    //   child: InkWell(
    //     onTap: () {
    //       // Navigator.push(
    //       //     context,
    //       //     MaterialPageRoute(
    //       //         builder: (context) => DetailPage(
    //       //               passedId: '$eventIdFrom',
    //       //             )));
    //     },
    //     onLongPress: () {
    //       // createDeleteEventDialog(context, eventIdFrom);
    //     },
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         // CustomCardTwoLine(
    //         //   firstText: globals.globalLanguage
    //         //       ? "${translator[14].pl}"
    //         //       : '${translator[14].en}',
    //         //   secondText: '$firstRegionFrom/$secondRegionFrom/$thirdRegionFrom',
    //         //   color: colorPicker(colornumber: firstRegionFrom),
    //         // ),
    //         // Padding(
    //         //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //         //   child: Text(
    //         //     globals.globalLanguage
    //         //         ? "${translator[15].pl} $createTimeFrom"
    //         //         : '${translator[15].en} $createTimeFrom',
    //         //   ),
    //         // ),
    //         // Padding(
    //         //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //         //   child: Divider(
    //         //     height: 2.0,
    //         //     color: colorPicker(colornumber: firstRegionFrom),
    //         //   ),
    //         // ),
    //         // Padding(
    //         //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //         //   child: Text(
    //         //     globals.globalLanguage
    //         //         ? "${translator[16].pl} $creatorEmailFrom"
    //         //         : '${translator[16].en} $creatorEmailFrom',
    //         //   ),
    //         // ),
    //         // Padding(
    //         //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //         //   child: Divider(
    //         //     height: 2.0,
    //         //     color: colorPicker(colornumber: firstRegionFrom),
    //         //   ),
    //         // ),
    //         // Padding(
    //         //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //         //   child: Text(
    //         //     globals.globalLanguage
    //         //         ? "${translator[17].pl} $descriptionFrom"
    //         //         : '${translator[17].en} $descriptionFrom',
    //         //   ),
    //         // ),
    //         // Padding(
    //         //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //         //   child: Divider(
    //         //     height: 2.0,
    //         //     color: colorPicker(colornumber: firstRegionFrom),
    //         //   ),
    //         // ),
    //         // Padding(
    //         //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
    //         //   child: Text(
    //         //     globals.globalLanguage
    //         //         ? "${translator[18].pl} $statusFrom"
    //         //         : '${translator[18].en} $statusFrom',
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
