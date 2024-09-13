# QuantumFit-Beta

🏋️‍♂️ Fitness Tracker App 📱
Welcome to the Fitness Tracker App! This app is your perfect companion for recording and tracking your workouts. Whether you're into running 🏃‍♂️, walking 🚶‍♀️, or cycling 🚴‍♂️, we've got you covered! Track your progress, view detailed statistics, and set daily goals to stay motivated. Here's a breakdown of everything this app offers:

## 🌟 **Key Features**
1. 📅 Workout Recording
  *Track your running, walking, or cycling activities with ease!*
  *Use the start, pause, resume, or stop features on the timer ⏱️ to control your workout.*
  *Live tracking displays your path on a map 🗺️ along with real-time statistics like distance and speed.*
2. 📜 Workout History
  *View all your past workouts organized by date 🗓️ (most recent ones are at the top).*
  *Filter your history by the type of activity (running, walking, or cycling).*
  *Check out a detailed view of any workout with map visualizations of your route, start & end points, duration, distance, average speed, and even step counts 🦶!*

3. 📊 Fitness Statistics
  *Get a clear picture of your fitness journey with bar charts 📊 tracking your distance traveled, calories burned 🔥, and steps taken.*
  *View your stats by week, month, or year to see your long-term progress 📆.*
  *Stay on top of your goals with donut charts 🍩 displaying your daily achievements in each area.*

4. 🎯 Setting Daily Goals

Keep yourself motivated by setting daily targets for distance, calories, and step counts. Achieving your goals has never been so fun!
🚀 How to Use the App

Open the Project: Navigate to the Fitness.xcodeproj file in Xcode 🖥️ and build the app on a simulator or a physical device 📱.
Grant Permissions: When prompted, allow access to your location and motion data to record workouts accurately.
Simulate Workouts (For Simulator Users): In the simulator, you can simulate different scenarios like a City Run or City Bicycle Ride by going to the Features menu → Location → Select your activity type.
⚠️ Note: Pedometer simulation is unavailable in the simulator. You’ll need to use a real device to track actual steps 👟.
🔧 Tech Stack & Frameworks

1. 📍 Core Location
The app uses Core Location to track your exact location throughout your workout.
A custom class called LocationManager manages this process, starting and stopping location services and handling updates for speed, distance, and more in real-time.
The app will also handle scenarios where location access is denied by prompting users to enable Location Services.
2. 🦶 Core Motion
For tracking steps and motion, the app uses Core Motion to fetch step counts during walking or running activities.
The pedometer data is live, giving you real-time updates on your progress 🏃‍♀️.
3. 💾 Core Data
All your workout data (routes, stats, steps, etc.) is saved using Core Data for persistent storage.
The CoreDataManager class handles all database operations: saving, fetching, adding, and deleting workout records.
User goals are saved using UserDefaults for quick and easy retrieval.
4. 📡 Combine Framework
The app uses Combine to handle data flow from the services to the view models.
It subscribes to location updates, timer events, and motion data in real-time, ensuring all your workout data is displayed instantly.
5. 🗺️ MapKit
Your workout route is displayed on a map using MapKit.
For devices running iOS 17.0 or later, the app uses the SwiftUI MapKit features for seamless integration.
On older versions, the app wraps UIKit views to ensure compatibility.
6. 📈 Swift Charts
Beautiful charts are used to show variations in your workout stats like pace and altitude changes during a session.
Bar charts are also used to display your cumulative statistics for weekly, monthly, and yearly trends, making it easy to track progress 📉.
👣 How Location & Motion Work

Location Authorization: When you first start a workout, the app will ask for permission to access your location. Make sure to grant access to ensure accurate tracking.
Motion Authorization: Similarly, motion data access will be requested when you begin recording. The app will use this data to measure your steps and calories.
Background Updates: The app is capable of updating your location data even in the background ⏳, so feel free to lock your screen during your run or ride while still recording your activity.
📱 Usage Scenarios

Running in the city? Track your pace, map your route, and stay motivated with real-time data 🏙️.
Cycling through the countryside? Let the app track your speed, distance, and altitude changes on a scenic ride 🚵‍♀️.
Want to stay consistent? Use the daily goals feature to track your progress and hit those targets 🎯.
📖 Technologies Overview

Core Location: Tracks your real-time location 🧭.
Core Motion: Fetches step counts and other motion data 🦶.
Core Data: Saves all your workout data securely 💾.
MapKit: Maps your running or cycling route in real time 🗺️.
Swift Charts: Visualizes your fitness data with beautiful graphs 📈.
Combine: Manages data flow throughout the app for real-time updates 📡.
