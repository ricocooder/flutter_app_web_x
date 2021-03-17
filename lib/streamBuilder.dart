import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'colorPicker.dart';
import 'customCard_TwoLine.dart';
import 'languageManager.dart';

final _firestore = FirebaseFirestore.instance;

class EventStream extends StatelessWidget {
  EventStream({@required this.passedId});
  final String passedId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: passedId != null
          ? _firestore
              .collection('NWW')
              .doc('Events')
              .collection('EventsUUID')
              .doc('Data')
              .collection('DataUUID')
              .where('FerstRegion', isEqualTo: '$passedId')
              .snapshots()
          : _firestore
              .collection('NWW')
              .doc('Events')
              .collection('EventsUUID')
              .doc('Data')
              .collection('DataUUID')
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
          final createTimeInMilis = message.data()['CreateTimeInMilis'];
          final creatorEmail = message.data()['CreatorEmail'];
          final description = message.data()['Description'];
          final firstRegion = message.data()['FerstRegion'];
          final secondRegion = message.data()['SecondRegion'];
          final thirdRegion = message.data()['ThirdRegion'];
          final status = message.data()['Status'];
          final statusColor = message.data()['StatusColor'];
          final eventId = message.id;
          final closedTime = message.data()['ClosedTime'];
          final eventTime = message.data()['EventTime'];
          final notificationsend = message.data()['notificationsend'];

          final messageBubble = MessageBubble(
            createTimeFrom: createTime,
            createTimeInMilisFrom: createTimeInMilis,
            creatorEmailFrom: creatorEmail,
            descriptionFrom: description,
            firstRegionFrom: firstRegion,
            secondRegionFrom: secondRegion,
            thirdRegionFrom: thirdRegion,
            statusFrom: status,
            statusColorFrom: statusColor,
            eventIdFrom: eventId,
            closedTimeFrom: closedTime,
            eventTimeFrom: eventTime,
            notificationsendFrom: notificationsend,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {@required this.createTimeFrom,
      @required this.createTimeInMilisFrom,
      @required this.creatorEmailFrom,
      @required this.descriptionFrom,
      @required this.firstRegionFrom,
      @required this.secondRegionFrom,
      @required this.statusFrom,
      @required this.statusColorFrom,
      @required this.thirdRegionFrom,
      @required this.eventIdFrom,
      @required this.closedTimeFrom,
      @required this.eventTimeFrom,
      @required this.notificationsendFrom});

  final String createTimeFrom;
  final int createTimeInMilisFrom;
  final String creatorEmailFrom;
  final String descriptionFrom;
  final String firstRegionFrom;
  final String secondRegionFrom;
  final String thirdRegionFrom;
  final String statusFrom;
  final int statusColorFrom;
  final String eventIdFrom;
  final String closedTimeFrom;
  final int eventTimeFrom;
  final bool notificationsendFrom;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: InkWell(
        onTap: () {},
        onLongPress: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardTwoLine(
              firstText: '${translator[14].en}',
              secondText: '$firstRegionFrom/$secondRegionFrom/$thirdRegionFrom',
              color: colorPicker(colornumber: firstRegionFrom),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text('Create Time: $createTimeFrom'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Divider(
                height: 2.0,
                color: colorPicker(colornumber: firstRegionFrom),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text('Created by: $creatorEmailFrom'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Divider(
                height: 2.0,
                color: colorPicker(colornumber: firstRegionFrom),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text('Description: $descriptionFrom'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Divider(
                height: 2.0,
                color: colorPicker(colornumber: firstRegionFrom),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text('Status: $statusFrom'),
            ),
          ],
        ),
      ),
    );
  }
}
