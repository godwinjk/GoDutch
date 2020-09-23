import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_share/screen/contribution.dart';

class ContributionCard extends StatelessWidget {
  Contribution contribution;

  ContributionCard(Contribution contribution) {
    this.contribution = contribution;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (text) => {contribution.name = text},
              cursorColor: Colors.blue[800],
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Colors.blueAccent, fontSize: 30),
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                  hintStyle: TextStyle(color: Colors.blue[300], fontSize: 30),
                  hintText: contribution.hint),
            ),
            TextFormField(
              initialValue: '0',
              onChanged: (text) => {contribution.amount = double.parse(text)},
              cursorColor: Colors.blue[800],
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Colors.blueAccent, fontSize: 30),
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                  hintStyle: TextStyle(color: Colors.blue[300], fontSize: 30),
                  hintText: 'Enter the amount'),
            )
          ],
        ),
      ),
    );
  }
}
