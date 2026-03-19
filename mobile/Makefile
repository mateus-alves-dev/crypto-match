.PHONY: run.dev run.prod build.apk.dev build.apk.prod build.ios.prod

run.dev:
	flutter run --dart-define-from-file=.env.dev.json

run.prod:
	flutter run --dart-define-from-file=.env.prod.json

build.apk.dev:
	flutter build apk --debug --dart-define-from-file=.env.dev.json

build.apk.prod:
	flutter build apk --release --dart-define-from-file=.env.prod.json

build.ios.prod:
	flutter build ipa --release --dart-define-from-file=.env.prod.json
