import SwiftUI

////Array of tasks...
struct TaskSample: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [TaskSample]
    var taskDate: Date
}

////sample date for testing...
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

//sample tasks...
var tasks: [TaskMetaData] = [
//    TaskMetaData(task: [
//        TaskSample(title: "Period"),
//    ], taskDate: getSampleDate(offset: -1)),
]


