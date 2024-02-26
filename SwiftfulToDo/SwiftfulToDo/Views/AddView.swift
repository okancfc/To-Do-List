 //
//  AddView.swift
//  SwiftfulToDo
//
//  Created by Okan Çifçi on 13.02.2024.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
        VStack{
            TextField("Type something here..", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            
            Button(action: {
                
            }, label: {
                Text("SAVE")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                })
            
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
