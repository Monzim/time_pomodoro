import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../controllers/time_controller.dart';
import 'timegauge_view.dart';

class TimeView extends GetView<TimeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xFFAED4F8),
                    Color(0xFFCCCBCB),
                  ],
                ),
              ),
              child: SvgPicture.asset(
                'assets/svg/sky.svg',
                semanticsLabel: 'A Sky',
                placeholderBuilder: (BuildContext context) =>
                    const Center(child: CircularProgressIndicator()),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: -20.h,
              child: Lottie.network(
                  'https://assets8.lottiefiles.com/private_files/lf30_htijkvxe.json',
                  animate: false,
                  fit: BoxFit.fitWidth,
                  width: 312.w,
                  height: 300.w
                  // height: 300,
                  ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 25.h),
                ClipOval(
                  child: TimegaugeView(
                    width: 300.w,
                  ),
                ),
                SizedBox(height: 55.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                        child: Container(
                      width: 68.w,
                      height: 68.w,
                      color: Colors.green,
                      child: Center(
                          child: Text(
                        '😃',
                        style: GoogleFonts.ubuntu(fontSize: 35.sp),
                      )),
                    )),
                    SizedBox(width: 150.w, height: 10),
                    ClipOval(
                        child: Container(
                      width: 68.w,
                      height: 68.w,
                      color: Colors.pinkAccent,
                      child: Center(
                          child: Text(
                        '🙂',
                        style: GoogleFonts.ubuntu(fontSize: 35.sp),
                      )),
                    )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
