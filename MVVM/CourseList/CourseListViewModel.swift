//
//  CourseListViewModel.swift
//  MVVM
//
//  Created by Sergey on 11.09.2021.
//

import Foundation

protocol CourseListViewModelProtocol: AnyObject {
    var courses: [Course] { get } // стартовый экран инит не нужен но нужен массив с типом Course
    func fetchCourses(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) ->  TableViewCellViewModelProtocol?
    func viewModelForSelectedRow(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol?
}




// создаем класс и подписываем его под этот протокол
class CourseListViewModel: CourseListViewModelProtocol {
    func cellViewModel(at indexPath: IndexPath) -> TableViewCellViewModelProtocol? {
        let course = courses[indexPath.row]
       return TableViewCellViewModel(course: course)
    }
    
 
  
    
    var courses: [Course] = []
    
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { courses in
            self.courses = courses
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func numberOfRows() -> Int {
        courses.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> TableViewCellViewModelProtocol {
        let course = courses[indexPath.row]
       return TableViewCellViewModel(course: course)
        
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol? {
        let course = courses[indexPath.row]
        return CourseDetailsViewModel(course: course)
    }
    
}
