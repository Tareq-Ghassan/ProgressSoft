import 'package:flutter/material.dart';
import 'package:progress_soft/presentation/constants/size.dart';

/// [OrWidget] ui design for OR in `LoginScreen`
class OrWidget extends StatelessWidget {
  /// [OrWidget] Constructor
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.46,
          child: Divider(
            endIndent: pt16,
            indent: pt16,
          ),
        ),
        const Text('or'),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.46,
          child: Divider(
            endIndent: pt16,
            indent: pt16,
          ),
        ),
      ],
    );
  }
}
