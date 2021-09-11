//
//  NetworkManager.swift
//  MVVM
//
//  Created by Sergey on 08.09.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let coursesURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    private init() {}
    
    
    func fetchData(completion: @escaping(_ courses: [Course]) -> Void {
    guard let url = URL(stribg: courseUrl) else { return }
    
    
    URLSession.shared.dataTask(with: url) { (data, _, _) in
    guard let data = data else { return }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    let courses = try decoder.decode([Course].self, from: data)
    completion(courses)
    
    } catch let error {
    print("Error serialization json", error)
    }
    
        }.resume()
    
    }
    
}




