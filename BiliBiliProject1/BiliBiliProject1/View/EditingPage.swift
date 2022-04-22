//
//  EditingPage.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/20.
//

import SwiftUI

struct EditingPage: View {
    
    @State var title:String = ""
    @State var dueDate:Date = Date()
    @State var isFavorite:Bool = false
    
    @EnvironmentObject var userData:Todo
    
    @Environment(\.presentationMode) var presentation
    
    var id:Int? = nil
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Things")){
                    TextField("Content", text: $title)
                    DatePicker(selection: $dueDate, label: { Text("Date") })
                }//section
                
                Section{
                    Toggle(isOn: self.$isFavorite) {
                        Text("Favoirte")
                    }
                }//section
                
                Section{
                    Button {
                        if self.id == nil{
                            self.userData.add(data: SingleToDo(isFavorite: self.isFavorite, title: self.title, dueDate: self.dueDate))
                        }else{
                            self.userData.edit(id: self.id!, data: SingleToDo(isFavorite: self.isFavorite, title: self.title, dueDate: self.dueDate))
                        }//if..else
                        
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("Confirm")
                    }//button

                    Button {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("Delete")
                    }//button

                    
                }//section
            }//form
            .navigationTitle("Add")
        }//navigationview
        
    }//body
}

struct EditingPage_Previews: PreviewProvider {
    static var previews: some View {
        EditingPage()
    }
}
