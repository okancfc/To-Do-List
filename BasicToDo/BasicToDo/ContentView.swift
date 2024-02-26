//
//  ContentView.swift
//  BasicToDo
//
//  Created by Okan Çifçi on 13.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: String = ""
    
    @State var list: [String] = []
    
    @State var completedTasks: [String] = []
    
    var body: some View {
        VStack {
            Text("To-Do List 🪶")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            TextField("Enter your task..", text: $text)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal,10)
                .shadow(color: .black, radius: 10)
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
            Button(action: {
                list.append(text)
                text = ""
            }, label: {
                Text("Save".uppercased())
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            .padding(.horizontal, 50)
                List {
                        ForEach(list, id: \.self) { item in
                            HStack {
                                Button(action: {
                                    UIImpactFeedbackGenerator().impactOccurred()
                                    if let index = completedTasks.firstIndex(of: item) {
                                        completedTasks.remove(at: index)
                                    } else {
                                        completedTasks.append(item)
                                    }
                                }, label: {
                                    Image(systemName: completedTasks.contains(item) ? "checkmark.circle.fill" : "checkmark.circle")
                                        .resizable()
                                        .foregroundStyle(completedTasks.contains(item) ? Color.green : Color.gray)
                                        .frame(width: 25, height: 25)
                                })
                                .buttonStyle(.plain)
                                Text((item))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Button(action: {
                                    if let index = list.firstIndex(of: item) {
                                        list.remove(at: index)
                                    }
                                }, label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                })
                                .buttonStyle(.plain)
                            }
                        
                    }
                    
                }
                .listStyle(PlainListStyle())
            
        }
    }
}
#Preview {
    ContentView()
}
