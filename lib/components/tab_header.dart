import 'package:flutter/material.dart';

class TabHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;

  const TabHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _TabHeaderState createState() => _TabHeaderState();
}

class _TabHeaderState extends State<TabHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(top: 50),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          // image: DecorationImage(
          // image: AssetImage("assets/images/virus.png"),
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return InfoScreen();
            //         },
            //       ),
            //     );
            //   },
            //   // child: SvgPicture.asset("assets/icons/menu.svg"),
            // ),
            SizedBox(height: 0),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    // left: 10,
                    top: 0,
                    left: 150,
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        "lib/assets/images/chart.png",
                        width: 150,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    // left: 10,
                    left: 0,
                    child: Image.asset(
                      widget.image,
                      width: 200,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 170,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        "${widget.textTop}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "${widget.textBottom}",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
