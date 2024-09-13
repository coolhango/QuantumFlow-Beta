// Copyright © 2024 Gedeon Koh All rights reserved.
// No part of this publication may be reproduced, distributed, or transmitted in any form or by any means, including photocopying, recording, or other electronic or mechanical methods, without the prior written permission of the publisher, except in the case of brief quotations embodied in reviews and certain other non-commercial uses permitted by copyright law.
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHOR OR COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// Use of this program for pranks or any malicious activities is strictly prohibited. Any unauthorized use or dissemination of the results produced by this program is unethical and may result in legal consequences.
// This code has been tested throughly. Please inform the operator or author if there is any mistake or error in the code.
// Any damage, disciplinary actions or death from this material is not the publisher's or owner's fault.
// Run and use this program this AT YOUR OWN RISK.
// Version 0.1

// This Space is for you to experiment your codes
// Start Typing Below :) ↓↓↓

import SwiftUI

struct RecordWorkoutView: View {
    @StateObject var viewModel: WorkoutViewModel
    @Binding var workoutType: WorkoutType?
    @State private var showAlert = false
    @State private var timerIsStopped = false
    @State private var finishedWorkout = false
    let dataManager: CoreDataManager

    init(dataManager: CoreDataManager, workoutType: Binding<WorkoutType?>) {
        self.dataManager = dataManager
        self._workoutType = workoutType
        _viewModel = .init(wrappedValue: WorkoutViewModel(dataManager: dataManager, type: workoutType.wrappedValue))
        
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                WorkoutBackgroundImageView(background: viewModel.workoutType?.background)
                VStack {
                    WorkoutIconView(icon: viewModel.workoutType?.icon)
                    if !viewModel.locationAccessIsDenied && !viewModel.locationAccessThrowsError {
                        if viewModel.workoutStarted {
                            MeasurementBannerView(
                                distance: viewModel.distance,
                                speed: viewModel.speed)
                            Group {
                                MapView(mapType: .moving,
                                        startLocation: viewModel.startLocation,
                                        route: viewModel.route,
                                        endLocation: viewModel.endLocation)
                            }
                        }
                    }
                    if viewModel.locationAccessIsDenied {
                        Spacer()
                        AccessDeniedView()
                    }
                    Spacer()
                    TimerView(
                        errorIsThrown: $viewModel.locationAccessThrowsError,
                        accessIsDenied: $viewModel.locationAccessIsDenied,
                        elapsedTime: viewModel.elapsedTime,
                        timerIsNil: viewModel.timerIsNil,
                        timerIsPaused: viewModel.timerIsPaused) {
                            if !viewModel.locationAccessIsDenied && !viewModel.locationAccessThrowsError {
                                viewModel.beginWorkout()
                            }
                        } pauseAction: {
                            viewModel.pauseWorkout()
                        } resumeAction: {
                            viewModel.resumeWorkout()
                        } stopAction: {
                            timerIsStopped = true
                            viewModel.pauseWorkout()
                        }
                        .alert("Are you sure ?", isPresented: $timerIsStopped) {
                            Button("Finish Workout") {
                                viewModel.endWorkout()
                                viewModel.addWorkout()
                                workoutType = nil
                            }
                            Button("Cancel", role: .cancel) {}
                        } message: {
                            Text("This will stop recording your current workout and save it to your history.")
                        }
                }
            }
            .onChange(of: viewModel.locationAccessError) { _ in
                showAlert = viewModel.locationAccessThrowsError
            }
            .alert("Location Access Error", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.locationAccessError)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.cancelWorkout()
                        workoutType = nil
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    @State var workoutType: WorkoutType? = .running
    return RecordWorkoutView(dataManager: .preview, workoutType: $workoutType)
}
