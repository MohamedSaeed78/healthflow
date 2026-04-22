# HealthFlow — AI Fitness Trainer Mobile App

HealthFlow is an AI-powered fitness trainer mobile application that helps users manage their workouts and diet plans in a personalized and intelligent way.

The app targets people who struggle to maintain consistent exercise and healthy eating habits due to daily stress and irregular routines. HealthFlow provides customized workout and diet plans based on user metrics such as BMI, fitness goal, and available equipment, allowing users to train effectively at home or in the gym.

It also integrates an AI chatbot for personalized guidance and a real-time pose estimation system that detects exercise form, counts correct repetitions, and provides posture correction feedback with a warm-up phase before exercises.

---

## Features

- Login and registration with user profile setup
- Automatic BMI calculation after completing the profile
- Storage of user data (height, weight, BMI, goal) using Firebase Authentication and Firestore
- Explore exercises categorized into home (body-only) and gym (equipment-based)
- Editable workout planner with default and custom plans
- Editable diet planner with default and custom plans
- AI chatbot that generates workout and diet plans based on user data
- AI pose estimation for push-ups and squats:
  - Counts correct repetitions
  - Detects incorrect posture
  - Provides real-time voice feedback
  - Includes warm-up before exercise

---
## Screenshots

### Authentication & Profile

![](screenshots/splash.png)
![](screenshots/login.jpg)
![](screenshots/register.jpg)
![](screenshots/profile.jpg)

---

## Tech Stack

**Mobile Application**
- Flutter 3.16
- Dart
- Java 17

**Backend**
- Firebase Authentication
- Cloud Firestore

**AI and Machine Learning**
- TensorFlow Lite
- MoveNet pose estimation model
- Custom posture classification model trained using Python
- Integrated using tflite_flutter

**Main Packages**
- camera
- tflite_flutter and tflite_flutter_helper
- flutter_gemini
- firebase_auth and cloud_firestore
- flutter_tts
- image_picker and image
  
---

## AI Pose Correction Pipeline

HealthFlow uses a custom AI pipeline to detect exercise form correctness in real time.

1. A Python Jupyter notebook extracts body keypoints from exercise videos using the MoveNet model for both correct and incorrect forms.
2. A second notebook trains a classification model on these keypoints to classify the form as correct or incorrect.
3. Inside the Flutter app, MoveNet detects live keypoints from the camera, which are then passed to the trained model to evaluate form, count reps, and provide feedback.

---

## Architecture

The project follows Clean Architecture principles to ensure maintainability and separation of concerns.

---

## Platforms

- Android (tested)
- ios (untried)

---

## Setup & Run Instructions

To run this project locally, some configuration is required because sensitive keys and files were removed from the repository.

### 1) Configure Firebase using FlutterFire CLI

## bash
``` 
dart pub global activate flutterfire_cli
flutterfire configure
```
### 2) Add Gemini API Key (Chatbot)
* The chatbot uses the Gemini API.
* Add your own API key in the project **healthflow\lib\features\chatbot\services\gemeni_key.dart**

### 3) Install TensorFlow Lite Dependencies
* Before running the project, run:
```
install.bat
```
* This installs the required TensorFlow Lite native dependencies needed for the pose estimation feature.
### 4) Get Flutter Packages
```
flutter pub get
```
### 5) Run the App
```
fluttert run
```
