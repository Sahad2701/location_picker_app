# Location Picker App

This Flutter app allows users to select a country and view a list of states associated with it. After making selections, the user can proceed to another screen to review their choices. The app is built with clean architecture principles and is structured for scalability and maintainability.


## Features

- Clean separation of concerns (data, domain, presentation layers)
- API integration using Dio with support for custom headers
- State management using Cubit from the BLoC library
- Country and state dropdowns
    - Country dropdown is populated on app launch
    - Once a country is selected, the dropdown becomes disabled
    - States are fetched based on the selected country
- "View Selected Location" button appears after selecting a state, navigating to a screen showing selected country and state
- Models created by Freezed and `json_serializable`
- Organized folder structure with feature-based architecture
- Centralized theming using `ColorScheme.fromSeed`


## Folder Structure

```
lib/
├── core/
│   ├── constants/
│   ├── network/
├── feature/
│   └── country_state_picker/
│       ├── data/
│       ├── domain/
│       └── presentation/
│           ├── cubit/
│           ├── screens/
│           └── widgets/
└── main.dart
```


## Getting Started

```bash
flutter pub get
flutter run
```

## How It Works

1. On app launch, the list of countries is fetched.
2. Once a user selects a country, the country dropdown is disabled.
3. States for the selected country are fetched and shown in a second dropdown.
4. User selects a state.
5. A **"View Selected Location"** button appears, which navigates to a new screen.
6. The new screen displays the **selected country and state**.


## Tech Stack

- **Flutter** (Material 3 UI)
- **Dio** for REST API calls
- **Cubit** (from BLoC) for state management
- **Freezed** and `json_serializable` for model generation
- **Clean Architecture** for separation of concerns
