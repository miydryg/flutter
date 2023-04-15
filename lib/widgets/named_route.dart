import 'package:first_project_flutter_start/widgets/show_pepe.dart';
import 'package:flutter/cupertino.dart';


class NamedRoute extends StatelessWidget {
  const NamedRoute({Key? key,}) : super(key: key);
  final myRoute = '/named_route';
  @override
  Widget build(BuildContext context) {
    return const ShowPepe();
  }
}
