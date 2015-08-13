//
//  Employee.swift
//  LoanShark
//
//  Created by James Kim on 8/12/15.
//
//

import Foundation

class Employee {
    var name : String
    var gender : Gender
    var educationLevel : EducationLevel
    var persuasionSkill : Int
    var informSkill : Int
    var intimidationSkill : Int
    
    init(name : String, gender : Gender, educationLevel : EducationLevel, persuasionSkill : Int, informSkill : Int, intimidationSkill : Int){
        self.name = name
        self.gender = gender
        self.educationLevel = educationLevel
        self.persuasionSkill = persuasionSkill
        self.informSkill = informSkill
        self.intimidationSkill = intimidationSkill
    }
    
    
}