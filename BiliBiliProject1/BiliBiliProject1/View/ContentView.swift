//
//  ContentView.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/19.
//

import SwiftUI
import CoreData

var formatter = DateFormatter()

func initUserData() -> [SingleToDo]{
    
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    var output:[SingleToDo] = []
    
    if let dataStored = UserDefaults.standard.object(forKey: "TodoList") as? Data{
        
        do{
            let data = try decoder.decode([SingleToDo].self, from: dataStored)
            for item in data{
                if !item.deleted {
                    output.append(SingleToDo(id: output.count,isFavorite: item.isFavorite, title: item.title, dueDate: item.dueDate, isChecked: item.isChecked))
                }//if
            }//for
        }catch{
            print("error :\(error)")
        }//do..catch
    }//if let
    
    return output
}//initUserData

//MARK: ContentView
struct ContentView: View {
    
    @ObservedObject var userData:Todo = Todo(data: initUserData())
    @State var selection:[Int] = []
    
    @State var showEditingPage:Bool = false
    @State var editingMode:Bool = false
    @State var animationValue:CGFloat = 0
    @State var showLikeOnly = false
    
    //MARK: body
    var body: some View {
        
        ZStack{ //zStack,最前面是最底层，最后面是最上层
            NavigationView{
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        ForEach(userData.TodoList){item in
                            if !item.deleted{
                                
                                if !self.showLikeOnly || item.isFavorite{
                                    SingleCardView(index:item.id, editingMode: self.$editingMode, selection: self.$selection, animatinoValue: self.$animationValue)
                                        .environmentObject(userData)
                                        .padding(.top)
                                        .padding(.horizontal)
                                        .animation(.spring(), value: animationValue)
                                        .zIndex(1)
                                }//if
                                
                            }//if
                        }//foreach
                    }//vstack
                }//scrollView
                .navigationTitle("Things")
                .toolbar {
                    
                    ToolbarItem(placement:.primaryAction){
                        HStack(spacing:10){
                            if self.editingMode{
                                DeleteButton(selection: self.$selection, animationValue: self.$animationValue, editingMode: self.$editingMode)
                                    .environmentObject(self.userData)
                                LikeButton(selection: self.$selection, editingMode: self.$editingMode)
                                    .environmentObject(self.userData)
                                SelectAllButton(selection: self.$selection)
                                    .environmentObject(self.userData)
                            }else{
                                ShowLikeButton(showLikeOnly: self.$showLikeOnly)
                            }//if..else
                            EditingButton(editingMode: self.$editingMode, selection: self.$selection, animationValue: self.$animationValue)
                            
                        }//hstack
                    }//toolBaritem
                    
                }//toolbar
            }//navigationview
            
            
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    
                    Button {
                        self.showEditingPage = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .padding(.trailing)
                    }//button
                    .sheet(isPresented: self.$showEditingPage) {
                        EditingPage()
                            .environmentObject(self.userData)
                    }//sheet

                }//ZStack
            }//HStack
            
        }//ZStack
    }//bodys
}//struct ContentView

//MARK: SingleCardView
struct SingleCardView:View{
    var index:Int
    @EnvironmentObject var userData:Todo    //由于是类是从父类传过来的，如果不加上@EnviornmentObject 的话，父类更新，子类就不会更新
    @State var showEditingPage = false
    @Binding var editingMode:Bool
    @Binding var selection:[Int]
    @Binding var animatinoValue:CGFloat
    
    var body: some View {
        HStack{
            
            Rectangle()
                .frame(width: 4)
                .foregroundColor(Color("Card\(self.index%4)"))
            
            if self.editingMode{
                Button {
                    self.userData.delete(id: self.index)
                    animatinoValue += 1
                    self.editingMode = false
                } label: {
                    Image(systemName: "trash")
                        .imageScale(.large)
                        .padding(.leading)
                }//button
            }//if
            
            Button {
                if !self.editingMode{
                    self.showEditingPage = true
                }
            } label: {
                Group {
                    VStack(alignment: .leading, spacing: 6){
                        Text(userData.TodoList[index].title)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text(formatter.string(from: userData.TodoList[index].dueDate))
                            .font(.headline)
                            .foregroundColor(.gray)
                    }//VStack
                    .padding(.leading)
                    Spacer()
                }//group
            }//Button
            .sheet(isPresented: self.$showEditingPage) {
                EditingPage(
                    title:userData.TodoList[self.index].title,
                    dueDate:userData.TodoList[self.index].dueDate,
                    isFavorite: userData.TodoList[self.index].isFavorite,
                    id: self.index)
                    .environmentObject(self.userData)
            }//sheet
            
            if self.userData.TodoList[index].isFavorite{
                Image(systemName: "star.fill")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }
            
            if !self.editingMode{
                Image(systemName: userData.TodoList[index].isChecked ? "checkmark.square.fill" : "square")
                    .imageScale(.large)
                    .padding(.trailing)
                    .onTapGesture {
                        userData.check(id: index)
                    }
            }else{
                let targetIndex = self.selection.firstIndex(where: {
                    $0 == self.index
                })
                Image(systemName: targetIndex == nil ? "circle" : "checkmark.circle.fill")
                    .imageScale(.large)
                    .padding(.trailing)
                    .onTapGesture {
                        if targetIndex == nil{
                            self.selection.append(index)
                        }else{
                            self.selection.remove(at: targetIndex!)
                        }//if..else
                    }//onTapGesture
            }//if..else
                
        }//HStack
        .frame(height: 80)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10,x: 0,y:10)
    }//body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userData: Todo(data:[
            SingleToDo(isFavorite: false, title:"Internship",dueDate: Date()),
            SingleToDo(isFavorite: false, title:"Job",dueDate: Date()),
            SingleToDo(isFavorite: false, title:"Homework",dueDate: Date())
        ])//Todo
        )//contentView
    }//preview
}//ContentView_Previews
