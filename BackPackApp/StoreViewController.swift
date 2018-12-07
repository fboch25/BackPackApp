//
//  FirstViewController.swift
//  BackPackApp
//
//  Created by Frank Joseph Boccia on 11/6/18.
//  Copyright © 2018 Frank Joseph Boccia. All rights reserved.
//

    import UIKit
    class StoreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: 300, height: 100)
            
            let myCollectionView:UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
            myCollectionView.dataSource = self
            myCollectionView.delegate = self
            myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
            myCollectionView.backgroundColor = UIColor.white
            self.view.addSubview(myCollectionView)
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 100
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
            myCell.backgroundColor = UIColor.brown
        

            return myCell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
        {
            let alert = UIAlertController(title: "Store Item",
                                          message: "This cell will contain sponsored items that will be available for sale ... in the future (USD).",
                                          preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .cancel)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
            print("User tapped on item \(indexPath.row)")
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
    }




