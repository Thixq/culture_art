import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown(
      {required this.onPressed,
      required this.customDropDownItemList,
      required this.hintText,
      this.customDropDownDecoration,
      this.customdropDownItemDecoration,
      Key? key})
      : super(key: key);
  final String hintText;
  final CustomDropDownDecoration? customDropDownDecoration;
  final CustomDropDownItemDecoration? customdropDownItemDecoration;
  final void Function(int? currentIndex, int? id, String? value) onPressed;
  final List<CustomDropDownItem> customDropDownItemList;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isDropDownOpen = false;
  bool choosed = false;
  late String choosedText;
  late GlobalKey actionKey;
  late Size dropDownSize;
  late Offset offset;
  late OverlayEntry floatingDropDown;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    actionKey = LabeledGlobalKey(widget.hintText);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void findDropDown() {
    RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    dropDownSize = renderBox.size;
    offset = renderBox.localToGlobal(Offset.zero);
  }

  OverlayEntry _createFloatingDropDown() {
    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                _toggleDropdown();
              },
              child: Container(
                height: 100.h,
                width: 100.w,
              ),
            ),
            Positioned(
              left: offset.dx,
              width: dropDownSize.width,
              top: offset.dy + dropDownSize.height + 5,
              child: Material(
                color: Colors.transparent,
                child: SizeTransition(
                  sizeFactor: _expandAnimation,
                  child: CustomDropDownBG(
                      customDropDownItemDecoration:
                          widget.customdropDownItemDecoration,
                      customDropDownItemList: widget.customDropDownItemList,
                      onPressed: (currentIndex, id, value) {
                        _toggleDropdown();
                        choosed = true;

                        setState(() {
                          choosedText = value.toString();
                        });
                        widget.onPressed(currentIndex, id, value);
                      },
                      itemSize: dropDownSize),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _toggleDropdown() async {
    isDropDownOpen = !isDropDownOpen;

    if (isDropDownOpen) {
      _animationController.forward();
      findDropDown();
      floatingDropDown = _createFloatingDropDown();
      Overlay.of(context)!.insert(floatingDropDown);
    } else {
      await _animationController.reverse();
      floatingDropDown.remove();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        _toggleDropdown();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: widget.customDropDownDecoration == null
              ? BorderRadius.circular(10)
              : (widget.customDropDownDecoration!.borderRadius ??
                  BorderRadius.circular(10)),
          color: widget.customDropDownDecoration == null
              ? Colors.blueAccent
              : (widget.customDropDownDecoration!.color ?? Colors.blueAccent),
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                choosed ? choosedText : widget.hintText,
                overflow: TextOverflow.ellipsis,
                style: widget.customDropDownDecoration == null
                    ? Theme.of(context).textTheme.titleMedium
                    : (widget.customDropDownDecoration?.textStyle ??
                        Theme.of(context).textTheme.titleMedium),
              ),
            ),
            AnimatedIcon(
                icon: AnimatedIcons.menu_close, progress: _animationController),
          ],
        ),
      ),
    );
  }
}

class CustomDropDownBG extends StatelessWidget {
  const CustomDropDownBG(
      {required this.customDropDownItemList,
      required this.onPressed,
      required this.itemSize,
      this.customDropDownItemDecoration,
      Key? key})
      : super(key: key);
  final Size itemSize;
  final List<CustomDropDownItem> customDropDownItemList;
  final CustomDropDownItemDecoration? customDropDownItemDecoration;
  final void Function(int? currentIndex, int? id, String? value) onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment(-.85, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 10,
              width: 15,
              decoration: BoxDecoration(
                color: customDropDownItemDecoration == null
                    ? Colors.blue.shade200
                    : (customDropDownItemDecoration?.color ??
                        Colors.blue.shade200),
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: LimitedBox(
            maxHeight: 7 * itemSize.height,
            child: Container(
              height: customDropDownItemList.length > 0
                  ? customDropDownItemList.length * itemSize.height
                  : 1 * itemSize.height,
              width: itemSize.width,
              decoration: BoxDecoration(
                color: customDropDownItemDecoration == null
                    ? Colors.blue.shade200
                    : (customDropDownItemDecoration?.color ??
                        Colors.blue.shade200),
                borderRadius: customDropDownItemDecoration == null
                    ? BorderRadius.circular(10)
                    : (customDropDownItemDecoration?.borderRadius ??
                        BorderRadius.circular(10)),
              ),
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: customDropDownItemList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      onPressed(index, customDropDownItemList[index].id,
                          customDropDownItemList[index].title);
                    },
                    child: customDropDownItemList[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDropDownItem extends StatelessWidget {
  const CustomDropDownItem({required this.title, required this.id, Key? key})
      : super(key: key);
  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!,
      ),
    );
  }
}

class CustomDropDownDecoration {
  final Color? color;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;

  CustomDropDownDecoration({this.color, this.textStyle, this.borderRadius});
}

class CustomDropDownItemDecoration {
  final Color? color;
  final BorderRadius? borderRadius;

  CustomDropDownItemDecoration({this.color, this.borderRadius});
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
