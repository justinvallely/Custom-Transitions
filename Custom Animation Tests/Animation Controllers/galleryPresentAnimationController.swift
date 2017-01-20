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

        // 1
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        let containerView = transitionContext.containerView

        // 2
        let initialFrame = originFrame
        let finalFrame = transitionContext.finalFrame(for: toVC)

        // 3
        let snapshot = toVC.view.snapshotView(afterScreenUpdates: true)
        snapshot?.frame = initialFrame
        snapshot?.layer.cornerRadius = 25
        snapshot?.layer.masksToBounds = true

        //------------------------------------------------------------------//

        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot!)
        toVC.view.isHidden = true

//        AnimationHelper.perspectiveTransformForContainerView(containerView)
//        snapshot?.layer.transform = AnimationHelper.yRotation(M_PI_2)

        //------------------------------------------------------------------//


        // 1
        let duration = transitionDuration(using: transitionContext)

        UIView.animate(withDuration: duration, animations: {
            snapshot?.frame = finalFrame
        }) { _ in
            toVC.view.isHidden = false
            snapshot?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

//        UIView.animateKeyframes(
//            withDuration: duration,
//            delay: 0,
//            options: .calculationModeCubic,
//            animations: {
//                // 2
//                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/2, animations: {
//                    snapshot?.frame = initialFrame
//                })
//
//                // 3
//                UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
//                    snapshot?.frame = finalFrame
//                })
////
////                // 4
////                UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
////                    snapshot?.frame = finalFrame
////                })
//        },
//            completion: { _ in
//                // 5
//                toVC.view.isHidden = false
////                fromVC.view.layer.transform = AnimationHelper.yRotation(0.0)
//                snapshot?.removeFromSuperview()
//                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//        })
    }
    
}
