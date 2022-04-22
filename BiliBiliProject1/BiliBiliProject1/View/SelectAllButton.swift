//
//  SelectAllButton.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/21.
//

import SwiftUI

struct SelectAllButton: View {
    @EnvironmentObject var userData:Todo
    @Binding var selection:[Int]
    var body: some View {
        Text("Select All")
            .onTapGesture {
                userData.TodoList.forEach {selection.append($0.id)}
            }
    }
}

struct SelectAllButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectAllButton(selection: ContentView().$selection)
            .environmentObject(ContentView().userData)
    }
}
