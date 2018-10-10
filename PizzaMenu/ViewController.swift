//
//  ViewController.swift
//  PizzaMenu
//
//  Created by Hanif Salafi on 09/10/18.
//  Copyright © 2018 Telkom University. All rights reserved.
//

import UIKit
import Foundation

struct PizzaItem {
    let name : String
    let image : String
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pizza = [PizzaItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pizza = [
            PizzaItem(name: "Meat Lovers", image: "meatLover"),
            PizzaItem(name: "Pepperoni", image: "pepperoni"),
            PizzaItem(name: "Super Supreme", image: "superSupreme"),
            PizzaItem(name: "Splitza", image: "splitza"),
            PizzaItem(name: "Meat Lovers", image: "meatLover"),
            PizzaItem(name: "Pepperoni", image: "pepperoni"),
            PizzaItem(name: "Super Supreme", image: "superSupreme"),
            PizzaItem(name: "Splitza", image: "splitza")
        ]
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.width-20)/2 , height: self.collectionView.frame.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pizza.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PizzaCollectionViewCell
        
        let piz = pizza[indexPath.item]
        
        cell.lblPizza.text = piz.name
        cell.imgPizza.image = UIImage(named: piz.image)
        cell.layer.borderColor  = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 2
        cell?.layer.backgroundColor = UIColor.yellow.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
        cell?.layer.backgroundColor = UIColor.white.cgColor
        
    }


}

