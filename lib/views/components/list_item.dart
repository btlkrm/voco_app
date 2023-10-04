import 'package:flutter/material.dart';
class ListItem extends StatelessWidget {
  final String title;
  final String about;

  const ListItem({required this.title,required this.about,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = 0;
    return Container(
        width: screenWidth,
        height: 55,
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade200
        ),

        child:Container(
          margin: EdgeInsets.only(left: 15,),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: Colors.black54
                  )
                  ),
                  SizedBox(height: 5,),
                  Text(about,style:TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.normal,
                      color: Colors.black54
                  ))
                ],
              ),

            ],
          ),
        )
    );
  }
}