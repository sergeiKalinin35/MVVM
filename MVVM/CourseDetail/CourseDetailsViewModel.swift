//
//  CourseDetailsViewModel.swift
//  MVVM
//
//  Created by Sergey on 10.09.2021.
//

import Foundation


protocol CourseDetailsViewModelProtocol: AnyObject {
    var courseName: String { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var imageData: Data? { get }
    var isFavorite: Box<Bool> { get }
    init(course: Course)
    func changeFavoriteStatus()
}




class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    
  
    
    var courseName: String {
        course.name ?? ""
    }
    
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons ?? 0)"
        
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests ?? 0)"
        
    }
    
    
    var imageData: Data? {
        
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }
    
  
    
  
    var isFavorite: Box<Bool>
      
        
    
    
   
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
        isFavorite = Box(value: DataManager.shared.getFavoriteStatus(for: course.name ?? ""))
    }
    
    func changeFavoriteStatus() {
        isFavorite.value.toggle()
        DataManager.shared.setFavoriteStatus(for: course.name ?? "", with: isFavorite.value)
    }
    
}





