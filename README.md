# Dio\_tutorial

Simple Flutter example using **Dio + MVC + Provider** for API-driven apps.

## What it shows

* How to use **Dio** for network requests (GET, POST, multipart upload).
* A basic **MVC** folder structure.
* **Provider** for state management (loading / error / data).

## Project structure (high level)

```
lib/
├─ core/         // Dio client, config, utils
├─ data/         // models, remote sources
├─ domain/       // repositories
├─ presentation/ // controllers (Provider) + views
└─ main.dart
```

## Quick start

1. Clone the repo:
   `git clone https://github.com/your-username/Dio_tutorial.git`
2. Install packages:
   `flutter pub get`
3. Update API base URL in `core/config/app_config.dart`.
4. Run the app:
   `flutter run`

## Features

* Dio client with interceptors support
* Example: fetch posts and create/upload post
* Simple provider-based controllers for state management
* Error handling for Dio exceptions

## Notes

* Replace the example API endpoints with your own.
* Add `assets` or images to `pubspec.yaml` if the project uses them.

## License

MIT — use and modify freely.

