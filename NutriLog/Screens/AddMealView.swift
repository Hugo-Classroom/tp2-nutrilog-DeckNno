import SwiftUI

var grams = 100

struct AddMealView: View {
    @State private var food: Food?
    
    
    
    var body: some View {
        VStack {
            Text("Ajouter une entrée")
                .bold()
                .padding(.top, 15)
            Form {
                VStack (alignment: .center) {
                    Picker("", selection: $food) {
                        Text("Selectionner")
                        ForEach(MockData.foods) { food in
                            Text("\(food.name)").tag(food)
                        }
                    }.pickerStyle(.menu)
                    
                    HStack {
                        Text("Portions: \(grams)g")
                        Spacer()
                        
                        HStack {
                            Button(action: minusGrams) {
                                Image(systemName: "minus")
                                    .foregroundStyle(.black)
                            }
                            Rectangle()
                                .frame(width: 1, height: 15)
                                .foregroundStyle(.gray)
                                .padding(.horizontal, 4)
                            Button(action: addGrams) {
                                Image(systemName: "plus")
                                    .foregroundStyle(.black)
                            }
                        }
                        .frame(width: 80, height: 27)
                        .background(Color("list_color"))
                        .cornerRadius(7)
                    }
                    .padding(.vertical, 10)
                    
                    Picker("", selection: $food) {
                        Text("Déjeuner")
                        Text("Dîner")
                        Text("Souper")
                    }.pickerStyle(.segmented)
                }
            }
            .accentColor(Color("nutrilog_orange"))
            .formStyle(.columns)
            .padding(.horizontal, 20)
             
            HStack {
                VStack (alignment: .leading) {
                    Text("Macros pour \(grams)g")
                        .bold()
                        .font(.title3)
                        .padding(.top, 10)
                    HStack {
                        Text("Calories: ")
                        Spacer()
                        Text("\(food?.calories.rounded().formatted() ?? 0.rounded().formatted()) kcal")
                            .bold()
                    }
                    .padding(3)
                    HStack {
                        Text("Protéines: ")
                        Spacer()
                        Text("\(food?.protein.rounded().formatted() ?? 0.rounded().formatted()) g")
                            .bold()
                    }
                    .padding(3)
                    HStack {
                        Text("Glucides: ")
                        Spacer()
                        Text("\(food?.carbs.rounded().formatted() ?? 0.rounded().formatted()) g")
                            .bold()
                    }
                    .padding(3)
                    HStack {
                        Text("Gras: ")
                        Spacer()
                        Text("\(food?.fat.rounded().formatted() ?? 0.rounded().formatted()) g")
                            .bold()
                    }
                    .padding(3)
                }
                .padding(10)
                .background(Color("list_color"))
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.top, 15)
            
            Spacer()
            Button(action: addDishesToList) {
                Text("Sauvegarder")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("nutrilog_orange"))
                    .foregroundStyle(.white)
                    .cornerRadius(8)
            }
            .padding()
            
        }
    }
}

private func addDishesToList() {
    
}

private func addGrams() {
    grams+=1
}

private func minusGrams() {
    if (grams > 0) {
        grams-=1
    } else {
        grams = 0
    }
}

#Preview {
    AddMealView()
}
