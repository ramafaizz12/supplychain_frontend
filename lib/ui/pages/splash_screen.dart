part of 'pages.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Wrapper(),
            )));
    return Scaffold(
      backgroundColor: backgroudcolor,
      body: LayoutBuilder(
          builder: (p0, p1) => Center(
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  width: p1.maxWidth * 0.5,
                  height: p1.maxHeight * 0.5,
                ),
              )),
    );
  }
}
