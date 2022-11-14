//
//  EmployeeTableViewCell.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeePhoto: LazyImageView!
    @IBOutlet weak var employeeDesignation: UILabel!
    
    static let identifier = "EmployeeTableViewCell"
    
    static func nib() -> UINib {
           return UINib(nibName: "EmployeeTableViewCell", bundle: nil)
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(employeeDetails: ResultEntity) {
        self.employeeName.text = employeeDetails.firstName + " " + employeeDetails.lastName
        self.employeeDesignation.text = employeeDetails.designation
        if employeeDetails.photo == nil {
            self.employeePhoto.image = UIImage(named: "dummy_Icon")
        }
        else {
            guard let url = URL(string: employeeDetails.photo ?? "") else { return }
            self.employeePhoto.loadImage(fromURL: url, placeHolderImage: "dummy_Icon")
        }
    }
    
}
