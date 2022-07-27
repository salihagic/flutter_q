# Getting started with Q app
##
##### Make sure to run before starting:
``` flutter clean ```
``` flutter pub get ```
``` flutter pub upgrade ``` 
## To run this application in release, profile or debug mode run the following command:
```flutter run --release --dart-define="environment=2" -t lib/main.dart```
## To update generated models execute this command:
```flutter pub run build_runner build --verbose --delete-conflicting-outputs```
#
> Tip: If you're using vs code add the following to your .vscode/launch.json file(if not present create it). This will allow you to run specific environment by choosing the option in vs code Run and Debug dropdown.
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Development",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "args": [
                "--dart-define",
                "environment=0",
            ]
        },
        {
            "name": "Staging",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "args": [
                "--dart-define",
                "environment=1",
            ]
        },
        {
            "name": "Production",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "args": [
                "--dart-define",
                "environment=2",
            ]
        },
        {
            "name": "Development in Chrome",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "args": [
                "-d",
                "chrome",
                "--web-port",
                "8000",
                "--dart-define",
                "environment=0",
            ],
        }
    ]
}
```