//
//  CourseTableViewCell.swift
//  MVVM
//
//  Created by Sergey on 08.09.2021.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    var viewModel: TableViewCellViewModelProtocol! {
        
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.courseName
            
            guard let imageData = viewModel.imageData else { return }
            content.image = UIImage(data: imageData)
            contentConfiguration = content
            
        }
    }
}
