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
                  Expanded(
                    child: Container(
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
                                Text("${state.data!.nama_petani}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Alamat Petani: ", style: textpoppins),
                                Text("${state.data!.alamat}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Lama Panen: ", style: textpoppins),
                                Text("${state.data!.lama_panen}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Lama Pengeringan: ", style: textpoppins),
                                Text("${state.data!.lama_pengeringan}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Lama Penyimpanan: ", style: textpoppins),
                                Text("${state.data!.lama_penyimpanan}",
                                    style: textpoppins)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Tanggal Panen: ", style: textpoppins),
                                Expanded(
                                  child: Text("${state.data!.tanggal_panen}",
                                      style: textpoppins),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Kadar Air: ", style: textpoppins),
                                Expanded(
                                  child: Text("${state.data!.kadar_air}",
                                      style: textpoppins),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Derajat Sosoh: ", style: textpoppins),
                                Expanded(
                                  child: Text("${state.data!.derajat_sosoh}",
                                      style: textpoppins),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Benda Lain: ", style: textpoppins),
                                Expanded(
                                  child: Text("${state.data!.benda_lain}",
                                      style: textpoppins),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Beras Kepala: ", style: textpoppins),
                                Expanded(
                                  child: Text("${state.data!.beras_kepala}",
                                      style: textpoppins),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Butir Gabah: ", style: textpoppins),
                                Expanded(
                                  child: Text("${state.data!.butir_gabah}",
                                      style: textpoppins),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Butir Patah: ", style: textpoppins),
                                Expanded(
                                  child: Text("${state.data!.butir_patah}",
                                      style: textpoppins),
                                )
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
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Check ID",
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
                      namabutton: "Check ID",
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
