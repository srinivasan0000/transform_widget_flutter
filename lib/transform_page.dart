import 'package:flutter/material.dart';

class TransformPage extends StatefulWidget {
  const TransformPage({super.key});

  @override
  State<TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
  double rotateValue = 0;
  double scaleValue = 1;
  double translateX = 0;
  double translateY = 0;
  double skewValue = 0;
  double rotateX = 0;
  double perspectiveValue = 0.1;
  double rotatePerspective = 0; // New rotation value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transform'),
        ),
        body: SingleChildScrollView(
          child: ColoredBox(
            color: const Color.fromARGB(142, 209, 230, 248),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Transform Rotate",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Transform.rotate(angle: rotateValue, child: const FlutterLogo(size: 150)),
                          Text(
                            "Value: ${rotateValue.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          Slider(
                            min: 0,
                            max: 10,
                            value: rotateValue,
                            onChanged: (value) {
                              setState(() {
                                rotateValue = value;
                              });
                            },
                          ),
                        ],
                      )),
                  SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Transform Translate",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                                Transform.translate(offset: Offset(translateX, translateY), child: const FlutterLogo(size: 150)),
                                Text(
                                  "X: ${translateX.toStringAsFixed(1)},  Y: ${translateY.toStringAsFixed(1)} ",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Slider(
                                  min: -50,
                                  max: 50,
                                  value: translateX,
                                  onChanged: (value) {
                                    setState(() {
                                      translateX = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Slider(
                                min: -30,
                                max: 30,
                                value: translateY,
                                onChanged: (value) {
                                  setState(() {
                                    translateY = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Transform Scale",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Transform.scale(scale: scaleValue, child: const FlutterLogo(size: 100)),
                        Text(
                          "Value: ${rotateValue.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Slider(
                          min: 0.5,
                          max: 1.5,
                          value: scaleValue,
                          onChanged: (value) {
                            setState(() {
                              scaleValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Transform Rotate 3D",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Transform(
                          transform: Matrix4.rotationY(rotateX),
                          alignment: Alignment.center,
                          child: const FlutterLogo(
                            size: 130,
                            style: FlutterLogoStyle.stacked,
                          ),
                        ),
                        Slider(
                          value: rotateX,
                          max: 6.28319 * 2,
                          min: 0,
                          onChanged: (value) {
                            setState(() {
                              rotateX = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Transform Skew",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Transform(
                          transform: Matrix4.skewX(skewValue),
                          child: const FlutterLogo(size: 100),
                        ),
                        Slider(
                          value: skewValue,
                          max: 10,
                          min: 0,
                          onChanged: (value) {
                            setState(() {
                              skewValue = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Transform Perspective",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, perspectiveValue)
                            ..rotateX(rotatePerspective),
                          child: const FlutterLogo(size: 100),
                        ),
                        Slider(
                          value: rotatePerspective,
                          min: 0,
                          max: 6.28319 * 2,
                          onChanged: (value) {
                            setState(() {
                              rotatePerspective = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
