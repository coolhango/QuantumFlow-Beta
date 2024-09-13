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
import CoreData

// MARK: Fetch requests returning all objects for each Entity
extension CoreDataManager {
    func fetchWorkouts() {
        let request = NSFetchRequest<WorkoutEntity>(entityName: "WorkoutEntity")
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(WorkoutEntity.date), ascending: false)]
        do {
            workouts = try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
    }

    func fetchDistance() {
        let request = NSFetchRequest<DistanceEntity>(entityName: "DistanceEntity")
        do {
            distances = try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
    }

    func fetchSpeed() {
        let request = NSFetchRequest<SpeedEntity>(entityName: "SpeedEntity")
        do {
            speeds = try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
    }

    func fetchSteps() {
        let request = NSFetchRequest<StepEntity>(entityName: "StepEntity")
        do {
            steps = try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
    }

    func fetchCalories() {
        let request = NSFetchRequest<CalorieEntity>(entityName: "CalorieEntity")
        do {
            calories = try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
    }
}

// MARK: Fetch requests returning objects for specific Workout
extension CoreDataManager {
    internal func getWorkout(withId worKoutId: UUID) -> [WorkoutEntity] {
        let request = NSFetchRequest<WorkoutEntity>(entityName: "WorkoutEntity")
        request.predicate = NSPredicate(
            format: "%K == %@", #keyPath(WorkoutEntity.uuid), worKoutId as NSUUID)
        do {
            return try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
        return [WorkoutEntity]()
    }

    internal func getDistance(for worKoutId: UUID) -> [DistanceEntity] {
        let request = NSFetchRequest<DistanceEntity>(entityName: "DistanceEntity")
        request.predicate = NSPredicate(
            format: "%K == %@", #keyPath(DistanceEntity.id), worKoutId as NSUUID)
        do {
            return try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
        return [DistanceEntity]()
    }

    internal func getSpeed(for worKoutId: UUID) -> [SpeedEntity] {
        let request = NSFetchRequest<SpeedEntity>(entityName: "SpeedEntity")
        request.predicate = NSPredicate(
            format: "%K == %@", #keyPath(SpeedEntity.id), worKoutId as NSUUID)
        do {
            return try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
        return [SpeedEntity]()
    }

    internal func getSteps(for worKoutId: UUID) -> [StepEntity] {
        let request = NSFetchRequest<StepEntity>(entityName: "StepEntity")
        request.predicate = NSPredicate(
            format: "%K == %@", #keyPath(StepEntity.id), worKoutId as NSUUID)
        do {
            return try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
        return [StepEntity]()
    }

    internal func getCalories(for worKoutId: UUID) -> [CalorieEntity] {
        let request = NSFetchRequest<CalorieEntity>(entityName: "CalorieEntity")
        request.predicate = NSPredicate(
            format: "%K == %@", #keyPath(CalorieEntity.id), worKoutId as NSUUID)
        do {
            return try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
        return [CalorieEntity]()
    }
}

// MARK: Fetch requests for filtering Workouts
extension CoreDataManager {
    func fetchWorkouts(request: NSFetchRequest<WorkoutEntity>) -> [WorkoutEntity] {
        do {
            return try persistenceController.container.viewContext.fetch(request)
        } catch {
            print(error)
        }
        return []
    }

    func filterWorkouts(predicate: FilteredWorkoutType) {
        let request = NSFetchRequest<WorkoutEntity>(entityName: "WorkoutEntity")
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(WorkoutEntity.date), ascending: false)]
        if predicate == .running {
            request.predicate = NSPredicate(format: "%K == %i", #keyPath(WorkoutEntity.type), WorkoutType.running.rawValue)
            filteredWorkouts = fetchWorkouts(request: request)
        } else if predicate == .walking {
            request.predicate = NSPredicate(format: "%K == %i", #keyPath(WorkoutEntity.type),  WorkoutType.walking.rawValue)
            filteredWorkouts = fetchWorkouts(request: request)
        } else if predicate == .cycling {
            request.predicate = NSPredicate(format: "%K == %i", #keyPath(WorkoutEntity.type), WorkoutType.cycling.rawValue)
            filteredWorkouts = fetchWorkouts(request: request)
        } else { filteredWorkouts = fetchWorkouts(request: request) }
    }
}
