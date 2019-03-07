//
//  Manager.swift
//  TableView
//
//  Created by Symbat Bashkeyeva on 3/3/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
class Manager {
    var teachers=TeacherGenerator.getTeacher()
    var currentIndex=0
    func getCurrentTeacher()-> Teacher{
        return teachers[currentIndex]
    }
}
