import 'package:f_yc_utils/f_yc_utils.dart';
import 'package:flutter/material.dart';

class WidgetsLotterReButton extends StatefulWidget {
  final VoidCallback? buttonAction;
  const WidgetsLotterReButton({Key? key, this.buttonAction}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WidgetsLotterReButtonState createState() => _WidgetsLotterReButtonState();
}

class _WidgetsLotterReButtonState extends State<WidgetsLotterReButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scale;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _scale = Tween(begin: 0.95, end: 1.05).animate(_animationController);
    _animationController.reset();
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: SizedBox(
        width: Get.width / 2.0,
        height: 46,
        child: ElevatedButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red)),
            backgroundColor: MaterialStateProperty.all(const Color(0xFFFFD687)),
            foregroundColor: MaterialStateProperty.all(const Color(0xFFFE4A32)),
            side: MaterialStateProperty.all(const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 0.5), width: 3)),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          onPressed: widget.buttonAction,
          child: const Text('立即抢红包'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
