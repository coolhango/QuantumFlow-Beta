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

struct WeekView: View {
    @Namespace var animation
    let selectedDate: Date
    let currentWeek: [Date]
    let action: (Date) -> ()
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(currentWeek, id: \.self) { day in
                VStack(spacing: 10) {
                    Text(extractDate(date: day, format: "dd"))
                    Text(extractDate(date: day, format: "EEE"))
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                        .opacity(isSameDate(selectedDate, and: day) ? 1 : 0)
                }
                .frame(width: 45, height: 90)
                .foregroundStyle(isSameDate(selectedDate, and: day) ? Color.white : Color.secondary)
                .fontWeight(.semibold)
                .background(
                    ZStack {
                        if isSameDate(selectedDate, and: day) {
                            Capsule()
                                .fill(Color.accentColor)
                                .matchedGeometryEffect(id: "selection", in: animation)
                        }
                    }
                )
                .contentShape(Capsule())
                .onTapGesture {
                    action(day)
                }
            }
        }
        .padding(.horizontal)
    }

    private func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }

    private func isSameDate(_ date1: Date, and date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}

#Preview {
    var currentWeek: [Date] {
        var currentWeek = [Date]()
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: Date())
        guard let firstWeekday = week?.start else { return [Date]() }
        (0...6).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekday) {
                currentWeek.append(weekday)
            }
        }
        return currentWeek
    }
    return WeekView(selectedDate: Date(), currentWeek: currentWeek) { _ in}
}
