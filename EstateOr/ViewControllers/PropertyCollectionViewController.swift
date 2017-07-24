//
//  PropertyCollectionViewController.swift
//  EstateOr
//
//  Created by Marton Zatrok on 2017. 07. 20..
//  Copyright © 2017. Marton Zatrok. All rights reserved.
//

import UIKit

class PropertyCollectionViewController: UIViewController {

    //MARK: Variables
    
    let propertyCellId = "PropertyCollectionViewCell"
    
    var testPostsList: [Post] = []
    
    //var propertyList: [Property] = []
    
    //MARK: IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: IBActions
    
    //MARK: Life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        APIManager.fetchPosts { [weak self] success, responsePostsList in
            
            guard let strongSelf = self,
                let responsePostsList = responsePostsList, success else {
            
                return
                
            }
            
            strongSelf.testPostsList = responsePostsList
            strongSelf.collectionView.reloadData()
            
        }
        
       // propertyList = Property.allProperties()
        
    }

    //MARK: Functions
    
}

//MARK: Extensions

//MARK: UICollectionViewDelegate

extension PropertyCollectionViewController: UICollectionViewDelegate {
    //
}

//MARK: UICollectionViewDataSource

extension PropertyCollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       // return propertyList.count
        return testPostsList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: propertyCellId, for: indexPath) as? PropertyCollectionViewCell else {
            
            return UICollectionViewCell()
            
        }
        
        let currentPost = testPostsList[indexPath.row]
        
        cell.setupCell(forPost: currentPost)
        
        return cell
        
    }
    
}
