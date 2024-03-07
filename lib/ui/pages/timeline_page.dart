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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58.0),
          child: BlocBuilder<SupplychainBloc, SupplychainState>(
            builder: (context, state) {
              return state is DataBerasLoaded
                  ? ListView(
                      children: [
                        MyTimelineTile(
                          isfirst: true,
                          islast: false,
                          ispast: state.data!.konfirmasi_manufacturer!,
                          konfirmasi: "Konfirmasi Manufacturer",
                        ),
                        MyTimelineTile(
                          isfirst: false,
                          islast: false,
                          ispast: state.data!.konfirmasi_distributor!,
                          konfirmasi: "Konfirmasi Distributor",
                        ),
                        MyTimelineTile(
                          isfirst: false,
                          islast: true,
                          ispast: state.data!.konfirmasi_wholesaler!,
                          konfirmasi: "Konfirmasi Wholesaler",
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: bluecolor,
                      ),
                    );
            },
          ),
        ));
  }
}
