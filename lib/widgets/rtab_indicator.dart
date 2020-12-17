import 'package:flutter/widgets.dart';

enum RTabIndicatorSize {
  tiny,
  normal,
  full,
}

class RTabIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final RTabIndicatorSize indicatorSize;

  const RTabIndicator(
      {@required this.indicatorHeight,
      @required this.indicatorColor,
      @required this.indicatorSize});

  @override
  _RTabIndicator createBoxPainter([VoidCallback onChanged]) {
    return new _RTabIndicator(this, onChanged);
  }
}

class _RTabIndicator extends BoxPainter {
  final RTabIndicator decoration;

  _RTabIndicator(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    Rect rect;
    if (decoration.indicatorSize == RTabIndicatorSize.full) {
      rect = Offset(offset.dx,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(configuration.size.width, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == RTabIndicatorSize.normal) {
      rect = Offset(offset.dx + 24,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(configuration.size.width - 48, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == RTabIndicatorSize.tiny) {
      rect = Offset(offset.dx + configuration.size.width / 2 - 16,
              (configuration.size.height - decoration.indicatorHeight ?? 3)) &
          Size(32, decoration.indicatorHeight ?? 3);
    }

    final Paint paint = Paint();
    paint.color = decoration.indicatorColor ?? Color(0xff1967d2);
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          rect,
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
        paint);
  }
}
