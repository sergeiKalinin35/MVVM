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
    
    
    var viewModel: CourseDetailsViewModelProtocol!

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    
    }
    
    @IBAction func toggleFavorite(_sender: UIButton) {
        viewModel.isFavorite.toggle()
        setImageForFavoriteButton()
    
        }
     
    
    private func setupUI() {
  
        courseNameLabel.text = viewModel.courseName
        numberOfLessonsLabel.text = viewModel.numberOfLessons
        numberOfTestsLabel.text = viewModel.numberOfTests
        guard let imageData = viewModel.imageData else { return }
        courseImage.image = UIImage(data: imageData)
        
        
        setImageForFavoriteButton()
        
    }
    
    private func setImageForFavoriteButton() {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
        
    }
  //  private func loadFavoriteButton() {/
 //       isFavorite = DataManager.shared.getFavoriteStatus(for: course.name ?? "" )
 //   }
    
    
}
    
    
    
    
    
  





























