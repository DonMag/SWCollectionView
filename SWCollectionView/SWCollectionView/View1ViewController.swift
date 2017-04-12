//
//  View1ViewController.swift
//  SWCollectionView
//
//  Created by Don Mag on 3/30/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class View1ViewController: UIViewController {

	@IBAction func didTap(_ sender: Any) {

		guard let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3"),
			let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2")
			else { return }
		
		let vcArray = [self, vc3, vc2]
		
		self.navigationController?.setViewControllers(vcArray, animated: true)
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
