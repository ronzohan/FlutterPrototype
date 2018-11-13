import 'package:flutter/material.dart';

class RewardsItem extends StatelessWidget {
  String name;
  String description;
  String imageURL;
  int points;

  RewardsItem({this.name, this.description, this.imageURL, this.points});

  @override
  Widget build(BuildContext context) {
    final placeholderImageName = 'assets/images/ic_placeholder.png';

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Color(0xFFE5E5EA),
              ),
              child: Image.network(this.imageURL, fit: BoxFit.cover,),
            )
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            this.name,
            maxLines: 2,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 13.0,
              color: Color(0xFF212121)
            ),  
          ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            "${this.points} Point" + "${this.points > 1 ? "s" : "" }",
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontSize: 13.0,
              color: Color(0xFF646D7C)
            )
          )
        ],
      )
    );
  }
}