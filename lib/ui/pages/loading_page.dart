part of 'pages.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  // AnimationController controllerr = AnimationController(vsync: TickerProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: LayoutBuilder(
        builder: (p0, p1) => Stack(
          children: [
            Container(
                width: p1.maxWidth,
                height: p1.maxHeight,
                decoration: BoxDecoration(color: backgroudcolor)),
          ],
        ),
      ),
    );
  }
}
