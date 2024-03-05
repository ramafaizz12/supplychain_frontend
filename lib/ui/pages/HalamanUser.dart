part of 'pages.dart';

Widget checkasset() {
  TextEditingController id = TextEditingController();
  return LayoutBuilder(
    builder: (context, p1) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Mohon Untuk Check ID",
            style: textpoppins.copyWith(
                fontWeight: FontWeight.bold, fontSize: p1.maxWidth * 0.055),
          ),
        ),
        SizedBox(
          height: p1.maxHeight * 0.04,
        ),
        InputWidget(
          namainput: "ID",
          fontsize: p1.maxHeight * 0.02,
          controller: id,
        ),
        SizedBox(
          height: p1.maxHeight * 0.03,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonUtama(
                width: p1.maxWidth * 0.4,
                height: p1.maxHeight * 0.06,
                namabutton: "Check Id",
                voidcallback: () {
                  context
                      .read<SupplychainBloc>()
                      .add(GetDataBeras(id: id.text));
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget konfirmasset() {
  TextEditingController id = TextEditingController();
  return LayoutBuilder(
    builder: (context, p1) => Padding(
      padding: EdgeInsets.only(
          left: p1.maxWidth * 0.03,
          right: p1.maxWidth * 0.03,
          top: p1.maxHeight * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Mohon Untuk Konfirmasi ID",
              style: textpoppins.copyWith(
                  fontWeight: FontWeight.bold, fontSize: p1.maxWidth * 0.055),
            ),
          ),
          SizedBox(
            height: p1.maxHeight * 0.04,
          ),
          InputWidget(
            namainput: "ID",
            fontsize: p1.maxHeight * 0.02,
            controller: id,
          ),
          SizedBox(
            height: p1.maxHeight * 0.03,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonUtama(
                  width: p1.maxWidth * 0.4,
                  height: p1.maxHeight * 0.06,
                  namabutton: "Konfirmasi Id",
                  voidcallback: () {
                    context.read<SupplychainBloc>().add(LockAsset(id: id.text));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
