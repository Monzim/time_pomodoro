import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:time_pomodoro/app/modules/home/controllers/home_controller.dart';

class TimegaugeView extends GetView<HomeController> {
  const TimegaugeView({required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipOval(
            child: Container(
                height: width * .85,
                width: width * .85,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: <Color>[Color(0xFFECE9E6), Colors.white],
                ))),
          ),
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                  radiusFactor: 0.85,
                  canScaleToFit: true,
                  startAngle: 0,
                  endAngle: 360,
                  maximum: 25,
                  interval: 2,
                  showFirstLabel: false,
                  showLabels: false,
                  showTicks: false,
                  // axisLineStyle: AxisLineStyle(
                  //   color: Colors.black.withOpacity(0.2),
                  //   thickness: 0.30,
                  //   // cornerStyle: CornerStyle.bothFlat,
                  //   thicknessUnit: GaugeSizeUnit.factor,
                  // ),
                  pointers: <GaugePointer>[
                    const RangePointer(
                      value: 25,
                      // cornerStyle: CornerStyle.bothFlat,
                      width: 0.25,

                      gradient: SweepGradient(
                        center: FractionalOffset.center,
                        colors: <Color>[
                          Color(0xFFE96A6A),
                          Color(0xFFE9ADB3),
                          Color(0xFFF7C1C1),
                          Color(0xFFFFCDD2),
                          Color(0xFFE97171),
                        ],
                        stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
                      ),
                      sizeUnit: GaugeSizeUnit.factor,
                    ),
                    MarkerPointer(
                      markerOffset: width * 0.053,
                      //TODO: Add Value Function Here
                      value: 0,
                      enableDragging: true,
                      markerHeight: width * .170,
                      markerWidth: width * .170,
                      overlayColor: Colors.black,
                      markerType: MarkerType.circle,
                      elevation: 5,
                      color: const Color(0xFFC3E0FA),
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor: width * 0.00025,
                      angle: 90,
                      widget: Text(
                        '16:20:22',
                        style: GoogleFonts.ubuntu(
                            fontSize: width * 0.120.sp,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4.w),
                                blurRadius: 15,
                              ),
                            ]),
                      ),
                    )
                  ])
            ],
          ),
        ],
      ),
    );
  }
}
