import SwiftUI
import Charts

struct DailySummaryView: View {
    
    var body: some View {
        
        let consumedCal = 1214
        let totalCal = 2500
        NavigationStack {
            ZStack {
                Color("list_color").ignoresSafeArea(.all)
                VStack {
                    
                    HStack {
                        Button("", systemImage: "plus") {
                            
                        }
                        .accentColor(Color("nutrilog_orange"))
                        .imageScale(.large)
                        .fontWeight(.medium)
                        .offset(x: 260, y: 10)
                        
                        Text("Aujourd'hui")
                            .bold()
                            .font(.largeTitle)
                            .offset(x: -110, y: 30)
                    }
                    .padding(.bottom, 30)
                    
                    List {
                        Section(header: Text("CALORIES")) {
                            HStack {
                                HStack {
                                    VStack (alignment: .leading) {
                                        Text("Restantes")
                                            .bold()
                                        HStack {
                                            Text("\(totalCal - consumedCal)")
                                                .bold()
                                            Text("cal")
                                                .foregroundStyle(.gray)
                                        }
                                        
                                    }
                                    CaloriesPercentInCercle(progression: Double(consumedCal)/Double(totalCal))
                                        .frame(width: 40)
                                }
                                Spacer()
                                HStack{
                                    Color(.lightGray)
                                }
                                .frame(width: 1, height: 55)
                                .opacity(0.3)
                                
                                Spacer()
                                HStack {
                                    VStack (alignment: .leading) {
                                        Text("Consommées")
                                            .bold()
                                        HStack {
                                            Text("\(consumedCal)")
                                                .bold()
                                            Text("cal")
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                }
                            }
                        }
                        Section(header: Text("MACROS")) {
                            HStack {
                                macros(
                                    nom: "Protéines", min: 127, max: 150, color: .red)
                                macros(
                                    nom: "Glucides", min: 105, max: 125, color: .purple)
                                macros(
                                    nom: "Lipides", min: 35, max: 100, color: .blue)
                                
                            }
                        }
                        
                        Section(header: Text("DÉJEUNER")) {
                            
                            ForEach(MockData.foods.indices, id: \.self) { i
                                in
                                NavigationLink {
                                    FoodDetailView(food : MockData.proteinFood)
                                } label: {
                                    FoodListView(food : MockData.proteinFood)
                                }
                            }
                        }
                        Section(header: Text("DÎNER")) {
                            ForEach(MockData.foodEntries.indices, id: \.self) { i
                                in
                                NavigationLink {
                                    //  FoodDetailView(food : MockData.foodEntries.diner)
                                } label: {
                                    //  FoodListView(food : MockData.foodEntries.diner)
                                }
                            }
                        }
                        Section(header: Text("SOUPER")) {
                            ForEach(MockData.foodEntries.indices, id: \.self) { i
                                in
                                NavigationLink {
                                    // FoodDetailView(food : MockData.foodEntries.souper)
                                } label: {
                                    //FoodListView(food : MockData.foodEntries.souper)
                                }
                            }
                        }
                    }
                    
                    
                    
                }
            }
        }
    }
}

struct calories: Identifiable {
    let id = UUID()
    var kind: String
    var total: Double
    
}

struct macros: View {
    var nom: String
    var min: Double
    var max: Double
    var color: Color
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("\(nom.prefix(1))")
                    .font(.caption)
                    .bold()
                    .frame(width: 20, height: 20)
                    .background(color)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                Text("\(nom)")
                    .foregroundStyle(color)
            }
            .padding(.leading, 4)
            linePercent(
                min: Double(min), max: Double(max), color: color)
            .padding(.leading, 5)
            HStack {
                Text("\(min.rounded().formatted())")
                    .bold()
                Text("/")
                    .foregroundStyle(.gray)
                Text("\(max.rounded().formatted())g")
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 4)
        }
    }
}

struct CaloriesPercentInCercle: View {
    var progression: Double
    let lineWidth: CGFloat = 7
    let color: Color = .green
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.1)
                .foregroundStyle(.gray)
            
            Circle()
                .trim(from: 0, to: progression)
                .stroke(style : StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .foregroundColor(color)
                .rotationEffect(.degrees(-90))
        }
    }
}

struct linePercent: View {
    var min: Double
    var max: Double
    let lineWidth: CGFloat = 7
    var color: Color = .green
    
    var body: some View {
        HStack {
            ZStack (alignment: .leading){
                RoundedRectangle(cornerRadius: 9.9)
                    .opacity(0.1)
                    .foregroundStyle(.gray)
                    .frame(width: 100)
                
                RoundedRectangle(cornerRadius: 9.9)
                    .frame(width: min*100/max)
                    .foregroundColor(color)
                    
            }
            .frame(height: lineWidth)
        }
    }
    
}


#Preview {
    DailySummaryView()
}
