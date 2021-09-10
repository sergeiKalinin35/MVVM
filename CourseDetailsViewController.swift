//
//  CourseDetailsViewController.swift
//  MVVM
//
//  Created by Sergey on 08.09.2021.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    
    @IBOutlet private weak var courseNameLabel: UILabel!
    @IBOutlet private weak var numberOfLessonsLabel: UILabel!
    @IBOutlet private weak var numberOfTestsLabel: UILabel!
    @IBOutlet private weak var courseImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    
  //  var course: Course!
    
    
    
    private var isFavorite = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFavoriteStatus()
        setupUI()
        
        
     
    }
    
    @IBAction func toggleFavorite(_sender: UIButton) {
        isFavorite.toggle()
        setImageForFavoriteButton()
        DataManager.shared.setFavoriteStatus(for: course.name ?? "", with: isFavorite)
        }
     
    
    private func setupUI() {
        courseNameLabel.text = course.name
        numberOfLessonsLabel.text = "Number of lessons: \(course.numberOfLessons ?? 0)"
        numberOfTestsLabel.text = "Number of tests: \(course.numberOfTests ?? 0)"
        
        if let imageData = ImageManager.shared.fetchImageData(from: course.imageUrl) {
            
        }
        
        setImageForFavoriteButton()
    }
    
    private func setImageForFavoriteButton() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
        
    }
    
    private func loadFavoriteStatus() {
        isFavorite = DataManager.shared.getFavoriteStatus(for: course.name ?? "")
    }
    
}
    
    
    
    
    
  





























