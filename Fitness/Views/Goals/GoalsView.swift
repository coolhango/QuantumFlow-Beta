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

extension UserDefaults {
    enum Keys: String {
        case distance
        case calories
        case steps
    }
}

struct GoalsView: View {
    @AppStorage(UserDefaults.Keys.distance.rawValue) private var distance: Double = 0
    @AppStorage(UserDefaults.Keys.calories.rawValue) private var calories: Int = 0
    @AppStorage(UserDefaults.Keys.steps.rawValue) private var steps: Int = 0


    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                GoalSetupView(
                    measureType: Measure.distance.name,
                    measureValue: getFormattedGoal(for: .distance),
                    unitOfMeasure: Measure.distance.unitOfMeasure
                ) {
                    increaseGoal(for: .distance)
                } decreaseAction: {
                    decreaseGoal(for: .distance)
                }
                GoalSetupView(
                    measureType: Measure.calorie.name ,
                    measureValue: getFormattedGoal(for: .calories),
                    unitOfMeasure: Measure.calorie.unitOfMeasure
                ) {
                    increaseGoal(for: .calories)
                } decreaseAction: {
                    decreaseGoal(for: .calories)
                }
                GoalSetupView(
                    measureType: Measure.step.name,
                    measureValue: getFormattedGoal(for: .steps),
                    unitOfMeasure: Measure.step.unitOfMeasure
                ) {
                    increaseGoal(for: .steps)
                } decreaseAction: {
                    decreaseGoal(for: .steps)
                }
            }
            .padding()
            .padding(.bottom)
            .navigationTitle("Goals")
        }
    }

    private func getFormattedGoal(for measure: UserDefaults.Keys) -> String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = measure == .distance ? 1 : 0
            formatter.minimumFractionDigits = measure == .distance ? 1 : 0
            return formatter
        }()
        
        switch measure {
        case .distance: return formatter.string(for: abs(distance)) ?? ""
        case .calories: return formatter.string(for: abs(Double(calories))) ?? ""
        case .steps: return formatter.string(for: abs(Double(steps))) ?? ""
        }
    }

    private func decreaseGoal(for measure: UserDefaults.Keys) {
        switch measure {
        case .distance:
            if UserDefaults.standard.double(forKey: measure.rawValue) <= 0 {
                break
            } else { UserDefaults.standard.setValue(distance - 0.5, forKey: measure.rawValue)
            }
        case .calories:
            if UserDefaults.standard.double(forKey: measure.rawValue) <= 0 {
                break
            } else { UserDefaults.standard.setValue(calories - 50, forKey: measure.rawValue)
            }
        case .steps: 
            if UserDefaults.standard.double(forKey: measure.rawValue) <= 0 {
                break
            } else {
                UserDefaults.standard.setValue(steps - 500, forKey: measure.rawValue)
            }
        }
    }

    private func increaseGoal(for measure: UserDefaults.Keys) {
        switch measure {
        case .distance: UserDefaults.standard.setValue(distance + 0.5, forKey: measure.rawValue)
        case .calories: UserDefaults.standard.setValue(calories + 50, forKey: measure.rawValue)
        case .steps: UserDefaults.standard.setValue(steps + 500, forKey: measure.rawValue)
        }
    }
}

#Preview {
    GoalsView()
}
