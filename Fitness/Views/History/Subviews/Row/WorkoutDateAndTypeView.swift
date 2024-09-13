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

struct WorkoutDateAndTypeView: View {
    let workout: Workout?

    var body: some View {
        HStack {
            Text(workout?.date?.formatted(date: .abbreviated, time: .omitted).uppercased() ?? "")
            Spacer()
            Text(workout?.date?.formatted(date: .omitted, time: .shortened) ?? "")
        }
        .font(.title2)
        .fontWeight(.bold)
        .foregroundStyle(Color.accentColor)
        HStack {
            Text(workout?.type?.name ?? "")
                .padding(5)
                .font(.caption)
                .foregroundStyle(.white)
                .background(Color.accentColor.opacity(0.7))
                .cornerRadius(8)
            Spacer()
        }
    }
}

#Preview {
    WorkoutDateAndTypeView(
        workout: PersistenceController.getWorkoutForPreview(persistenceController: PersistenceController.previewPersistenceController))
        .padding(.horizontal)
}
