import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/navbar/navbar_bloc.dart';
import '../widgets/main_button.dart';
import '../widgets/txt_field.dart';

class AllPlayersPage extends StatefulWidget {
  const AllPlayersPage({super.key});

  @override
  State<AllPlayersPage> createState() => _AllPlayersPageState();
}

class _AllPlayersPageState extends State<AllPlayersPage> {
  final isActive = ValueNotifier(false);
  final controller = TextEditingController();

  void checkActive() {
    isActive.value = controller.text.isNotEmpty;
  }

  void onAdd() {
    // final model = TestModel(
    //   id: getTimestamp(),
    //   title: controller.text,
    // );
    // context.read<TestBloc>().add(AddTest(model: model));
    context.read<NavbarBloc>().add(ChangePage(index: 2));
  }

  @override
  void dispose() {
    isActive.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TxtField(
          controller: controller,
          hintText: 'Title',
          onChanged: checkActive,
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder<bool>(
          valueListenable: isActive,
          builder: (context, value, child) {
            return MainButton(
              onPressed: onAdd,
              isActive: value,
              title: 'Add',
            );
          },
        ),
      ],
    );
  }
}
