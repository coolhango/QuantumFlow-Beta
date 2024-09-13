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
import Charts

struct PeriodChartView: View {
    @Binding var selection: Period
    let metric: [Metric]
    var data: [ChartData] {
        getChartData()
    }

    var body: some View {
        VStack {
            Chart(data) { element in
                BarMark(
                    x: .value("Date", element.date, unit: .day),
                    y: .value(element.measure.name, element.metric)
                )
                .opacity(0.5)
                RuleMark(y: .value("Goal", getGoal(for: element.measure)))
                .lineStyle(StrokeStyle(lineWidth: 1))
                .annotation(position: .top, alignment: .leading) {
                    Text(getFormattedGoal(for: element.measure))
                        .padding(.horizontal, 5)
                        .font(.caption)
                        .foregroundStyle(Color.accentColor)
                }
            }
            .chartXScale(domain: selection.domain)
            .aspectRatio(3, contentMode: .fit)
            .chartXAxis {
                AxisMarks(values: .stride(by: selection.stride)) { date in
                    AxisGridLine()
                    AxisValueLabel(format: selection.formatStyle, centered: true)
                }
            }
        }
    }

    private func getChartData() -> [ChartData] {
        var data: [ChartData] = []
        for index in 0..<metric.count {
            let date = metric[index].date
            let type = metric[index].type
            let value = metric[index].value
            data.append(
                ChartData.init(
                    measure: type,
                    date: date ?? Date(),
                    metric: value
                )
            )
        }
        return data
    }

    struct ChartData: Identifiable {
        let id = UUID()
        let measure: Measure
        let date: Date
        let metric: Double
    }

    private func getGoal(for measure: Measure) -> Double {
        switch measure {
        case .distance: return UserDefaults.standard.double(forKey: UserDefaults.Keys.distance.rawValue)
        case .calorie: return Double(UserDefaults.standard.integer(forKey: UserDefaults.Keys.calories.rawValue))
        case .step: return Double(UserDefaults.standard.integer(forKey: UserDefaults.Keys.steps.rawValue))
        default: return 0
        }
    }

    private func getFormattedGoal(for measure: Measure) -> String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = measure == .distance ? 1 : 0
            formatter.minimumFractionDigits = measure == .distance ? 1 : 0
            return formatter
        }()
        
        var goal: String = ""
        switch measure {
        case .distance: goal = formatter.string(for: getGoal(for: .distance)) ?? ""
        case .calorie: goal = formatter.string(for: getGoal(for: .calorie)) ?? ""
        case .step: goal = formatter.string(for: getGoal(for: .step)) ?? ""
        case .speed: goal = ""
        }
        return "Goal: " + goal + " " + measure.unitOfMeasure
    }
}

#Preview {
    let viewModel = GlobalStatisticsViewModel(dataManager: .preview)
    return PeriodChartView(selection: .constant(Period.week), metric: viewModel.distances)
}

enum Period: String, CaseIterable {
    case week
    case month
    case year

    var domain: ClosedRange<Date> {
        switch self {
        case .week:
            return Calendar.current.date(
                byAdding: .day,
                value: -6,
                to: formatDate(Date.now))!...Calendar.current.date(
                    byAdding: .day,
                    value: 1,
                    to: formatDate(Date.now))!
        case .month:
            return Calendar.current.date(
                byAdding: .day,
                value: -29,
                to: formatDate(Date.now))!...Calendar.current.date(
                    byAdding: .day,
                    value: 1,
                    to: formatDate(Date.now))!
        case .year:
            return Calendar.current.date(
                byAdding: .month,
                value: -11,
                to: formatMonth(Date.now))!...Calendar.current.date(
                    byAdding: .month,
                    value: 1,
                    to: formatMonth(Date.now))!
        }
    }

    var stride: Calendar.Component {
        switch self {
        case .week:
            return .day
        case .month:
            return .day
        case .year:
            return .month
        }
    }

    var formatStyle: Date.FormatStyle {
        switch self {
        case .week:
            return .dateTime.weekday(.abbreviated)
        case .month:
            return .dateTime.weekday(.narrow)
        case .year:
            return .dateTime.month(.abbreviated)
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

    private func formatMonth(_ date: Date?) -> Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.month = calendar.component(.month, from: date ?? Date())
        components.year = calendar.component(.year, from: date ?? Date())
        return calendar.date(from: components) ?? Date.now
    }
}
