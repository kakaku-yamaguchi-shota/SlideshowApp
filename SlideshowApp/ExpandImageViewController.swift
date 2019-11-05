//
//  ExpandImageViewController.swift
//  SlideshowApp
//
//  Created by 山口 彰太 on 2019/11/05.
//  Copyright © 2019 shouta.yamaguchi4. All rights reserved.
//

import UIKit

class ExpandImageViewController: UIViewController {
    @IBOutlet weak var expandImageView: UIImageView!

    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        expandImageView.image = image

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
