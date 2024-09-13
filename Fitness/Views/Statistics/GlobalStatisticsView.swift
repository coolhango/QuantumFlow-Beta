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

struct GlobalStatisticsView: View {
    @StateObject var viewModel: GlobalStatisticsViewModel
    @State private var selection: Period = .week
    @State private var showDailyStats = false
    let dataManager: CoreDataManager

    init(dataManager: CoreDataManager) {
        self.dataManager = dataManager
        self._viewModel = .init(wrappedValue: GlobalStatisticsViewModel(dataManager: dataManager))
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                List {
                    Picker("", selection: $selection) {
                        ForEach(Period.allCases, id: \.self) { period in
                            Text(period.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    .background(Color(UIColor.secondarySystemBackground))
                    Group {
                        VStack(alignment: .leading) {
                            ChartTitleView(title: "Distance travelled")
                            PeriodChartView(
                                selection: $selection,
                                metric: viewModel.distances)
                        }
                        VStack(alignment: .leading) {
                            ChartTitleView(title: "Calories burned")
                            PeriodChartView(
                                selection: $selection,
                                metric: viewModel.calories)
                        }
                        VStack(alignment: .leading) {
                            ChartTitleView(title: "Steps taken")
                            PeriodChartView(
                                selection: $selection,
                                metric: viewModel.steps)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .padding(.top)
                .navigationTitle("Statistics")
                .toolbar {
                    Button {
                        withAnimation {
                            showDailyStats.toggle()
                        }
                    } label: {
                        VStack {
                            Image(systemName: "calendar")
                                .font(.title2)
                            Text("Daily stats")
                                .font(.subheadline)
                                .padding(.vertical, 1)
                        }
                        .padding(.top)
                    }
                    .fullScreenCover(isPresented: $showDailyStats) {
                        NavigationStack {
                            DailyStatisticsView(showDailyStats: $showDailyStats, dataManager: dataManager)
                        }
                    }
                }
                
            }
            .onAppear { viewModel.updateView() } // to update goals
        }
    }
}

#Preview {
    GlobalStatisticsView(dataManager: .preview)
}

struct ChartTitleView: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.subheadline)
    }
}
