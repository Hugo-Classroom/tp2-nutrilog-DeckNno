import Foundation
import SwiftData

@Model
class Food {
    var name: String
    
    // Macros pour 100 grammes de l'aliment
    // Donc, si on prend un repas de 200g, il faut doubler ces valeurs.
    var calories: Double
    var protein: Double
    var carbs: Double
    var fat: Double
    var desc: String

    init(name: String, calories: Double, protein: Double, carbs: Double, fat: Double, desc: String) {
        self.name = name
        self.calories = calories
        self.protein = protein
        self.carbs = carbs
        self.fat = fat
        self.desc = desc
    }
}
