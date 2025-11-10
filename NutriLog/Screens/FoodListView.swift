//
//  FoodListView.swift
//  NutriLog
//
//  Created by Cédrick Noël on 2025-11-06.
//

import SwiftUI

struct FoodListView: View {
    let food: Food
    
    var body: some View {
        
        HStack{
            VStack (alignment: .leading) {
                Text(food.name)
                Text("\(food.desc)")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            Text("\(food.calories.rounded().formatted()) kcal")
                
        }
        
    }
}

#Preview {
    FoodListView(food : MockData.proteinFood)
}
