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
      stream: _firestore
          .collection('NWW')
          .doc('Events')
          .collection('EventsUUID')
          .doc('Data')
          .collection('DataUUID')
          .where('FerstRegion', isEqualTo: '$passedId')
          // .where('StatusForDisplay', isEqualTo: 'InProgress')
      // .limit(1)
      // .orderBy('CreateTime')
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
            padding:
            EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
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
//     if (statusFrom == 'Closed') {
//       return Card(
//         // shadowColor: colorPicker(colornumber: firstRegionFrom),
//         //TODO tu zczytywac on tap ?
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(20.0),
//           ),
//         ),
//         color: colorPicker(colornumber: firstRegionFrom),
//         margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
//         child: GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           onTap: () {
//             // print('Taped: $eventIdFrom');
// //          Navigator.pushNamed(context, MaterialPageRoute(builder: (context)));
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => DetailPage(
//                           passedId: '$eventIdFrom',
//                         )));
// //          navigateToDetailPage(eventIdFrom);
//             //done open "DetailPage" passing eventIdFrom and display all detail
//           },
//           onLongPress: () {
//             print('eventIdFrom: ---------->>>>>>>$eventIdFrom');
//             createDeleteEventDialog(context, eventIdFrom);
//           },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomCardTwoLine(
//                 firstText: 'Create Time',
//                 secondText: createTimeFrom,
//                 color: colorPicker(colornumber: firstRegionFrom),
//               ),
//               CustomCardTwoLine(
//                 firstText: 'Created by',
//                 secondText: creatorEmailFrom,
//                 color: colorPicker(colornumber: firstRegionFrom),
//               ),
//               CustomCardTwoLine(
//                 firstText: 'Description',
//                 secondText: descriptionFrom,
//                 color: colorPicker(colornumber: firstRegionFrom),
//               ),
//               CustomCardTwoLine(
//                 firstText: 'Area',
//                 secondText:
//                     '$firstRegionFrom/$secondRegionFrom/$thirdRegionFrom',
//                 color: colorPicker(colornumber: firstRegionFrom),
//               ),
//               CustomCardTwoLine(
//                 firstText: 'Status',
//                 secondText: statusFrom,
//                 color: colorPicker(colornumber: firstRegionFrom),
//               ),
//               CustomCardTwoLine(
//                 firstText: 'Closed',
//                 secondText: closedTimeFrom,
//                 color: colorPicker(colornumber: firstRegionFrom),
//               ),
//               CustomCardTwoLine(
//                 firstText: 'EventTimeInSec',
//                 secondText: eventTimeFrom,
//                 color: colorPicker(colornumber: firstRegionFrom),
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
    print('eventIdFrom: ---------->>>>>>>$eventIdFrom');

    // checktime(
    //     eventId: eventIdFrom,
    //     notificationsend: notificationsendFrom,
    //     description: descriptionFrom,
    //     time: createTimeInMilisFrom,
    //     firstAreaSelected: firstRegionFrom,
    //     secondAreaSelected: secondRegionFrom,
    //     thirdAreaSelected: thirdRegionFrom);
    return Card(
      //TODO tu zczytywac on tap ?
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      // color: colorPicker(colornumber: firstRegionFrom),
      // color: colorPicker(colornumber: firstRegionFrom),
      // shadowColor: colorPicker(colornumber: firstRegionFrom),
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: InkWell(
        onTap: () {
          // print('Taped: $eventIdFrom');
//          Navigator.pushNamed(context, MaterialPageRoute(builder: (context)));
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => DetailPage(
//                     passedId: '$eventIdFrom',
//                   )));
//          navigateToDetailPage(eventIdFrom);
          //done open "DetailPage" passing eventIdFrom and display all detail
        },
        onLongPress: () {
          // createDeleteEventDialog(context, eventIdFrom);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardTwoLine(
              firstText:'${translator[14].en}',
              // 'Area',
              secondText:
              '$firstRegionFrom/$secondRegionFrom/$thirdRegionFrom',
              color: colorPicker(colornumber: firstRegionFrom),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                'Create Time: $createTimeFrom'
                // globals.globalLanguage ?
                // "${translator[15].pl} $createTimeFrom" : '${translator[15].en} $createTimeFrom',
              ),
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
              child: Text(
                'Created by: $creatorEmailFrom'
                // globals.globalLanguage ?
                // "${translator[16].pl} $creatorEmailFrom" : '${translator[16].en} $creatorEmailFrom',
              ),
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
              child: Text(
                'Description: $descriptionFrom'
                // globals.globalLanguage ?
                // "${translator[17].pl} $descriptionFrom" : '${translator[17].en} $descriptionFrom',
              ),
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
              child: Text(
                'Status: $statusFrom'
                // globals.globalLanguage ?
                // "${translator[18].pl} $statusFrom" : '${translator[18].en} $statusFrom',
              ),
            ),
            // CustomCardTwoLine(
            //   firstText: 'Create Time',
            //   secondText: createTimeFrom,
            // ),
            // CustomCardTwoLine(
            //   firstText: 'Created by',
            //   secondText: creatorEmailFrom,
            // ),
            // CustomCardTwoLine(
            //   firstText: 'Description',
            //   secondText: descriptionFrom,
            // ),
            // CustomCardTwoLine(
            //   firstText: 'Status',
            //   secondText: statusFrom,
            // ),
          ],
        ),
      ),
    );
    // }
  }


// colorPicker({String colornumber}){
//   if (colornumber == 'Proszki') {
//     return Color(0xFFff4646);
//   }
//   if (colornumber == 'Process') {
//     return Colors.lightBlue[400];
//   }
//   if (colornumber == 'Filing') {
//     return Color(4294278935);
//   }
//   if (colornumber == 'PKG_MPG') {
//     return Color(0xFF83a95c);
//   }
//   if (colornumber == 'Utilit') {
//     return Colors.brown[400];
//   } else {
//     return Colors.white24;
//   }
// }
}