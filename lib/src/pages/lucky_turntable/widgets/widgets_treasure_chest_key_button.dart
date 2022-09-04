import 'package:flutter/material.dart';
import 'package:f_yc_utils/f_yc_utils.dart';

class WidgetsTreasureChestKeyButton extends StatefulWidget {
  final int? keysCount;
  final VoidCallback? buttonAction;
  const WidgetsTreasureChestKeyButton(
      {Key? key, this.keysCount = 0, this.buttonAction})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WidgetsTreasureChestKeyButtonState createState() =>
      _WidgetsTreasureChestKeyButtonState();
}

class _WidgetsTreasureChestKeyButtonState
    extends State<WidgetsTreasureChestKeyButton>
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
        height: 56,
        child: ElevatedButton(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.red)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFFFD687)),
              foregroundColor:
                  MaterialStateProperty.all(const Color(0xFFE71440)),
              side: MaterialStateProperty.all(const BorderSide(
                  color: Color.fromRGBO(255, 255, 255, 0.5), width: 3)),
              shape: MaterialStateProperty.all(const StadiumBorder()),
            ),
            onPressed: widget.buttonAction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 26,
                  height: 26,
                  child: Image.asset(
                    'assets/icons/icon_key.png',
                    package: 'f_yc_pages',
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '剩余钥匙：',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFE71440),
                      ),
                    ),
                    Text(
                      widget.keysCount.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFFE71440),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
