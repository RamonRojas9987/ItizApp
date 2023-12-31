import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itizapp/constants.dart';
import 'package:itizapp/screens/home_screen/widgets/student_data.dart';
import 'package:itizapp/screens/my_profile/my_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //dividiremos la pantalla en dos partes
          //altura fija para la primera mitad
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        StudentName(studentName: 'Ramón'),
                        kHalfSizedBox,
                        StudentCarrer(
                            studentCarrer: 'Carrera ISC | Semestre : 11'),
                        kHalfSizedBox,
                        StudentYear(studentYear: '2022-2023')
                      ],
                    ),
                    kHalfSizedBox,
                    StudentPicture(
                        picAddress:
                            '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/images/ROPR990708P48_FOTO.jpg',
                        onPress: () {
                          Navigator.pushNamed(
                              context, MyProfileScreen.routeName);
                        }),
                  ],
                ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                      title: 'Notificaciones',
                      onPress: () {},
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 9,
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Mensajes',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 16.0,
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w800),
                            ),
                            Theme(
                              data: ThemeData(),
                              child: const Icon(Icons.message),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //otro usará toda la altura restante de la pantalla
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3),
                  ),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/quiz.svg',
                            title: 'Actividades'),
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/assignment.svg',
                            title: 'Tareas'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/holiday.svg',
                            title: 'Calendario'),
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/timetable.svg',
                            title: 'Horario'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/result.svg',
                            title: 'Evaluaciones'),
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/datesheet.svg',
                            title: 'Resultados'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/ask.svg',
                            title: 'Información'),
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/gallery.svg',
                            title: 'Galería'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/resume.svg',
                            title: 'Servicios\n Escolares'),
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/lock.svg',
                            title: 'Cambiar\n contraseña'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/event.svg',
                            title: 'Eventos'),
                        HomeCard(
                            onPress: () {},
                            icon:
                                '/Users/ramonrojas/Desktop/FlutterV1/itizapp/assets/icons/logout.svg',
                            title: 'Cerrar sesión'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.onPress,
      required this.icon,
      required this.title});
  final VoidCallback onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, height: 40, width: 40, color: kOtherColor),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: kDefaultPadding / 3,
            )
          ],
        ),
      ),
    );
  }
}
