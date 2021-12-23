import SwiftUI
import CoreData

class HomeViewModel : ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    
    // For newData sheet
    
    @Published var isNewData = false
    
    // Checking and updating date
    
    // Storing Update item
    @Published var updateItem : Task!
    
    let calendar = Calendar.current
    
    func checkDate() -> String {
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            return "Other day"
        }

    }
    
    func updateDate(value: String) {
         
        if value == "Today" {
            date = Date()
        } else if value == "Tomorrow" {
            date = calendar.date(byAdding: .day, value: 1, to: Date())!
        } else {
            // do something
        }
    }
    
    func writeData(context : NSManagedObjectContext) {
        // Update item
        
        if updateItem != nil {
            // Means update old data
            updateItem.date = date
            updateItem.content = content
            
            try! context.save()
            
            // Removing updateItem if success
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            return
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        // Saving
        do {
            
            try context.save()
            
            // success means closing view
            isNewData.toggle()
            content = ""
            date = Date()
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func editItem(item: Task) {
        
        updateItem = item
        date = item.date!
        content = item.content!
        
        isNewData.toggle()
    }
    
}
