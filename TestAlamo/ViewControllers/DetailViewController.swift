//
//  DetailViewController.swift
//  TestAlamo
//
//  Created by Toseefhusen Khilji on 9/22/17.
//  Copyright © 2017 Toseefhusen Khilji. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    let navColor = UIColor.white

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionview.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: .clear)
        
        //         To stick Collection view geader
        //        (collectionview.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionHeadersPinToVisibleBounds = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.lt_reset()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension DetailViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 0 {
            let x :UICollectionViewFlowLayout  = collectionview.collectionViewLayout as! UICollectionViewFlowLayout
            let maxOffset = CGFloat(x.headerReferenceSize.height) - 64
            
            var progress = (scrollView.contentOffset.y - 64) / maxOffset
            progress = min(progress, 1)
            
            self.navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: navColor.withAlphaComponent(progress))
        }
        
        //        let offsetY = Int(scrollView.contentOffset.y)
        //        if (offsetY > 50) {
        //            let alpha = min(1, 1 - ((50 + 64 - offsetY) / 64))
        //            self.navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: color.withAlphaComponent(CGFloat(alpha)))
        //        }
        //        else {
        //            self.navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: color.withAlphaComponent(0))
        //        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "TESTCELL", for: indexPath) as UICollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TESTHEADER", for: indexPath)
            headerView.backgroundColor = UIColor.red
            return headerView
        }
        else {
            assert(false, "Unsupported supplementary view kind")
            return UICollectionReusableView()
        }
    }
}
