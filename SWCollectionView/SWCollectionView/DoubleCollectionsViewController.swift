//
//  DoubleCollectionsViewController.swift
//  SWCollectionView
//
//  Created by Don Mag on 3/29/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class CVCell: UICollectionViewCell {
	@IBOutlet weak var theLabel: UILabel!
	
	override var isSelected: Bool {
		didSet {
			self.layer.borderWidth = isSelected ? 1 : 0
			self.backgroundColor = isSelected ? UIColor.cyan : UIColor.lightGray
		}
	}
 
}

struct SelCell {
	var ref1: IndexPath
	var ref2: Int
}

class DoubleCollectionsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

	@IBOutlet weak var cv1: UICollectionView!
	@IBOutlet weak var cv2: UICollectionView!
	
	var selectedCells = [SelCell]()
	
	 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return collectionView == cv1 ? 12 : selectedCells.count

	}
	
	 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath) as! CVCell
		
		cell.backgroundColor = UIColor.lightGray
		
		cell.theLabel.text = "\(indexPath.row)"
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		print(indexPath)
		
		let n = selectedCells.count + 1
		
		let sc = SelCell(ref1: indexPath, ref2:n)
		
		selectedCells.append(sc)
		
		cv2.reloadData()
		
//		let cell = collectionView.cellForItem(at: <#T##IndexPath#>)
		
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		cv1.delegate = self
		cv1.dataSource = self
		
		cv1.allowsMultipleSelection = true
		
		cv2.delegate = self
		cv2.dataSource = self
		

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
