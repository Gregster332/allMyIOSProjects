//
//  ProgressViewModel.swift
//  Hydartion
//
//  Created by Григорий on 24.04.2021.
//

import Foundation
import RealmSwift

class ProgressViewModel: ObservableObject {
    
    @Published var progress = 0.0
    @Published var values: [Progress] = []
   
    @Published var updatetdObject: Progress?
    
    init() {
        
    }
    
    func fetchData(){
        
        guard let dbRef = try? Realm() else{return}
        
        let progress = dbRef.objects(Progress.self)
        
        if progress.last?.id == Date().toString() {
            self.progress = progress.last!.progress
        } else {
            deinitData()
            
        }
        
        self.values = progress.compactMap({ (prog) -> Progress? in
            return prog
        })
    }
    
    func addData() {
        
        if progress == 0.0 {return}
        
        let progress = Progress()
        progress.progress += self.progress
        
        
        if values.last?.id == Date().toString() {
            deleteData(prog: values.last!)
            
        }
        
        guard let dbRef = try? Realm() else {return}
        
        dbRef.beginWrite()
        dbRef.add(progress)
        updatetdObject = progress
        try! dbRef.commitWrite()
        
        
        guard let obj = updatetdObject else {return}
        
        
        
        values.append(obj)
        
        
        print(progress.progress)
        
    }
    
    func deleteData(prog: Progress) {
        
        guard let dbRef = try? Realm() else {return}
        
        dbRef.beginWrite()
        dbRef.delete(prog)
        fetchData()
        try! dbRef.commitWrite()
        
    }
    
    func deinitData() {
        updatetdObject = nil
        self.progress = 0.0
        
    }
    
}
