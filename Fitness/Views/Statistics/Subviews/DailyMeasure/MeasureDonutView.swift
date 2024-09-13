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

struct MeasureDonutView: View {
    @Environment(\.colorScheme) private var colorScheme
    let measure: Double
    let formattedMeasure: String
    let unitOfMeasure: String
    let icon: String
    let goal: Double
    let height: CGFloat

    var body: some View {
        Circle()
            .strokeBorder(colorScheme == .dark ? .white.opacity(0.3) : .black.opacity(0.7), lineWidth: 40)
            .overlay {
                VStack(spacing: 5) {
                    Image(systemName: icon)
                        .font(.system(size: 50))
                    Text(formattedMeasure)
                    Text(unitOfMeasure)
                }
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.accentColor)
            }
            .overlay  {
                MeasureArc(measure: measure, goal: goal)
                    .rotation(Angle(degrees: -90))
                    .stroke(Color.accentColor, lineWidth: 20)
            }
            .frame(height: height)
    }
}

#Preview {
    VStack(spacing: 5) {
        MeasureDonutView(measure: 2236,
                         formattedMeasure: "2.236",
                         unitOfMeasure: Measure.distance.unitOfMeasure,
                         icon: Measure.distance.icon,
                         goal: 2500,
                         height: .infinity)
        MeasureDonutView(measure: 326,
                         formattedMeasure: "326",
                         unitOfMeasure: Measure.calorie.unitOfMeasure,
                         icon: Measure.calorie.icon,
                         goal: 350,
                         height: .infinity)
        MeasureDonutView(measure: 10350,
                         formattedMeasure: "10 350",
                         unitOfMeasure: Measure.step.unitOfMeasure,
                         icon: Measure.step.icon,
                         goal: 10000,
                         height: .infinity)
    }
}

struct MeasureArc: Shape {
    let measure: Double
    let goal: Double

    private var degreesPerUnit: Double {
        360.0 / goal
    }
    private var startAngle: Angle {
        Angle(degrees: 0)
    }
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerUnit * measure)
    }
        
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 40
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
