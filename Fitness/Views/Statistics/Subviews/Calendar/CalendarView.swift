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

struct CalendarView: View {
    let selectedDate: Date
    let weeks: [[Date]]
    @State private var activeTab: Int = 1
    @State private var direction: TimeDirection = .none
    @State private var position = CGSize.zero
    let action: (Date) -> ()
    let update: (TimeDirection) -> ()

    var body: some View {
        TabView(selection: $activeTab) {
            WeekView(selectedDate: selectedDate,
                     currentWeek: weeks[0]) { day in
                action(day)
            }
            .frame(maxWidth: .infinity)
            .tag(0)

            WeekView(selectedDate: selectedDate,
                     currentWeek: weeks[1]) { day in
                action(day)
            }
            .frame(maxWidth: .infinity)
            .tag(1)
            .onDisappear() {
                guard direction != .none else { return }
                update(direction)
                direction = .none
                activeTab = 1
            }

            WeekView(selectedDate: selectedDate,
                     currentWeek: weeks[02]) { day in
                action(day)
            }
            .frame(maxWidth: .infinity)
            .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: activeTab) { value in
            if value == 0 {
                direction = .past
            } else if value == 2 {
                direction = .future
            }
        }
    }
}

#Preview {
    let calendarManager = CalendarManager()
    return CalendarView(
        selectedDate: calendarManager.selectedDate,
        weeks: calendarManager.weeks) { day in } update: { direction in }
}
