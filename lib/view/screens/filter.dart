import 'package:exam/view/component/filterelement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(134, 31, 11, 3),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Filter'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {Navigator.pop(context);},
               icon:
              Icon(
                 Icons.fullscreen_exit,
                 color: Colors.white,
               )
              )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Year',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp,color: Colors.white),
            ),SizedBox(height: 20.h,),
            Container(width: 80.w,height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.black),
              child: Center(
                child: Text(textAlign: TextAlign.center,
                  "Enter year",
                  style: TextStyle(color: Color.fromARGB(255, 141, 135, 117)),
                ),
              ),
            ),SizedBox(height: 20.h,),
            Text(
              'genres',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp,color: Colors.white),
            ),SizedBox(height: 20.h,),
            Expanded(
              child: GridView.count(childAspectRatio: 9/16,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(8
                , (index) => FilterElement()),
              ),
            )
            // CheckboxListTile(value: false, onChanged: (value) {
              
            // },)
            
          ],
        ),
      ),
    );
  }
}
