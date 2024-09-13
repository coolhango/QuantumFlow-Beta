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

struct TabBarView: View {
    var dataManager: CoreDataManager

    var body: some View {
        TabView {
            BeginWorkoutView(dataManager: dataManager)
                .tabItem {
                    Label(Tab.workout.tabName, systemImage: Tab.workout.rawValue)
                }
            WorkoutHistoryView(dataManager: dataManager)
                .tabItem {
                    Label(Tab.history.tabName, systemImage: Tab.history.rawValue)
                }
            GlobalStatisticsView(dataManager: dataManager)
                .tabItem {
                    Label(Tab.statistics.tabName, systemImage: Tab.statistics.rawValue)
                }
            GoalsView()
                .tabItem {
                    Label(Tab.goals.tabName, systemImage: Tab.goals.rawValue)
                }
        }
    }
    enum Tab: String {
        case workout = "figure.run"
        case history = "clock.arrow.circlepath"
        case statistics = "chart.xyaxis.line"
        case goals = "target"

        var tabName: String {
            switch self {
            case .workout: return "Workout"
            case .history: return "History"
            case .statistics: return "Statistics"
            case .goals: return "Goals"
            }
        }
    }
}

#Preview {
    TabBarView(dataManager: .preview)
}
