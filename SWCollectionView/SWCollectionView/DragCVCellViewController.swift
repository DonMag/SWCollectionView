//
//  DragCVCellViewController.swift
//  SWCollectionView
//
//  Created by Don Mag on 3/30/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit


class DragCVCellViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

	@IBOutlet var collectionView: UICollectionView!
	var movingCellImageView: UIImageView?
	
	override func viewDidLoad() {
//		let longPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.didBeginDraggingCollectionView(_:)))
		let longPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressed(_:)))
		longPressGesture.allowableMovement = self.view.frame.height
//		self.effectsCollectionView.addGestureRecognizer(longPressGesture)
		self.collectionView.addGestureRecognizer(longPressGesture)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return 12
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath) as! CVCell
		
		cell.backgroundColor = UIColor.lightGray
		
		cell.theLabel.text = "\(indexPath.row)"

		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
	}
	

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 100, height: 100)
	}
	
	func longPressed(_ sender : UILongPressGestureRecognizer) {
		
		let locationInView: CGPoint = sender.location(in: self.view)
		let locationInCollectionView: CGPoint = sender.location(in: self.collectionView)
		
		if sender.state == .began {
			if let indexPath: IndexPath = self.collectionView.indexPathForItem(at: locationInCollectionView) {
				if let cell = self.collectionView.cellForItem(at: indexPath) {
					
					UIGraphicsBeginImageContext(cell.bounds.size)
					cell.layer.render(in: UIGraphicsGetCurrentContext()!)
					let cellImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
					UIGraphicsEndImageContext()
					
					self.movingCellImageView = UIImageView(image: cellImage)
					self.movingCellImageView?.alpha = 0.75
					
					self.view.addSubview(self.movingCellImageView!)
					self.movingCellImageView?.center = locationInView
				}
			}
		}
		// Move movingCellImageView following finger position
		if sender.state == .changed {
			self.movingCellImageView?.center = locationInView
		}
		// Remove movingCellImageView when ended
		if sender.state == .ended {
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
				self.movingCellImageView?.alpha = 0
			}, completion: { (success: Bool) in
				self.movingCellImageView?.removeFromSuperview()
				self.movingCellImageView = nil
			})
		}
	}
	

	func didBeginDraggingCollectionView(_ longPressGesture: UILongPressGestureRecognizer) {
		
		let locationInView: CGPoint = longPressGesture.location(in: self.view)
		let locationInCollectionView: CGPoint = longPressGesture.location(in: self.collectionView)
		
		if longPressGesture.state == .began {
			if let indexPath: IndexPath = self.collectionView.indexPathForItem(at: locationInCollectionView) {
				if let cell = self.collectionView.cellForItem(at: indexPath) {
					
					UIGraphicsBeginImageContext(cell.bounds.size)
					cell.layer.render(in: UIGraphicsGetCurrentContext()!)
					let cellImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
					UIGraphicsEndImageContext()
					
					self.movingCellImageView = UIImageView(image: cellImage)
					self.movingCellImageView?.alpha = 0.75
					
					self.view.addSubview(self.movingCellImageView!)
					self.movingCellImageView?.center = locationInView
				}
			}
		}
		// Move movingCellImageView following finger position
		if longPressGesture.state == .changed {
			self.movingCellImageView?.center = locationInView
		}
		// Remove movingCellImageView when ended
		if longPressGesture.state == .ended {
			UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
				self.movingCellImageView?.alpha = 0
			}, completion: { (success: Bool) in
				self.movingCellImageView?.removeFromSuperview()
				self.movingCellImageView = nil
			})
		}
	}
	
}
