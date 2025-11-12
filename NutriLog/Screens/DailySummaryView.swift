import SwiftUI
import Charts

struct DailySummaryView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showAddForm = false
    
    var body: some View {
        
        let consumedCal = calculConsumedCal()
        let totalCal = Double(2500)
        NavigationStack {
            ZStack {
                Color("list_color").ignoresSafeArea(.all)
                VStack {
                    
                    HStack {
                        Text("Aujourd'hui")
                            .bold()
                            .font(.largeTitle)
                            .offset(x: -85, y: 30)
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
                                            Text("\((totalCal - consumedCal).formatted())")
                                                .bold()
                                            Text("cal")
                                                .foregroundStyle(.gray)
                                        }
                                        
                                    }
                                    
                                    CaloriesPercentInCercle(progression: Double(consumedCal)/Double(totalCal))
                                        .frame(width: 40)
                                        .padding(.leading, 14)
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
                                            Text("\(consumedCal.formatted())")
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
                                    nom: "Protéines", min: calculConsumedProt(), max: 150, color: .red)
                                macros(
                                    nom: "Glucides", min: calculConsumedGluci(), max: 125, color: .purple)
                                macros(
                                    nom: "Lipides", min: calculConsumedLipi(), max: 100, color: .blue)
                                
                            }
                        }
                        
                        Section(header: Text("DÉJEUNER")) {
                            ForEach(MockData.foodEntries.indices, id: \.self) { i
                                in
                                if (MockData.foodEntries[i].mealType == MealType.breakfast) {
                                    NavigationLink {
                                        FoodDetailView(food : MockData.foodEntries[i])
                                    } label: {
                                        FoodListView(food : MockData.foodEntries[i])
                                    }
                                }
                            }
                        }
                        Section(header: Text("DÎNER")) {
                            ForEach(MockData.foodEntries.indices, id: \.self) { i
                                in
                                if (MockData.foodEntries[i].mealType == MealType.lunch) {
                                    NavigationLink {
                                        FoodDetailView(food : MockData.foodEntries[i])
                                    } label: {
                                        FoodListView(food : MockData.foodEntries[i])
                                    }
                                }
                            }
                        }
                        Section(header: Text("SOUPER")) {
                            ForEach(MockData.foodEntries.indices, id: \.self) { i
                                in
                                if (MockData.foodEntries[i].mealType == MealType.dinner) {
                                    NavigationLink {
                                        FoodDetailView(food : MockData.foodEntries[i])
                                    } label: {
                                        FoodListView(food : MockData.foodEntries[i])
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                }
                .toolbar {
                    ToolbarItem {
                        Button {
                            showAddForm.toggle()
                        } label: {
                            Label("Ajouter une entrée", systemImage: "plus")
                        }
                    
                    }
                }
                .sheet(isPresented: $showAddForm) {
                    AddMealView()
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

private func calculConsumedCal() -> Double {
    var cal: Double

    cal = 0
    
    for food in MockData.foodEntries {
        cal += food.calories
    }
    
    return cal
}

private func calculConsumedProt() -> Double {
    var prot: Double

    prot = 0
    
    for food in MockData.foodEntries {
        prot += food.food?.protein ?? 0
    }
    
    return prot
}

private func calculConsumedGluci() -> Double {
    var gluci: Double
    
    gluci = 0
    
    for food in MockData.foodEntries {
        gluci += food.food?.carbs ?? 0
    }
    
    return gluci
}

private func calculConsumedLipi() -> Double {
    var lipi: Double
    
    lipi = 0
    
    for food in MockData.foodEntries {
        lipi += food.food?.fat ?? 0
    }
    
    return lipi
}


#Preview {
    DailySummaryView()
}
