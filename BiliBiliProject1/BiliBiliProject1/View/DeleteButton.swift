//
//  DeleteButton.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/21.
//

import SwiftUI

//MARK: deleteButton
struct DeleteButton:View{
    
    @Binding var selection:[Int]
    @EnvironmentObject var UserData:Todo
    @Binding var animationValue:CGFloat
    @Binding var editingMode:Bool
    
    var body: some View{
        Button {
            for i in selection{
                self.UserData.delete(id: i)
            }
            animationValue += 1
            self.editingMode = false
        } label: {
            Image(systemName: "trash")
                .imageScale(.large)
        }//button
        
    }
}//deleteButton

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(selection: ContentView().$selection, animationValue: ContentView().$animationValue, editingMode: ContentView().$editingMode)
            .environmentObject(ContentView().userData)
    }
}
