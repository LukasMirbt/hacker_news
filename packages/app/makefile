cov: 
	very_good test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
f:
	dart run build_runner build --delete-conflicting-outputs
tr:
	flutter gen-l10n
icon:
	dart run flutter_launcher_icons
splash:
	dart run flutter_native_splash:create --path=flutter_native_splash.yaml