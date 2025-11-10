import SwiftUI

struct FoodDetailView: View {
    let food: Food
    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("\(food.name)")
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
                        Text("\(food.protein.rounded().formatted()) g")
                            .bold()
                        Text("Protéines")
                            .foregroundStyle(.gray)
                    }
                    VStack{
                        Text("\(food.carbs.rounded().formatted()) g")
                            .bold()
                        Text("Glucides")
                            .foregroundStyle(.gray)
                    }
                    VStack{
                        Text("\(food.fat.rounded().formatted()) g")
                            .bold()
                        Text("Lipides")
                            .foregroundStyle(.gray)
                    }
                }
                .offset(x: 70, y: 10)
            }
        
            Text("Historique de consommation")
                .bold()
                .font(.title3)
                .padding(.top, 10)
        }
        .frame(width: 300)
        .offset(x: -40, y: -300)
        
    }
        
}

#Preview {
    FoodDetailView(food : MockData.proteinFood)
}
