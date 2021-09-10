//
//  ViewController.swift
//  MVVM
//
//  Created by Sergey on 05.09.2021.
//

import UIKit

class CourseListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var courses: [Courses] = []
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }


}

private func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let detailVC =  segue.destination as! CourseDetailsViewController
    detailVC.course = sender as? Course
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



// MARK: - UITableViewDataSourse

extension CourseListViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseTableViewCell
    let course = courses[indexPath.row]
    
    return cell
}

}

// MARK: - UITableViewDelegate

extension CourseListViewController: UITableViewDelegate {
//  снимаем выделение с ячейки когда тапаем по ней  и делаем переход performSegue
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let course =  courses[indexPath.row]
    performSegue(withIdentifier: "ShowDetails", sender: course)
    
    }

}
