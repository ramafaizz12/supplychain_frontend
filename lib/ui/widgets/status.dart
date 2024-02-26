part of 'widgets.dart';

Widget onstatus() {
  return BlocListener<SupplychainBloc, SupplychainState>(
      listener: (context, state) {
        if (state is DataBerasSukses) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Data Berhasil Disimpan',
              onConfirmBtnTap: () {
                Navigator.pop(context);
              },
              confirmBtnColor: bluecolor,
              confirmBtnTextStyle: textpoppins.copyWith(color: whitecolor));
        }
        if (state is DataBerasLoading) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.loading,
              text: "Mohon Tunggu",
              autoCloseDuration: const Duration(seconds: 2),
              onConfirmBtnTap: () {
                Navigator.pop(context);
              },
              confirmBtnColor: bluecolor,
              confirmBtnTextStyle: textpoppins.copyWith(color: whitecolor));
        }

        if (state is DataBerasFailed) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: "Terjadi Kesalahan",
              onConfirmBtnTap: () {
                Navigator.pop(context);
              },
              confirmBtnColor: bluecolor,
              confirmBtnTextStyle: textpoppins.copyWith(color: whitecolor));
        }
      },
      child: Container());
}
