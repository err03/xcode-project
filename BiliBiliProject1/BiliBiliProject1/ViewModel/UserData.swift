//
//  UserData.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/20.
//

import Foundation
import UserNotifications

var encoder = JSONEncoder() //编码器
var decoder = JSONDecoder() //解码器

let nc = UNMutableNotificationContent()

class Todo:ObservableObject{
    @Published var TodoList:[SingleToDo]    //如果这个数组改变了，那么程序就会去找到所有用到这个数组的UI去改变
    var count = 0
    
    init(){
        self.TodoList = []
    }//init
    
    init(data:[SingleToDo]){
        self.TodoList = []
        for item in data{
            TodoList.append(SingleToDo(id: count, isFavorite: item.isFavorite, title: item.title, dueDate: item.dueDate,isChecked: item.isChecked))
            count += 1
        }
    }//iniit
    
    func check(id:Int){
        self.TodoList[id].isChecked.toggle()
        self.dataStore()
    }
    
    func add(data:SingleToDo){
                                            //optional: self.count
        self.TodoList.append(SingleToDo(id: self.TodoList.count, isFavorite: data.isFavorite, title: data.title, dueDate: data.dueDate))
        self.count += 1 //if use "self.count" here will count += 1, else use TodoList.count will get the same effects
        
        self.sort()
        
        self.dataStore()
        self.sendNotification(id: self.TodoList.count-1)
    }
    
    func edit(id:Int,data:SingleToDo){
        self.withdrawNotification(id: id)
        self.TodoList[id].title = data.title
        self.TodoList[id].dueDate = data.dueDate
        self.TodoList[id].isChecked = false     //真正编辑，所以处于未完成状态
        self.TodoList[id].isFavorite = data.isFavorite
        
        self.sort()
        
        self.dataStore()
        self.sendNotification(id: id)
    }
    
    func sort(){
        self.TodoList.sort { data1, data2 in
            return data1.dueDate.timeIntervalSince1970 < data2.dueDate.timeIntervalSince1970
        }
        
        //重制ID
        for i in 0 ..< self.TodoList.count{
            self.TodoList[i].id = i
        }
    }
    
    func delete(id:Int){
        self.withdrawNotification(id: id)
        self.TodoList[id].deleted = true
        self.sort()
        
        self.dataStore()
    }
    
    func dataStore(){
        let dateStored = try! encoder.encode(self.TodoList)  //encoder可能会抛出错误，所以需要try，但是强制性，因为认定它不会抛出错误
        UserDefaults.standard.set(dateStored, forKey: "TodoList")
    }
    
    func sendNotification(id:Int){
        nc.title = self.TodoList[id].title
        nc.subtitle = "subtitme"
        nc.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: self.TodoList[id].dueDate.timeIntervalSinceNow, repeats: false)   //在这个时间之后，这个trigger就会触发
        let request = UNNotificationRequest(identifier: self.TodoList[id].title + self.TodoList[id].dueDate.description, content: nc, trigger: trigger) //identifier: 标定唯一的身份，这样就能区分每一个不同的通知，方便撤回
        
        UNUserNotificationCenter.current().add(request) { error in
            print("usernotificaiton center add request error :\(String(describing: error))")
        }
    }
    
    func withdrawNotification(id:Int){
        let identifierKey = self.TodoList[id].title + self.TodoList[id].dueDate.description
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [identifierKey])   //这个是撤回已经发送的通知
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifierKey])  //这个是撤回还在等待发送的通知
    }
}//class Todo List

