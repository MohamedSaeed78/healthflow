# HEALTH FLOW

# 🧠 HealthFlow — AI Fitness Trainer Mobile App

> HealthFlow is an AI-powered fitness trainer mobile application designed to help users manage their exercise routines and diet plans in a simple, personalized, and intelligent way.

### With the increasing stress of daily life and irregular fitness habits, many people struggle to maintain a consistent workout and healthy diet. HealthFlow solves this problem by providing:

* Personalized workout plans based on BMI, fitness goals, and available equipment
* Personalized diet plans tailored to the user’s needs
* An integrated chatbot that gives smart recommendations and real-time guidance
* AI pose estimation for push-ups and squats to:
  * Count correct repetitions
  * Detect incorrect posture
  * Provide correction feedback
  * Include warm-up sessions to prevent Injury.

> The app is built using **Flutter**, enabling a single codebase for both Android and iOS platforms.
> The AI pose estimation and posture correction model were trained using Python and integrated into the mobile application.

# 🚀 Features

> HealthFlow provides a complete AI-assisted fitness experience through the following features:

### 🔐 Authentication & User Profile
* Login and Register system
* Splash screen on app launch
* User profile setup after registration
* Stores user data such as:
  * Height, weight, BMI
  * Fitness goal
  * Powered by **Firebase Authentication** and **Firestore** for secure data storage
### 🧮 BMI Calculation
 * BMI is automatically calculated after completing the profile
 * Used to personalize workout and diet recommendations
### 🏋️ Exercise Explorer
* Browse exercises categorized into:
  * Home (body-only)
  * Gym (equipment-based)
* Standalone exercise display pages
### 📅 Workout Planner (Editable)
* Create custom workout plans
* Add or remove exercises inside each plan
* Includes default plans:
  * Body-only plan
  * Gym plan
  * Beginner mixed plan
### 🥗 Diet Planner (Editable)
* Create custom diet plans
* Add or remove meals/food items
* Includes default plans:
  * High-protein plan
  * Balanced starter plan
### 🤖 AI Chatbot Assistant
* Generates personalized workout and diet plans
* Uses user BMI, goal, and profile data
* Provides smart recommendations and guidance
### 🎥 AI Pose Estimation & Form Correction
* Supports push-ups and squats
* Counts correct repetitions
* Detects incorrect posture
* Gives real-time correction feedback
* Includes a warm-up phase before exercises

## 🧠 AI Pipeline & Pose Correction Architecture

> HealthFlow does not rely only on a pre-trained pose model.
> It implements a custom AI pipeline to detect exercise form correctness in real time.

## 🧍 Step 1 — Pose Keypoint Extraction

> Using MoveNet from TensorFlow Lite, body keypoints were extracted from exercise videos.

### A Jupyter Notebook (Python) was built to:

* Process exercise videos twice:
  * Once for correct form
  * Once for incorrect form
* Extract 17 body keypoints per frame
* Save the keypoints dataset for training
### 🏋️ Step 2 — Training the Form Classification Model

> A second Jupyter Notebook was used to:

* Train a classification model using the extracted keypoints
* Classify exercise form into:
  * ✅ Correct
  * ❌ Incorrect

> This model was trained on a custom dataset created specifically for push-ups and squats.

### 📱 Step 3 — Model Integration in Flutter

> Inside the Flutter app:

1. MoveNet runs first to detect live body keypoints from the camera
2. The extracted keypoints are passed to the trained classification model
3. The app:
  1. Counts only correct repetitions
  2. Detects bad posture
  3. Gives real-time voice feedback
  4. Includes a warm-up phase before starting the main exercise

> This combination allows HealthFlow to behave like a real AI fitness coach, not just a rep counter.

