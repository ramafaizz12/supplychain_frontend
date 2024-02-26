part of 'widgets.dart';

class ButtonLogout extends StatelessWidget {
  final double width;
  final double height;
  const ButtonLogout({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Apakah anda yakin ingin keluar ?",
                    style: textpoppins.copyWith(fontSize: 12),
                  ),
                  content: Row(
                    children: [
                      ButtonUtama(
                        width: width,
                        height: height,
                        namabutton: "Tidak",
                        voidcallback: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ButtonUtama(
                        width: width,
                        height: height,
                        namabutton: "Ya",
                        voidcallback: () {
                          context.read<AuthBloc>().add(LoggedOut());
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      )
                    ],
                  ),
                ));
      },
      child: Icon(
        Icons.logout,
        size: 30,
        color: whitecolor,
      ),
    );
  }
}
