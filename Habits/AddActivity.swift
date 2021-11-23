//
//  AddActivity.swift
//  Habits
//
//  Created by Jameson Hurst on 11/23/21.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var data: Activities
    @State private var title = ""
    @State private var description = ""

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Activity")
            .toolbar {
                Button("Save") {
                    let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                    guard trimmedTitle.isEmpty == false else { return }

                    let activity = Activity(title: trimmedTitle, description: description)
                    data.activities.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(data: Activities())
    }
}
