import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_share/screen/contribution.dart';
import 'package:group_share/screen/result_item.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';

class Result extends StatelessWidget {
  List<Contribution> contributions;
  double totalAmount;

  Result(this.contributions, this.totalAmount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ResultCard(contributions[index]);
        },
        itemCount: contributions.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("object");
            Share.share(getShareForm());
          },
          backgroundColor: Colors.blueAccent,
          child: Icon(
            Icons.share,
          )),
    );
  }

  String getShareForm() {
    StringBuffer text = StringBuffer();
    text.write('*Group Share summary*\n\n');
    text.write(
        'Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())}');
    text.write('\n\n');
    text.write('Total amount=$totalAmount\n\n');
    contributions.asMap().forEach((key, value) {
      text.write('${key + 1}.\n');
      text.write('${value.name}\n');
      text.write('Spent=${value.amount}.\n');
      text.write(
          '${value.remaining >= 0 ? 'Debit' : 'Credit'}=${value.remaining}');
      text.write('\n\n');
    });
    return text.toString();
  }
}
