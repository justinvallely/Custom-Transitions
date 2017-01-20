//
//  ViewController.swift
//  Custom Animation Tests
//
//  Created by Justin Vallely on 1/19/17.
//  Copyright © 2017 Pajama Donkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroView: UIView!

    fileprivate let galleryPresentAnimationController = GalleryPresentAnimationController()

    @IBAction func buttonAction(_ sender: Any) {
        performSegue(withIdentifier: "showFullScreenImage", sender: self)
    }

    @IBAction func prepare(forUnwind segue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toVC = segue.destination as? ViewController2

        toVC?.transitioningDelegate = self
    }

}

extension ViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        galleryPresentAnimationController.originFrame = heroView.frame
        return galleryPresentAnimationController
    }

    //    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    //        flipDismissAnimationController.destinationFrame = cardView.frame
    //        return flipDismissAnimationController
    //    }
    //
    //    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    //        return swipeInteractionController.interactionInProgress ? swipeInteractionController : nil
    //    }
    
}
