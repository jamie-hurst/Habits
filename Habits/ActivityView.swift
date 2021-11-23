//
//  ActivityView.swift
//  Habits
//
//  Created by Jameson Hurst on 11/23/21.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var data: Activities
    var activity: Activity

    var body: some View {
        List {
            Section {
                if activity.description.isEmpty == false {
                    Text(activity.description)
                }
            }

            Section {
                HStack {
                    Text("Completion count: ")
                    Spacer()
                    
                    Text("\(activity.completionCount)")
                }
                

                Button("Mark Completed") {
                    var newActivity = activity
                    newActivity.completionCount += 1

                    if let index = data.activities.firstIndex(of: activity) {
                        data.activities[index] = newActivity
                    }
                }
            }
        }
        .navigationTitle(activity.title)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Activities(), activity: Activity.example)
    }
}
