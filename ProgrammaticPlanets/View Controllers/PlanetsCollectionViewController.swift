//
//  PlanetsCollectionViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetsCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let planetController = PlanetController()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planetController.planets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as! PlanetCollectionViewCell

        let planet = planetController.planets[indexPath.item]
        
        cell.planet = planet
    
        return cell
    }

    // MARK: - Action Handlers
    
    @IBAction func unwindToPlanetsCollectionViewController(_ sender: UIStoryboardSegue) {
    }
}

extension PlanetsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let horizontalItems: CGFloat = 3
        
        let horizontalInsets = collectionView.contentInset.left + collectionView.contentInset.right
        let itemSpacing = (collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing * (horizontalItems - 1)
        let width = (collectionView.frame.width - horizontalInsets - itemSpacing) / horizontalItems

        return CGSize(width: width, height: width * 1.2)
    }
}
