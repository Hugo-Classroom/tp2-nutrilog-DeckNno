import SwiftUI

struct DailyChartsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Text("Graphiques")
                            .bold()
                            .font(.largeTitle)
                            .offset(x: -85, y: -280)
                    }
                    .padding(.bottom, 30)
                    
                    HStack {
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    DailyChartsView()
}
