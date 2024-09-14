# 🏋️‍♂️ QuantumFlow 📱

Welcome to QuantumFlow. The perfect companion for recording and tracking your workouts. Whether you're into running 🏃‍♂️, walking 🚶‍♀️, or cycling 🚴‍♂️, we've got you covered! Track your progress, view detailed statistics, and set daily goals to stay motivated. 🤟 In every way possible. Made with 🫰 by cool hango, arnab ghosh and gregory tay.

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

1. **Open the Project:** Navigate to the `QuantumFlow-Beta.xcodeproj` file in Xcode 🖥️ and build the app on a simulator or physical device 📱.
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

________________
## 🚀 Installation Instructions (Forking the Repo)

1. **Fork the Repository**:  
   Head over to the [QuantumFlow-Beta GitHub repository](https://github.com/coolhango/QuantumFlow-Beta) and click on the "Fork" button in the upper right corner of the page. This will create a personal copy of the repository under your GitHub account.

2. **Clone Your Fork**:  
   After forking the repository, clone it to your local machine:
   ```bash
   git clone https://github.com/coolhango/QuantumFlow-Beta.git
   cd QuantumFlow-Beta
   ```

3. **Install Dependencies**:  
   Open the project in Xcode and install the necessary dependencies:
   - If you are using any package managers like CocoaPods, make sure to run `pod install`.
   - Alternatively, if you're using Swift Package Manager, dependencies will automatically install when you open the project.

4. **Build and Run**:  
   Open the `QuantumFlow-Beta.xcodeproj` file in Xcode 🖥️. Select a physical device or simulator and hit the "Run" button ▶️ to build and launch the app.

5. **Set Up Permissions**:  
   Make sure to grant the app permissions to access your location and motion data when prompted. These are essential for tracking workouts accurately.

6. **Push Changes (Optional)**:  
   After making modifications, you can push changes back to your forked repository:
   ```bash
   git add .
   git commit -m "Your commit message"
   git push origin main
   ```

7. **Create a Pull Request (Optional)**:  
   If you wish to contribute to the main repository, navigate to your fork on GitHub and click "New Pull Request". This will allow your changes to be reviewed and potentially merged into the main QuantumFlow-Beta repo.

## 📱 Setup Instructions for iPhone (iOS) using Xcode

1. **Connect Your iPhone to Your Mac**  
   Plug your iPhone into your Mac using a USB cable. Ensure that your iPhone is unlocked and trusted by your Mac. If prompted, select "Trust This Computer" on your iPhone.

2. **Open QuantumFlow-Beta in Xcode**  
   Navigate to the `QuantumFlow-Beta.xcodeproj` file in Finder, then open it in Xcode. Ensure that the latest version of Xcode is installed to avoid compatibility issues.

3. **Select Your iPhone as the Target Device**  
   In Xcode, go to the top toolbar and click on the device selection dropdown. From the list, select your iPhone as the build target. If your iPhone doesn't appear, ensure it’s properly connected and recognized by Xcode.

4. **Set Team and Signing**  
   Go to the "Signing & Capabilities" tab in the Xcode project settings. Under "Team," choose your Apple ID or development team. This is necessary to sign the app for deployment to your iPhone. If you don’t have a development team set up, Xcode will guide you through the process.

5. **Allow Provisioning Profile Setup**  
   Xcode will automatically generate a provisioning profile for your app. Ensure that there are no warnings under "Signing & Capabilities." If any issues arise, click "Fix Issue" to let Xcode resolve them automatically.

6. **Download App Caches and Dependencies**  
   Xcode will download necessary app caches and any associated libraries. This process may take a few moments depending on the size of the dependencies. If the project uses Swift Package Manager, dependencies will be fetched during this step.

7. **Build the App**  
   Click the "Run" button (▶️) at the top of Xcode to begin building the app for your iPhone. Xcode will compile the app and deploy it to your device. Ensure that there are no build errors in the log section. If any errors occur, fix them before proceeding.

8. **Grant App Permissions on iPhone**  
   After the app is installed, open QuantumFlow on your iPhone. The app will request permissions for location and motion data. Tap "Allow" to grant these permissions, as they are crucial for tracking workouts and motion activities.

9. **Run the App and Test Features**  
   Once the app is installed, run it on your iPhone. Test core functionalities like location tracking and workout monitoring to ensure everything is working as expected. You can now explore all features of QuantumFlow directly from your device.

10. **Keep the App Updated**  
    Whenever you make changes in the code and want to test them on your iPhone, connect your device to your Mac, and press the "Run" button in Xcode again. This will rebuild and redeploy the updated version to your iPhone.

By forking the repository, you maintain an up-to-date version of QuantumFlow while having the flexibility to customize it to your needs. Feel free to explore the code, add new features, or fix bugs!

________________

## 📑 Terms and Conditions
- Please refer to the Terms and Conditions for detailed information about using the App, user responsibilities, and legal aspects: 

## License
- QuantumFlow is licensed under the MIT License. For more information, see the LICENSE file included in the project.

<img width="834" alt="Screenshot 2024-09-13 at 9 49 28 PM" src="https://github.com/user-attachments/assets/eebb661b-037d-45b2-8d7b-d568fdfb7e7b">
