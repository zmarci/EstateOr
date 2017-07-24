//
//  PropertyCollectionViewCell.swift
//  EstateOr
//
//  Created by Marton Zatrok on 2017. 07. 20..
//  Copyright © 2017. Marton Zatrok. All rights reserved.
//

import UIKit
import Kingfisher

class PropertyCollectionViewCell: UICollectionViewCell {
    
    //MARK: Variables
    
    //MARK: IBOutlets
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var midLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    //MARK: IBActions
    
    //MARK: Life-cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        commonInit()
    }
    
    fileprivate func commonInit() {
        
        topLabel.text = ""
        midLabel.text = ""
        bottomLabel.text = ""
        backgroundImageView.image = nil
    }
    
    //MARK: Functions
    
    func setupCell(forProperty newProperty: Property) {
        
        if let currentContract = newProperty.currentContract(),
            let paymentAmount = currentContract.paymentAmount,
            let currencyCode = currentContract.currencyCode {

             topLabel.text = currentContract.paymentPeriod
             bottomLabel.text = String(paymentAmount) + " " + currencyCode
        }
    
        midLabel.text = newProperty.address
    }
    
    func setupCell(forPost newPost: Post) {
        
        topLabel.text = newPost.title
        midLabel.text = newPost.author
        bottomLabel.text = String(newPost.score)
        
        if newPost.previewImageUrl.characters.count > 6,
            let URL = URL(string: newPost.previewImageUrl) {
            
            backgroundImageView.kf.setImage(with: URL)
            
        } else {
            
            backgroundImageView.image = UIImage(named: "placeholderBackgroundTown")
            
        }
    }
}
