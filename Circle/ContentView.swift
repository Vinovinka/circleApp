
import SwiftUI
import CoreData


struct ContentView: View {
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        Home()
            .padding()
    }
}
