part of 'pages.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Timeline Asset",
          style: textpoppins.copyWith(color: whitecolor),
        ),
        backgroundColor: backgroudcolor,
      ),
      body: Column(
        children: [
          SizedBox(
              width: 100,
              height: 50,
              child: TimelineTile(
                axis: TimelineAxis.horizontal,
                endChild: Text("First"),
                isFirst: true,
              )),
          SizedBox(
              width: 100,
              height: 50,
              child: TimelineTile(
                axis: TimelineAxis.horizontal,
                endChild: Text("Last"),
                isLast: true,
              ))
        ],
      ),
    );
  }
}
