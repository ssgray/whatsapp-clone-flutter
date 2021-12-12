import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'displayPicture.dart';

class CameraScreen extends StatefulWidget {
  static const String id = '/camera';
  final List<CameraDescription> cameras;

  const CameraScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    _initializeControllerFuture = controller.initialize();
    controller.lockCaptureOrientation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 40.0,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(
            CupertinoIcons.xmark,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Row(
            children: [
              Icon(CupertinoIcons.moon_fill),
              SizedBox(
                width: 20.0,
              ),
              Icon(CupertinoIcons.bolt_slash_fill),
              SizedBox(
                width: 20.0,
              )
            ],
          )
        ],
      ),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(children: [
              Container(
                width: size,
                height: size / 0.6,
                child: CameraPreview(controller),
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        CupertinoIcons.photo,
                        color: Colors.white,
                        size: 38.0,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: CustomPaint(
                            painter: ShapePainter(),
                            child: Container(),
                          ),
                        ),
                        onTap: () async {
                          print('shit');
                          try {
                            await _initializeControllerFuture;

                            final image = await controller.takePicture();

                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DisplayPictureScreen(
                                  imagePath: image.path,
                                ),
                              ),
                            );
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          CupertinoIcons.camera_rotate,
                          color: Colors.white,
                          size: 38.0,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              )
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  var path = Path();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var innerPaint = Paint()..color = Colors.black;

    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: 35,
    ));
    canvas.drawPath(path, paint);
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 33, innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool? hitTest(Offset position) {
    // TODO: implement hitTest
    bool hit = path.contains(position);
    return hit;
  }
}
