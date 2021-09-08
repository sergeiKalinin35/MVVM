//
//  CourseDetailsViewController.swift
//  MVVM
//
//  Created by Sergey on 08.09.2021.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    
    
  //  var course: Course!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    

    
    
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            
            let navBarApperance = UINavigationBarAppearance()
            navBarApperance.configureWithOpaqueBackground()
            navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarApperance.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarApperance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarApperance

       }
    }

}

// MARK: - UITableViewDataSourse

extension CourseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseTableViewCell
        
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension CourseListViewController: UITableViewDelegate {
    
    
    
    
}






























