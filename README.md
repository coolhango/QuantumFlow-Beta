# 🏋️‍♂️ Fitness Tracker App 📱

Welcome to the Fitness Tracker App! This app is your perfect companion for recording and tracking your workouts. Whether you're into running 🏃‍♂️, walking 🚶‍♀️, or cycling 🚴‍♂️, we've got you covered! Track your progress, view detailed statistics, and set daily goals to stay motivated.

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

_______
Terms and Conditions of Use

Effective Date: [Insert Date]

Welcome to the Fitness Tracker App (hereinafter referred to as "the App"). By accessing, downloading, or using this application, you agree to comply with and be bound by the following Terms and Conditions. If you do not agree with any of these terms, you should immediately discontinue use of the App.

This agreement is between you (the user) and the App's developer/owner (hereinafter referred to as "we," "our," or "us"). Please read these terms carefully.

1. General Terms of Use
  1.1 Eligibility
    By using the App, you confirm that you are at least 13 years old. If you are under 13, your legal guardian must consent to your use of the App.
    You warrant that any information you provide is accurate and up to date.
1.2 License
    We grant you a non-transferable, non-exclusive, revocable license to use the App in accordance with these terms.
    This license is strictly for personal and non-commercial use. You may not modify, distribute, sell, or lease any part of the App.
1.3 Updates and Modifications
    We may, at any time, release updates, patches, or new versions of the App to enhance features or fix bugs. We reserve the right to modify, suspend, or      discontinue the App without prior notice.
Continuing to use the App after updates or changes constitutes acceptance of the new terms.
2. Privacy and Data Collection

2.1 Information We Collect
When you use the App, we may collect personal data including but not limited to:
Location Data: To track your workouts (e.g., running, cycling, walking) in real-time.
Motion Data: To count steps, measure activity levels, and calculate calories burned.
Device Information: Information about your device’s hardware and operating system.
Activity History: Data on past workouts including duration, distance, speed, and routes.
Goals & Preferences: Data related to the daily goals you set within the App (distance, calories, steps).
2.2 Use of Your Data
We use your data to:
Enhance your user experience by providing personalized feedback on workouts.
Track your goals and generate real-time statistics (distance, calories burned, etc.).
Provide insights into your fitness progress through charts and historical data.
Improve the functionality of the App through analysis of usage patterns.
2.3 Sharing of Data
We do not sell, rent, or lease your personal data to third parties.
We may share your information with third-party service providers for operational purposes (e.g., data storage, cloud services) but only under strict confidentiality agreements.
In the event of a legal obligation, we may share your data with law enforcement or other governmental agencies when required by applicable laws or regulations.
2.4 Security
We take reasonable precautions to safeguard your data from unauthorized access, alteration, disclosure, or destruction.
While we strive to use commercially acceptable means to protect your data, we cannot guarantee absolute security due to the inherent risks associated with transmitting information over the internet or storing it electronically.
3. User Responsibilities

3.1 Proper Use
You agree to use the App in a responsible manner. This includes but is not limited to:
Not using the App in a way that could cause harm, injury, or damage to yourself, others, or property.
Not engaging in any activities that are illegal, fraudulent, or harmful using the App.
Ensuring that you are physically capable of participating in the activities tracked by the App (e.g., running, cycling).
3.2 Account Security
You are responsible for safeguarding any login credentials or passwords used to access the App. You should notify us immediately of any unauthorized use of your account.
We reserve the right to terminate or suspend accounts that are compromised or used in violation of these Terms and Conditions.
3.3 Health & Safety
You acknowledge that engaging in physical activities (such as running or cycling) involves inherent risks. By using the App, you assume all responsibility for any injuries or health issues that may arise from your participation.
Always consult with a healthcare professional before starting any new fitness regimen, especially if you have pre-existing medical conditions.
4. Intellectual Property

4.1 Ownership
All content, graphics, logos, designs, software, and data within the App are the intellectual property of the App's developer/owner. These materials are protected by copyright, trademark, and other intellectual property laws.
You may not reproduce, distribute, or modify any content from the App without prior written consent from us.
4.2 User-Generated Content
By submitting any feedback, suggestions, or data (such as workout summaries) through the App, you grant us a perpetual, non-exclusive, royalty-free license to use, modify, and publish that content for purposes related to the operation or improvement of the App.
5. Disclaimer of Warranties

5.1 Use at Your Own Risk
The App is provided on an "as-is" basis, without any warranties, either expressed or implied. We disclaim any and all warranties, including but not limited to warranties of merchantability, fitness for a particular purpose, and non-infringement.
While we strive to ensure that the App is functional and accurate, we do not guarantee that the App will always be available, error-free, or meet your specific needs.
5.2 Limitation of Liability
To the fullest extent permitted by law, we are not liable for any indirect, incidental, special, or consequential damages arising from the use or inability to use the App, even if we were advised of the possibility of such damages.
This includes, but is not limited to, damages for loss of data, business interruption, or health-related injuries.
6. Termination

6.1 User Termination
You are free to stop using the App at any time. If you wish to terminate your account, please contact us directly.
6.2 Our Right to Terminate
We reserve the right to suspend or terminate your access to the App at any time, with or without cause, if we believe that you are violating these Terms and Conditions or if your account poses a security risk.
7. Governing Law & Dispute Resolution

7.1 Governing Law
These Terms and Conditions are governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflict of laws principles.
7.2 Dispute Resolution
Any disputes arising out of or related to these Terms and Conditions shall be resolved through binding arbitration, conducted in [Your Jurisdiction], in accordance with the rules of the [Arbitration Institution].
By agreeing to these terms, you waive your right to participate in a class action lawsuit or class-wide arbitration.
8. Changes to the Terms and Conditions

We reserve the right to modify or update these Terms and Conditions at any time. Any changes will be effective immediately upon posting the revised terms in the App. It is your responsibility to review these terms periodically. Your continued use of the App after any such updates signifies your acceptance of the revised Terms and Conditions.

9. Contact Information

If you have any questions about these Terms and Conditions, please contact us at:

Email: [Your Support Email]
Address: [Your Company Address]

<img width="834" alt="Screenshot 2024-09-13 at 9 49 28 PM" src="https://github.com/user-attachments/assets/eebb661b-037d-45b2-8d7b-d568fdfb7e7b">
