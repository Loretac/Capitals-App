//
//  CountryCell.swift
//  Capitals-App
//
//  Created by Chris Loreta on 5/31/22.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
