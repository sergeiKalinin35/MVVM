//
//  CourseDetailsViewModel.swift
//  MVVM
//
//  Created by Sergey on 10.09.2021.
//

import Foundation


protocol CourseDetailsViewModelProtocol: class {
    var courseName: String { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var imageData: Data? { get }
    var isFavorite: Bool { get set }
    init(course: Course)
}


class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons ?? 0)"
        
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests ?? 0)"
        
    }
    
    var imageData: Data? {
        
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    var courseName: String {
        course.name ?? "" 
    }
    
  
    var isFavorite: Bool {
        get {// берем данные
            DataManager.shared.getFavoriteStatus(for: course.name ?? "")
            
        } set {
            
            DataManager.shared.setFavoriteStatus(for: course.name ?? "", with: newValue) // set coхраняем значение 
        }
    }
    
    
    
    
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
        
    }
}





