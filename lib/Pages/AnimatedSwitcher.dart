import 'package:flutter/material.dart';

class MyAnimatedSwithcer extends StatefulWidget {
  @override
  _MyAnimatedSwithcerState createState() => _MyAnimatedSwithcerState();
}

class _MyAnimatedSwithcerState extends State<MyAnimatedSwithcer>
    with SingleTickerProviderStateMixin {
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      AnimatedPositioned(
        duration: Duration(microseconds: 600),
        left: opened
            ? MediaQuery.of(context).size.width / 2 - 40.0
            : MediaQuery.of(context).size.width / 2 - 170.0,
        top: MediaQuery.of(context).size.height / 2 - 40.0,
        child: _buildOption(
            Icon(
              Icons.bike_scooter,
              color: Colors.black,
            ),
            Colors.pink),
      ),
      AnimatedPositioned(
        duration: Duration(microseconds: 600),
        left: opened
            ? MediaQuery.of(context).size.width / 2 - 40.0
            : MediaQuery.of(context).size.width / 2 + 80.0,
        top: MediaQuery.of(context).size.height / 2 - 40.0,
        child: _buildOption(
            Icon(
              Icons.local_shipping,
              color: Colors.black,
            ),
            Colors.orange),
      ),
      AnimatedPositioned(
        duration: Duration(microseconds: 600),
        top: opened
            ? MediaQuery.of(context).size.height / 2 - 40.0
            : MediaQuery.of(context).size.height / 2 - 170.0,
        left: MediaQuery.of(context).size.width / 2 - 43.0,
        child: _buildOption(
            Icon(
              Icons.golf_course,
              color: Colors.black,
            ),
            Colors.yellow),
      ),
      AnimatedPositioned(
        duration: Duration(microseconds: 600),
        top: opened
            ? MediaQuery.of(context).size.height / 2 - 40.0
            : MediaQuery.of(context).size.height / 2 + 90.0,
        left: MediaQuery.of(context).size.width / 2 - 43.0,
        child: _buildOption(
            Icon(
              Icons.integration_instructions,
              color: Colors.black,
            ),
            Colors.green),
      ),
      AnimatedPositioned(
        duration: Duration(microseconds: 600),
        top: opened
            ? MediaQuery.of(context).size.height / 2 - 40.0
            : MediaQuery.of(context).size.height / 2 + 55.0,
        left: opened
            ? MediaQuery.of(context).size.width / 2 - 40.0
            : MediaQuery.of(context).size.width / 2 + 50.0,
        child: _buildOption(
            Icon(
              Icons.widgets,
              color: Colors.black,
            ),
            Colors.brown[400]),
      ),
      AnimatedPositioned(
        duration: Duration(microseconds: 600),
        top: opened
            ? MediaQuery.of(context).size.height / 2 - 40.0
            : MediaQuery.of(context).size.height / 2 - 135.0,
        left: opened
            ? MediaQuery.of(context).size.width / 2 - 40.0
            : MediaQuery.of(context).size.width / 2 - 135.0,
        child: _buildOption(
            Icon(
              Icons.directions_bike,
              color: Colors.black,
            ),
            Colors.blue[400]),
      ),
      AnimatedPositioned(
        duration: Duration(microseconds: 600),
        top: opened
            ? MediaQuery.of(context).size.height / 2 - 40.0
            : MediaQuery.of(context).size.height / 2 - 135.0,
        left: opened
            ? MediaQuery.of(context).size.width / 2 - 40.0
            : MediaQuery.of(context).size.width / 2 + 50.0,
        child: _buildOption(
            Icon(
              Icons.hearing,
              color: Colors.black,
            ),
            Colors.teal[400]),
      ),
      AnimatedPositioned(
        duration:
            Duration(microseconds: 600), // 600 milis for going out from center
        top: opened
            ? MediaQuery.of(context).size.height / 2 - 40.0
            : MediaQuery.of(context).size.height / 2 + 55.0,
        left: opened
            ? MediaQuery.of(context).size.width / 2 - 40.0
            : MediaQuery.of(context).size.width / 2 - 135.0,
        child: _buildOption(
            Icon(
              Icons.bar_chart,
              color: Colors.black,
            ),
            Colors.teal[400]),
      ),
      Align(
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: Duration(
              milliseconds:
                  400), // 400 milisec for changing home to close bnutton
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: opened
              ? InkWell(
                  key: UniqueKey(),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      opened = false;
                    });
                  },
                )
              : InkWell(
                  key: UniqueKey(),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45.0),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      opened = true;
                    });
                  },
                ),
        ),
      )
    ]));
  }

  _buildOption(Icon icon, Color color) {
    return AnimatedSwitcher(
      duration:
          Duration(milliseconds: 700), // this 700 milisec to rotate the icon
      transitionBuilder: (Widget child, Animation<double> animation) {
        return RotationTransition(child: child, turns: animation);
      },
      child: InkWell(
        key: UniqueKey(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.0),
              color: color,
            ),
            child: Center(child: icon),
          ),
        ),
        onTap: () {
          setState(() {
            opened = false;
          });
        },
      ),
    );
  }
}
