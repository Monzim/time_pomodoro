import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

/*
Clock maxCount vale




 */

class TimegaugeView extends StatelessWidget {
  const TimegaugeView({
    required this.width,
    required this.maxCount,
    required this.pointerValue,
    required this.clockTittle,
  });

  final double width;
  final int maxCount;
  final double pointerValue;
  final String clockTittle;

  @override
  Widget build(BuildContext context) {
    final int _maxCount = maxCount;
    final double _pointerValue = pointerValue;
    final String _clockTittle = clockTittle;

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
                  maximum: _maxCount.toDouble(),
                  // radiusFactor: 0.85,
                  canScaleToFit: true,
                  startAngle: 0,
                  endAngle: 360,
                  interval: 5,
                  showFirstLabel: false,
                  // showLabels: true,
                  // showLastLabel: false,
                  // showTicks: true,
                  tickOffset: 25,

                  // axisLineStyle: AxisLineStyle(
                  //   color: Colors.black.withOpacity(0.2),
                  //   thickness: 0.30,
                  //   // cornerStyle: CornerStyle.bothFlat,
                  //   thicknessUnit: GaugeSizeUnit.factor,
                  // ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: _maxCount.toDouble(),
                      // cornerStyle: CornerStyle.bothFlat,
                      width: 0.25,

                      gradient: const SweepGradient(
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
                      value: _pointerValue, //! PointerValue
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
                        _clockTittle,
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
