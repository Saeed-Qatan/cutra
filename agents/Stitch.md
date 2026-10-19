# Theme and HTML/CSS to Flutter

The owner supplies the theme, then HTML/CSS and assets for one page at a time. Convert the supplied page to Flutter Widgets using `core/constants/colors.dart`, `core/theme/`, and existing shared controls. Do not create screens for designs not yet supplied.

Map structure to Widgets, design colors to the approved theme, and interaction to a Riverpod ViewModel. Put data classes in `models/` and external access in `data/services/`. Verify target sizes and loading/error/disabled states. Do not use a WebView as a substitute.

Splash is implemented with its full supplied identity, local SVG, grid and corner marks, and five-second display. Login uses the supplied Arabic reference and shared controls. Backend integration follows completion of local pages.
