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

struct DailyStatisticsView: View {
    @StateObject var viewModel: DailyStatisticsViewModel
    @Binding var showDailyStats: Bool
    let dataManager: CoreDataManager

    init(showDailyStats: Binding<Bool>, dataManager: CoreDataManager) {
        self._showDailyStats = showDailyStats
        self.dataManager = dataManager
        self._viewModel = .init(wrappedValue: DailyStatisticsViewModel(dataManager: dataManager))
    }

    var body: some View {
        GeometryReader { geo in
            VStack {
                CalendarView(selectedDate: viewModel.selectedDate,
                             weeks: viewModel.weeks) { day in
                    viewModel.selectedDate = day
                } update: { direction in
                    viewModel.update(to: direction)
                }
                .frame(height: 90)
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(0..<viewModel.measures.count, id: \.self) { index in
                            let date = viewModel.measures[index].date
                            let measure = viewModel.measures[index].type
                            let value = viewModel.measures[index].value
                            if isSameDate(viewModel.selectedDate, and: date) {
                                MeasureDonutView(
                                    measure: value,
                                    formattedMeasure: formattedMeasure(measure: measure, value: value),
                                    unitOfMeasure: measure.unitOfMeasure,
                                    icon: measure.icon,
                                    goal: viewModel.getGoal(for: measure),
                                    height: geo.size.height / 2)
                            }
                        }
                    }
                }
            }
            .onChange(of: viewModel.selectedDate) { _ in
                viewModel.fetchMeasures()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    withAnimation {
                        showDailyStats.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .padding(.bottom)
                }
            }
        }
    }
    private func isSameDate(_ date1: Date, and date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }

    private func formattedMeasure(measure: Measure, value: Double) -> String {
        let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = measure == .distance ? 1 : 0
            formatter.minimumFractionDigits = measure == .distance ? 1 : 0
            return formatter
        }()
        return formatter.string(for: value) ?? ""
    }
}

#Preview {
    NavigationStack {
        DailyStatisticsView(showDailyStats: .constant(false), dataManager: .preview)
    }
}
