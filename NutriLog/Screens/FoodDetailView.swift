import SwiftUI

struct FoodDetailView: View {
    let food: FoodEntry
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("\(food.food?.name ?? "Erreur")")
                .font(.largeTitle)
                .bold()
                .padding(.top, 70)
            HStack{
                Text("\(food.calories.rounded().formatted()) cal")
                    .font(.title2)
                    .foregroundStyle(.gray)
                    .padding(.top, 15)
                
                HStack {
                    VStack{
                        Text("\(food.food?.protein.rounded().formatted() ?? "Erreur") g")
                            .bold()
                        Text("Protéines")
                            .foregroundStyle(.gray)
                    }
                    VStack{
                        Text("\(food.food?.carbs.rounded().formatted() ?? "Erreur") g")
                            .bold()
                        Text("Glucides")
                            .foregroundStyle(.gray)
                    }
                    VStack{
                        Text("\(food.food?.fat.rounded().formatted() ?? "Erreur") g")
                            .bold()
                        Text("Lipides")
                            .foregroundStyle(.gray)
                    }
                }
                .offset(x: 70, y: 10)
            }
        
            VStack (alignment: .leading) {
                Text("Historique de consommation")
                    .bold()
                    .font(.title3)
                    .padding(.top, 10)
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("\(food.mealType.rawValue)")
                            .bold()
                        Text("\(food.date.formatted(date: .long, time: .omitted))")
                            .foregroundStyle(.gray)
                        
                    }
                    
                    Spacer()
                    Text("\(food.servingSize.rounded().formatted()) g")
                        .foregroundStyle(.gray)
                }
                .padding(.top, 10)
            }
            
        }
        .frame(width: 300)
        .offset(x: -40, y: -250)
        
    }
        
}

#Preview {
    FoodDetailView(food : MockData.foodEntries[0])
}
