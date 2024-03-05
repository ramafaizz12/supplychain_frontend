part of '../pages.dart';

Widget userConsumer() {
  TextEditingController id = TextEditingController();
  return LayoutBuilder(
    builder: (context, p1) => BlocBuilder<SupplychainBloc, SupplychainState>(
      builder: (context, state) {
        return state is DataBerasLoaded
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: p1.maxHeight * 0.02,
                  ),
                  Container(
                    width: p1.maxWidth * 0.94,
                    height: p1.maxHeight * 0.4,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: const Offset(2, 4))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: whitecolor),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: p1.maxWidth * 0.05,
                        top: p1.maxHeight * 0.017,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${state.data!.ID}",
                            style: textpoppins.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: p1.maxWidth * 0.05),
                          ),
                          Row(
                            children: [
                              Text(
                                "Nama Petani: ",
                                style: textpoppins,
                              ),
                              Text("${state.data!.namapetani}",
                                  style: textpoppins)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Alamat Petani: ", style: textpoppins),
                              Text("${state.data!.alamatpetani}",
                                  style: textpoppins)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Jenis Beras: ", style: textpoppins),
                              Text("${state.data!.jenisberas}",
                                  style: textpoppins)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Alamat Perusahaan: ", style: textpoppins),
                              Text("${state.data!.alamatperusahaan}",
                                  style: textpoppins)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Tanggal Diolah: ", style: textpoppins),
                              Text("${state.data!.tanggaldiolah}",
                                  style: textpoppins)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Tanggal Panen: ", style: textpoppins),
                              Text("${state.data!.tanggalpanen}",
                                  style: textpoppins)
                            ],
                          ),
                          Row(
                            children: [
                              Text("No_Hp: ", style: textpoppins),
                              Text("${state.data!.no_hp}", style: textpoppins)
                            ],
                          ),
                          Row(
                            children: [
                              Text("TimeStamp: ", style: textpoppins),
                              Text("${state.data!.timestamp}",
                                  style: textpoppins)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Mohon Untuk Konfirmasi ID",
                      style: textpoppins.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: p1.maxWidth * 0.055),
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
                    child: ButtonUtama(
                      width: p1.maxWidth * 0.4,
                      height: p1.maxHeight * 0.06,
                      namabutton: "Konfirmasi ID",
                      voidcallback: () {
                        context
                            .read<SupplychainBloc>()
                            .add(GetDataBeras(id: id.text));
                      },
                    ),
                  )
                ],
              );
      },
    ),
  );
}
