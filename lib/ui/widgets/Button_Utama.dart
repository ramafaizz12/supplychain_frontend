part of 'widgets.dart';

class ButtonUtama extends StatelessWidget {
  final double? width;
  final double? height;
  final String? namabutton;
  Color? color;

  final VoidCallback? voidcallback;

  ButtonUtama({
    super.key,
    this.width,
    this.height,
    this.namabutton,
    this.voidcallback,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: whitecolor,
          border: Border.all(color: backgroudcolor, width: 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(2, 4))
          ]),
      child: TextButton(
          onPressed: voidcallback,
          child: LayoutBuilder(
            builder: (p0, p1) => Text(
              '$namabutton',
              style: textpoppins.copyWith(
                  color: blackcolor,
                  fontSize: p1.maxHeight * 0.75,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
