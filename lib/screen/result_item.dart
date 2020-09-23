import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:group_share/screen/contribution.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultCard extends StatelessWidget {
  Contribution contribution;
  TextEditingController upiIdController = new TextEditingController();

  ResultCard(this.contribution);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${contribution.name}',
              style: TextStyle(fontSize: 25, color: Colors.blueAccent),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Spent: ${contribution.amount}',
              style: TextStyle(fontSize: 15, color: Colors.green),
            ),
            Text(
              '${contribution.remaining >= 0 ? 'Debit' : 'Credit'}: ${contribution.remaining}',
              style: TextStyle(
                  fontSize: 30,
                  color:
                      contribution.remaining >= 0 ? Colors.red : Colors.green),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.payment),
                  color: Colors.black54,
                  iconSize: 35,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text('Type UPI id'),
                              content: Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                  TextField(
                                    controller: upiIdController,
                                    cursorColor: Colors.blue[800],
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 30),
                                    decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.all(20),
                                        hintStyle: TextStyle(
                                          color: Colors.blue[300],
                                        ),
                                        hintText: 'abc@okhdfcbank'),
                                  ),
                                  RaisedButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true).pop();
                                      String upiUrl =
                                          'upi://pay?pa=${upiIdController.text}&tn=Cash idu, pever varatte!!&cu=INR';
                                      launchURL(upiUrl);
                                    },
                                  )
                                ]),
                              ),
                            ));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
