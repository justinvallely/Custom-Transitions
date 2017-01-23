//
//  galleryPresentAnimationController.swift
//  Inspirato
//
//  Created by Justin Vallely on 1/19/17.
//  Copyright © 2017 Inspirato. All rights reserved.
//

import UIKit

class GalleryPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning  {

    var originFrame = CGRect.zero

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        // 1 - Setup "To" and "From" View Controllers
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? ViewController,
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? ViewController2 else { return }
        let containerView = transitionContext.containerView

        containerView.addSubview(toVC.view)

        // 2 - Setup frames
        let finalFrame = toVC.imageView.frame.offsetBy(dx: 0.5, dy: 0.5)

        // 3 - Create a snapshot to animate
        let snapshot = toVC.imageView.snapshotView(afterScreenUpdates: true)
        snapshot?.frame = originFrame
        containerView.addSubview(snapshot!)

        // 4 - Prepare for animation
        fromVC.heroImage.isHidden = true
        toVC.view.alpha = 0
        let duration = transitionDuration(using: transitionContext)

        // 5 - Animate the transition
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: .calculationModeLinear,
            animations: {

                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/2, animations: {
                    snapshot?.frame = finalFrame
                })

                UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                    toVC.view.alpha = 1
                })
        },
            completion: { _ in

                fromVC.heroImage.isHidden = false
                snapshot?.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}
