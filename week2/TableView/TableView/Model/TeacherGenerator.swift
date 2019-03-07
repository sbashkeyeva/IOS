//
//  TeacherGenerator.swift
//  TableView
//
//  Created by Symbat Bashkeyeva on 3/3/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
class TeacherGenerator{
    static func getTeacher()->[Teacher]{
        var teacher=[Teacher]()
        teacher.append(Teacher.init(name: "Eibay", subject: "Piano", image: "sheeran"))
        teacher.append(Teacher.init(name: "Amina", subject: "Vocal", image: "rihanna"))
        teacher.append(Teacher.init(name: "Fatima", subject: "Dance", image: "nikiminaj"))
        
        return teacher
    }
}
