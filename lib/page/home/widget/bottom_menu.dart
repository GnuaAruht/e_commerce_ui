part of '../home_page.dart';

class _BottomMenu extends StatelessWidget {
  const _BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding * 2.0),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = Size(
                constraints.maxWidth,
                constraints.maxHeight,
              );
              final gap = (size.height / 2) / 2;
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: size,
                    painter: ArchPainter(),
                  ),
                  Positioned(
                    left: gap,
                    top: gap / 2,
                    child: Container(
                      width: 56.0,
                      height: 56.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset('images/icons/logo_adidas.png'),
                    ),
                  ),
                  Positioned(
                    right: gap,
                    top: gap / 2,
                    child: Container(
                      width: 56.0,
                      height: 56.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset('images/icons/logo_puma.png'),
                    ),
                  ),
                  Positioned(
                    top: -18.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      width: 78.0,
                      height: 78.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Image.asset('images/icons/logo_nike.png'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class ArchPainter extends CustomPainter {
  final painter = Paint()
    ..color = Colors.black38
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.8;

  @override
  void paint(Canvas canvas, Size size) {
    final gap = (size.height / 2) / 2;
    final path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, gap, size.width, size.height);
    canvas.drawPath(path, painter);

    path.moveTo(0, size.height - gap);
    path.quadraticBezierTo(
      size.width / 2,
      0.0,
      size.width,
      size.height - gap,
    );
    canvas.drawPath(path, painter);

    path.moveTo(0, size.height - gap * 2);
    path.quadraticBezierTo(
      size.width / 2,
      -gap * 1.2,
      size.width,
      size.height - gap * 2,
    );
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
