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

struct WorkoutMetricsView: View {
    let workout: Workout?
    let allMetrics: Bool

    var body: some View {
        VStack {
            LabeledContent {
                HStack {
                    Text("Duration")
                    Spacer()
                    Text(durationFormatter(for: workout?.duration) ?? "")
                }
            } label: {
                Image(systemName: "timer")
                    .padding(.horizontal, 5)
                    .foregroundStyle(Color.accentColor)
            }
            LabeledContent {
                HStack {
                    Text("Distance")
                    Spacer()
                    Text(distanceFormatter(for: workout?.distance?.measure) ?? "")
                    + Text(" \(workout?.distance?.type.unitOfMeasure ?? "")")
                }
            } label: {
                Image(systemName: workout?.distance?.type.icon ?? "")
                    .padding(.horizontal, 1)
                    .foregroundStyle(Color.accentColor)
            }
            if allMetrics {
                LabeledContent {
                    HStack {
                        Text("Average Speed")
                        Spacer()
                        Text(speedFormatter(for: workout?.speed?.measure) ?? "")
                        + Text(" \(workout?.speed?.type.unitOfMeasure ?? "")")
                    }
                } label: {
                    Image(systemName: workout?.speed?.type.icon ?? "")
                        .padding(.horizontal, 5)
                        .foregroundStyle(Color.accentColor)
                }
                if workout?.type != .cycling {
                    LabeledContent {
                        HStack {
                            Text("Steps")
                            Spacer()
                            Text(numberFormatterInteger.string(for: workout?.steps?.count ?? 0) ?? "")
                        }
                    } label: {
                        Image(systemName: workout?.steps?.type.icon ?? "")
                            .padding(.horizontal, 5)
                            .foregroundStyle(Color.accentColor)
                    }
                }
                LabeledContent {
                    HStack {
                        Text("Calories")
                        Spacer()
                        Text(numberFormatterInteger.string(for : workout?.calories?.count ?? 0) ?? "")
                        + Text(" \(workout?.calories?.type.unitOfMeasure ?? "")")
                    }
                } label: {
                    Image(systemName: workout?.calories?.type.icon ?? "")
                        .padding(.horizontal, 5)
                        .foregroundStyle(Color.accentColor)
                }
            }
        }
        .font(.subheadline)
    }
    private let numberFormatterInteger: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0
        return formatter
    }()

    private let numberFormatterDecimal: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        return formatter
    }()

    private func durationFormatter(for duration: TimeInterval?) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: duration ?? 0)
    }

    private func distanceFormatter(for measure: Measurement<UnitLength>?) -> String? {
        guard let distanceInMeters = measure else { return nil }
        return numberFormatterDecimal.string(for: distanceInMeters.converted(to: UnitLength.kilometers).value)
    }

    private func speedFormatter(for measure: Measurement<UnitSpeed>?) -> String? {
        guard let speedInMetersPerSecond = measure else { return nil }
        return numberFormatterDecimal.string(for: speedInMetersPerSecond.converted(to: .kilometersPerHour).value)
    }
}

#Preview {
    WorkoutMetricsView(
        workout: PersistenceController.getWorkoutForPreview(persistenceController: PersistenceController.previewPersistenceController),
        allMetrics: true)
        .padding(.horizontal)
}
