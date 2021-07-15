//
//  ContentView.swift
//  WeSplit
//
//  Created by Piotr Tyl on 15/07/2021.
//

import SwiftUI

struct ContentView: View {

    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPrice: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Int(numberOfPeople) ?? 2
        let amountPerPerson = totalPrice / Double(peopleCount)
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amout", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                    
                }
                
                Section(header: Text("How much tip do you want to leave?")){
                    
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Total price")) {
                    Text("$\(totalPrice, specifier: "%.2f")")
                }
                
            }
            .navigationTitle("We Split!")
        }
        
    }

            

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
