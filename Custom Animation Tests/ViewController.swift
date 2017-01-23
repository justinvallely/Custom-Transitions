//
//  ViewController.swift
//  Custom Animation Tests
//
//  Created by Justin Vallely on 1/19/17.
//  Copyright © 2017 Pajama Donkey. All rights reserved.
//

import UIKit
import SwiftPhotoGallery

class ViewController: UIViewController {

    fileprivate let galleryPresentAnimationController = GalleryPresentAnimationController()
    
    @IBOutlet weak var heroImage: UIImageView!

    @IBAction func buttonAction(_ sender: Any) {

        let gallery = SwiftPhotoGallery(delegate: self, dataSource: self)
        gallery.backgroundColor = UIColor.black
        gallery.hideStatusBar = false
        gallery.modalPresentationCapturesStatusBarAppearance = true
        gallery.transitioningDelegate = self

        present(gallery, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


// MARK: Transition Delegate Methods
extension ViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        galleryPresentAnimationController.originFrame = heroImage.frame
        return galleryPresentAnimationController
    }
}


// MARK: SwiftPhotoGallery DataSource Methods
extension ViewController: SwiftPhotoGalleryDataSource {

    func numberOfImagesInGallery(gallery:SwiftPhotoGallery) -> Int {
        return 1
    }

    func imageInGallery(gallery:SwiftPhotoGallery, forIndex:Int) -> UIImage? {
        return #imageLiteral(resourceName: "skilodge")
    }
}


// MARK: SwiftPhotoGallery Delegate Methods
extension ViewController: SwiftPhotoGalleryDelegate {

    func galleryDidTapToClose(gallery: SwiftPhotoGallery) {
        dismiss(animated: true, completion: nil)
    }
}
