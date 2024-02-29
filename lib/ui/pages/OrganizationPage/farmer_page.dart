part of '../pages.dart';

Widget userFarmer() {
  TextEditingController id = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController lamapanen = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController tanggalpanen = TextEditingController();
  return LayoutBuilder(
    builder: (context, p1) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Lengkapi Data Dibawah\n untuk Membuat Asset",
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
        InputWidget(
          namainput: "Nama Lengkap",
          fontsize: p1.maxHeight * 0.02,
          controller: nama,
        ),
        InputWidget(
          namainput: "Alamat",
          fontsize: p1.maxHeight * 0.02,
          controller: alamat,
        ),
        InputWidget(
          namainput: "Lama Panen",
          fontsize: p1.maxHeight * 0.02,
          controller: lamapanen,
        ),
        InputWidget(
          namainput: "No HP",
          fontsize: p1.maxHeight * 0.02,
          controller: nohp,
        ),
        InputWidget(
          namainput: "Tanggal Panen",
          fontsize: p1.maxHeight * 0.02,
          controller: tanggalpanen,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                initialDatePickerMode: DatePickerMode.day,
                firstDate: DateTime(2000),
                lastDate: DateTime(2025));
            tanggalpanen.text = pickedDate!.toString();
          },
        ),
        SizedBox(
          height: p1.maxHeight * 0.03,
        ),
        Center(
          child: ButtonUtama(
            width: p1.maxWidth * 0.4,
            height: p1.maxHeight * 0.06,
            namabutton: "Buat Asset",
            voidcallback: () {
              context.read<SupplychainBloc>().add(CreateAsset(
                  id: id.text,
                  namapetani: nama.text,
                  alamat: alamat.text,
                  nohp: nohp.text,
                  lamapanen: lamapanen.text,
                  tanggalpanen: tanggalpanen.text));
            },
          ),
        )
      ],
    ),
  );
}
