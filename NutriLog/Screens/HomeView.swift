import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
        TabView{
            Tab("Journée", systemImage: "sun.max"){
                DailySummaryView()
            }
            Tab("Graphiques", systemImage: "chart.bar.fill"){
                DailyChartsView()
            }
            
        }
        .accentColor(Color("nutrilog_orange"))
        
    }
}

#Preview {
    HomeView()
        .modelContext(PersistenceController.preview.context)
}
