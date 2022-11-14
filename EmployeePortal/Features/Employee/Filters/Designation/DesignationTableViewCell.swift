//
//  DesignationTableViewCell.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

class DesignationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var designation: UILabel!
    
    static let identifier = "DesignationTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DesignationTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
