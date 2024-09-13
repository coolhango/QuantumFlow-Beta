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

import Foundation
import Combine

@MainActor
final class DailyStatisticsViewModel: ObservableObject {
    private let calendarManager = CalendarManager()
    private let dataManager: CoreDataManager
    @Published var distances: [Distance] = []
    @Published var calories: [Calorie] = []
    @Published var steps: [Step] = []
    @Published var weeks: [[Date]] = []
    @Published var selectedDate = Date()
    @Published var measures: [(date: Date, type: Measure, value: Double)] = []
    private var cancellables: Set<AnyCancellable> = []

    init(dataManager: CoreDataManager) {
        self.dataManager = dataManager
        calendarManager.$weeks.assign(to: &$weeks)
        calendarManager.$selectedDate.assign(to: &$selectedDate)
        dataManager.$distances
            .sink { [weak self] in
                self?.distances = $0.compactMap{ dataManager.nSManagedObjectToMetric($0) as? Distance }
            }
            .store(in: &cancellables)
        dataManager.$calories
            .sink { [weak self] in
                self?.calories = $0.compactMap{ dataManager.nSManagedObjectToMetric($0) as? Calorie }
            }
            .store(in: &cancellables)
        dataManager.$steps
            .sink { [weak self] in
                self?.steps = $0.compactMap{ dataManager.nSManagedObjectToMetric($0) as? Step }
            }
            .store(in: &cancellables)
        fetchMeasures()
    }

    func update(to direction: TimeDirection) {
        calendarManager.update(to: direction)
    }

    func fetchMeasures() {
        self.measures.removeAll()
        Dictionary(
            grouping: distances,
            by: { formatDate($0.date) }
        )
        .filter { isSameDate($0.key, and: selectedDate) }
        .forEach {
            self.measures.append(
                (date: $0,
                 type: Measure.distance,
                 value: $1.reduce(0, { $0 + $1.measure.converted(to: .kilometers).value }) )
            )
        }
        Dictionary(
            grouping: calories,
            by: { formatDate($0.date) }
        )
        .filter { isSameDate($0.key, and: selectedDate) }
        .forEach {
            self.measures.append(
                (date: $0,
                 type: Measure.calorie,
                 value: $1.reduce(0, { $0 + Double($1.count) }) )
            )
        }
        Dictionary(
            grouping: steps,
            by: { formatDate($0.date) }
        )
        .filter { isSameDate($0.key, and: selectedDate) }
        .forEach {
            self.measures.append(
                (date: $0,
                 type: Measure.step,
                 value: $1.reduce(0, { $0 + Double($1.count) }) )
            )
        }
    }

    func getGoal(for measure: Measure) -> Double {
        switch measure {
        case .distance: return UserDefaults.standard.double(forKey: UserDefaults.Keys.distance.rawValue)
        case .calorie: return Double(UserDefaults.standard.integer(forKey: UserDefaults.Keys.calories.rawValue))
        case .step: return Double(UserDefaults.standard.integer(forKey: UserDefaults.Keys.steps.rawValue))
        default: return 0
        }
    }

    private func formatDate(_ date: Date?) -> Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = calendar.component(.day, from: date ?? Date())
        components.month = calendar.component(.month, from: date ?? Date())
        components.year = calendar.component(.year, from: date ?? Date())
        return calendar.date(from: components) ?? Date.now
    }

    private func isSameDate(_ date1: Date, and date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
