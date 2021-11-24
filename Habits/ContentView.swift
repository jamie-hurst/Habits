//
//  ContentView.swift
//  Habits
//
//  Created by Jameson Hurst on 11/23/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.activities) {
                    activity in
                    NavigationLink {
                        ActivityView(data: data, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.title)
                            Spacer()
                            
                            Text(String(activity.completionCount))
                                .font(.footnote.bold())
                                .foregroundColor(.black)
                                .padding(10)
                                .frame(minWidth: 50)
                                .background(color(for: activity))
                                .clipShape(Capsule())
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habits")
            .preferredColorScheme(.dark)
            
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        addingNewActivity.toggle()
                    } label: {
                        Label("New Activity", systemImage: "plus")
                            .labelStyle(.titleAndIcon)
                    }
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
        }
    }
    
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            return .dracRed
        } else if activity.completionCount < 10 {
            return .dracOrange
        } else if activity.completionCount < 20 {
            return .dracGreen
        } else if activity.completionCount < 50 {
            return .dracCyan
        } else {
            return .dracPurple
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        data.activities.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
