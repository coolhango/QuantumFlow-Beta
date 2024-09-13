# 🏋️‍♂️ Fitness Tracker App 📱

Welcome to the Fitness Tracker App! This app is your perfect companion for recording and tracking your workouts. Whether you're into running 🏃‍♂️, walking 🚶‍♀️, or cycling 🚴‍♂️, we've got you covered! Track your progress, view detailed statistics, and set daily goals to stay motivated. 🤟 In every way possible. Made with 🫰 by cool hango, arnab ghosh and gregory tay.

<img width="854" alt="Screenshot 2024-09-13 at 9 48 15 PM" src="https://github.com/user-attachments/assets/25a1e92a-0030-4b24-8645-e0f29b4bbb06">


## 🌟 Key Features

### 1. 📅 Workout Recording
- Track your running, walking, or cycling activities with ease!
- Use the start, pause, resume, or stop features on the timer ⏱️ to control your workout.
- Live tracking displays your path on a map 🗺️ with real-time statistics like distance and speed.

### 2. 📜 Workout History
- View all your past workouts organized by date 🗓️ (most recent ones are at the top).
- Filter history by the type of activity (running, walking, or cycling).
- See detailed visualizations of your route, start & end points, duration, distance, average speed, and step counts 🦶.

### 3. 📊 Fitness Statistics
- Visualize your fitness journey with bar charts 📊 for distance, calories burned 🔥, and steps taken.
- View weekly, monthly, or yearly stats to track long-term progress 📆.
- Donut charts 🍩 display your daily achievements for each area.

### 4. 🎯 Setting Daily Goals
- Set daily targets for distance, calories, and step counts to stay motivated.

## 🚀 How to Use the App

1. **Open the Project:** Navigate to the `Fitness.xcodeproj` file in Xcode 🖥️ and build the app on a simulator or physical device 📱.
2. **Grant Permissions:** Allow access to location and motion data for accurate workout tracking.
3. **Simulate Workouts (Simulator Users):** Go to `Features` menu → `Location` → Choose activity type (City Run, City Bicycle Ride).

> ⚠️ **Note:** Pedometer simulation is unavailable in the simulator. A real device is required to track actual steps 👟.

## 🔧 Tech Stack & Frameworks

### 1. 📍 Core Location
- Tracks your exact location during workouts.
- Manages location updates in real-time for speed, distance, and more.
  
### 2. 🦶 Core Motion
- Fetches real-time step counts and motion data for walking or running activities.

### 3. 💾 Core Data
- Saves all workout data (routes, stats, etc.) using Core Data for persistence.
  
### 4. 📡 Combine Framework
- Handles real-time data flow, ensuring instant updates for location and motion data.

### 5. 🗺️ MapKit
- Displays your workout route on a map, with SwiftUI integration for iOS 17+.

### 6. 📈 Swift Charts
- Displays variations in stats like pace and altitude changes with beautiful charts.

## 👣 How Location & Motion Work

- **Location Authorization:** The app asks for location access before starting workouts.
- **Motion Authorization:** Requests permission to access motion data to track steps and calories.
- **Background Updates:** Track location in the background, even when the screen is locked ⏳.

## 📱 Usage Scenarios

- **Running in the city?** Track your pace and map your route with real-time data 🏙️.
- **Cycling through the countryside?** Track speed, distance, and altitude changes 🚵‍♀️.
- **Consistency is key!** Use daily goals to track your progress and hit those targets 🎯.

## 📖 Technologies Overview

- **Core Location:** Tracks real-time location 🧭.
- **Core Motion:** Fetches step counts and motion data 🦶.
- **Core Data:** Securely saves your workout data 💾.
- **MapKit:** Maps your running or cycling route 🗺️.
- **Swift Charts:** Visualizes fitness data with graphs 📈.
- **Combine:** Manages real-time data flow 📡.

## 📑 Terms and Conditions
- Please refer to the Terms and Conditions for detailed information about using the App, user responsibilities, and legal aspects: 

## License
- The Fitness Tracker App is licensed under the MIT License. For more information, see the LICENSE file included in the project.

<img width="834" alt="Screenshot 2024-09-13 at 9 49 28 PM" src="https://github.com/user-attachments/assets/eebb661b-037d-45b2-8d7b-d568fdfb7e7b">
