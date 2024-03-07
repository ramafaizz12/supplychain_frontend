part of 'widgets.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isfirst;
  final bool islast;
  final bool ispast;
  final String konfirmasi;
  const MyTimelineTile(
      {super.key,
      required this.isfirst,
      required this.islast,
      required this.konfirmasi,
      required this.ispast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isfirst,
        isLast: islast,
        beforeLineStyle:
            LineStyle(color: ispast ? bluecolor : bluecolor.withOpacity(0.3)),
        indicatorStyle: IndicatorStyle(
            width: 40,
            color: ispast ? bluecolor : bluecolor.withOpacity(0.3),
            iconStyle: IconStyle(
                iconData: Icons.done,
                color: ispast ? whitecolor : bluecolor.withOpacity(0.3))),
        endChild: EventCard(konfirmasi: konfirmasi, ispast: ispast),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String konfirmasi;
  final bool ispast;
  const EventCard({
    super.key,
    required this.konfirmasi,
    required this.ispast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: ispast ? bluecolor : bluecolor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        konfirmasi,
        style: textpoppins.copyWith(color: whitecolor),
      ),
    );
  }
}
