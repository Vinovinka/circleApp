import SwiftUI
import CoreData

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    // Fetching data
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results : FetchedResults<Task>
    
    @Environment(\.managedObjectContext) var context
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                
                //Custom Date Picker
                CustomDatePicker(currentDate: $currentDate)
                
            }
            
            Button(action: {
                homeData.isNewData.toggle()
            }, label: {
                
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        
                        AngularGradient(gradient: .init(colors: [Color("Orange"), Color("Pink")]), center: .center)
                    )
                    .clipShape(Circle())
            })
                .padding()
        }
        
        .sheet(isPresented: $homeData.isNewData, content: {
            NewDataView(homeData: homeData)
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
