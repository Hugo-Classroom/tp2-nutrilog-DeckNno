import Foundation

extension MockData {
    static let foodEntries: [FoodEntry] = [
       // TODO: Faites-vous des mocks pour les repas en utilisant les aliments!
         
        chicken, egg, salmon
        
    ]
}

let chicken = FoodEntry(
    food: MockData.proteinFood,
    servingSize: 200, // en grammes (ex: 150 g)
    mealType: MealType.dinner
)

let egg = FoodEntry(
    food: MockData.boiledEgg,
    servingSize: 200, // en grammes (ex: 150 g)
    mealType: MealType.breakfast
)

let salmon = FoodEntry(
    food: MockData.grilledSalmon,
    servingSize: 200, // en grammes (ex: 150 g)
    mealType: MealType.lunch
)
