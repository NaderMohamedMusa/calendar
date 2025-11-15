# Calendar

A Flutter project built using **Clean Architecture** principles.  
This project demonstrates a modular, scalable Flutter application structure.

---

## Screenshots

| Calendar Month Screen | Calendar Week Screen |
|:--------------------:|:------------------:|
| <img src="assets/images/Calendar_-_Month.png" width="300"/> | <img src="assets/images/Calendar_-_Week.png" width="300"/> |

---

## Features

- Clean Architecture with separation of **Presentation**, **Domain**, and **Data** layers
- State management using **Bloc/Cubit**
- Localization support
- Responsive design for **mobile**, **tablet**, and **desktop**
- Network handling with proper error handling

---

## Packages Used

- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) - State management using Bloc/Cubit
- [`get_it`](https://pub.dev/packages/get_it) - Dependency injection
- [`table_calendar`](https://pub.dev/packages/table_calendar) - Calendar widget
- [`reactive_forms`](https://pub.dev/packages/reactive_forms) - Form handling
- [`responsive_framework`](https://pub.dev/packages/responsive_framework) - Responsive design
- [`dio`](https://pub.dev/packages/dio) - Network requests

---

## Clean Architecture Hierarchy

- lib/
- │
- ├── core/
- │ ├── error/
- │ │ └── failures.dart
- │ ├── usecases/
- │ │ └── usecase.dart
- │ ├── utils/
- │ │ └── date_utils.dart
- │ └── theme/
- │ └── app_theme.dart
- │
- ├── features/
- │ └── calendar/
- │ ├── domain/
- │ │ ├── entities/
- │ │ │ ├── session_entity.dart
- │ │ │ └── calendar_day_entity.dart
- │ │ ├── repositories/
- │ │ │ └── calendar_repository.dart
- │ │ └── usecases/
- │ │ ├── get_month_days.dart
- │ │ ├── get_week_days.dart
- │ │ └── get_sessions_for_day.dart
- │ │
- │ ├── data/
- │ │ ├── models/
- │ │ │ ├── session_model.dart
- │ │ │ └── calendar_day_model.dart
- │ │ ├── datasources/
- │ │ │ └── calendar_local_datasource.dart
- │ │ └── repositories/
- │ │ └── calendar_repository_impl.dart
- │ │
- │ └── presentation/
- │ ├── cubit/
- │ │ ├── calendar_cubit.dart
- │ │ └── calendar_state.dart
- │ ├── view/
- │ │ └── calendar_page.dart
- │ ├── widgets/
- │ │ ├── month_view.dart
- │ │ ├── week_view.dart
- │ │ ├── session_card.dart
- │ │ └── day_item.dart
- │ └── styles/
- │ └── calendar_colors.dart
- │
- └── main.dart


### Layers Explained

1. **Presentation Layer**
    - Widgets, Screens, Cubits/Blocs
    - Handles UI and user interactions
2. **Domain Layer**
    - Business logic, Use Cases, Entities
    - Independent of frameworks or data sources
3. **Data Layer**
    - Repository implementations, API/local storage
    - Provides data to Domain Layer
4. **Core**
    - Shared utilities, theme, errors, base use cases

---

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/NaderMohamedMusa/calendar.git
