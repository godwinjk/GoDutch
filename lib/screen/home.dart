import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_share/screen/contribution.dart';
import 'package:group_share/screen/contribution_card.dart';
import 'package:group_share/screen/result.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  int numOfPerson = 0;

  Home(int number) {
    this.numOfPerson = number;
  }

  @override
  _HomeState createState() => _HomeState(numOfPerson);
}

class _HomeState extends State<Home> {
  int numOfPerson = 0;
  List<Contribution> contributions;

  _HomeState(int number) {
    this.numOfPerson = number;
    this.contributions = List();
    for (int i = 0; i < number; i++) {
      Contribution c = new Contribution();
      c.hint = "Person ${i + 1}";
      contributions.add(c);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculate"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext ctxt, int index) {
            if (numOfPerson > 1 && index >= numOfPerson) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: RaisedButton(
                    onPressed: () => {calculate()},
                    child: Text(
                      'Calculate',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.blueAccent,
                    padding: EdgeInsets.all(20),
                    elevation: 20,
                  ),
                ),
              );
            }
            return ContributionCard(contributions[index]);
          },
          itemCount: numOfPerson <= 0 ? 0 : numOfPerson + 1,
        ));
  }

  void calculate() {
    double totalAmount = 0;
    contributions.forEach((element) {
      totalAmount += element.amount;
    });
    double perHead = totalAmount / numOfPerson;

    contributions.forEach((element) {
      if (element.name.isEmpty) {
        element.name = element.hint;
      }
      element.remaining = element.amount - perHead;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                Result(contributions, totalAmount)));
  }
}
