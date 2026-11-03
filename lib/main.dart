import 'package:cutra/app.dart';

/// Application entrypoint.
///
/// Acts solely as the launch trigger, delegating all service assembly,
/// dependency injection overrides, and root widget orchestration to [AppBootstrapper].
void main() async {
  await AppBootstrapper.bootstrap();
}
