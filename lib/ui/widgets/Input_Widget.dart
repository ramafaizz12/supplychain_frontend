part of 'widgets.dart';

class InputWidget extends StatelessWidget {
  final double? fontsize;
  final TextEditingController? controller;
  final String? namainput;
  final bool readonly;
  final void Function()? onTap;
  const InputWidget(
      {super.key,
      this.fontsize,
      this.controller,
      this.namainput,
      this.onTap,
      this.readonly = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          namainput!,
          style: textpoppins.copyWith(color: blackcolor, fontSize: fontsize),
        ),
        Container(
            decoration: BoxDecoration(
                color: fontcolorgrey, borderRadius: BorderRadius.circular(12)),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onTap: onTap,
              readOnly: readonly,
              onChanged: (text) {},
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 5, left: 8),
                  border: InputBorder.none),
              controller: controller,
              style: textpoppins,
            ))
      ],
    );
  }
}
