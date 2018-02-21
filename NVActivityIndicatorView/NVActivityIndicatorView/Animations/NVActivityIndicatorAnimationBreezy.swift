//
//  NVActivityIndicatorAnimationBreezy.swift
//  NVActivityIndicatorView
//
//  Created by Mike Glass on 2/21/18.
//  Copyright © 2018 Vinh Nguyen. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationBreezy: NVActivityIndicatorAnimationDelegate {
	func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
		
		let spacing: CGFloat = 25
		let circleSize = (size.width - spacing * 2) / 3
		let centerY = (layer.bounds.height - circleSize) / 2
		let containerLayerSize = CGSize(width: (size.width / 3.0) + circleSize, height: circleSize)
		
		let circle1Layer = CALayer()
		circle1Layer.frame = CGRect(origin: CGPoint(x: 0.0, y: centerY), size: containerLayerSize)
		let circle1 = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
		circle1.frame = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
		circle1Layer.addSublayer(circle1)
		
		let circle2Layer = CALayer()
		circle2Layer.frame = CGRect(origin: CGPoint(x: 0.0, y: centerY), size: containerLayerSize)
		let circle2 = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
		circle2.frame = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
		circle2Layer.addSublayer(circle2)
		
		let circle3Layer = CALayer()
		circle3Layer.frame = CGRect(origin: CGPoint(x: 0.0, y: centerY), size: containerLayerSize)
		let circle3 = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
		circle3.frame = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
		circle3Layer.addSublayer(circle3)
		
		layer.addSublayer(circle1Layer)
		layer.addSublayer(circle2Layer)
		layer.addSublayer(circle3Layer)
		
		
		let currentTime = CACurrentMediaTime()
		let spacingDistance = size.width / 3.0
		let timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		let timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction, timingFunction, timingFunction]
		
		let firstCirclePath = UIBezierPath()
		firstCirclePath.move(to: CGPoint(x: 0, y: 0))
		firstCirclePath.addQuadCurve(to: CGPoint(x: spacingDistance, y: 0), controlPoint: CGPoint(x: spacingDistance / 2.0, y: -spacingDistance * 1.5))
		firstCirclePath.addQuadCurve(to: CGPoint(x: spacingDistance * 2.0, y: 0), controlPoint: CGPoint(x: spacingDistance, y: spacingDistance * 1.5))
		firstCirclePath.addLine(to: CGPoint(x: spacingDistance * 2.0, y: 0))
		firstCirclePath.addLine(to: CGPoint(x: spacingDistance, y: 0))
		firstCirclePath.addLine(to: CGPoint(x: 0, y: 0))
		firstCirclePath.addLine(to: CGPoint(x: 0, y: 0))
		
		let firstAnimation = CAKeyframeAnimation(keyPath: "transform.translation")
		firstAnimation.path = firstCirclePath.cgPath
		firstAnimation.calculationMode = kCAAnimationCubic
		firstAnimation.keyTimes = [0.0, 0.16, 0.33, 0.5, 0.67, 0.83, 1.0]
		firstAnimation.timingFunctions = timingFunctions
		firstAnimation.repeatCount = .infinity
		firstAnimation.duration = 3.0
		firstAnimation.beginTime = currentTime
		
		circle1Layer.add(firstAnimation, forKey: "1")
		
		
		let secondCirclePath = UIBezierPath()
		secondCirclePath.move(to: CGPoint(x: spacingDistance, y: 0.0))
		secondCirclePath.addLine(to: CGPoint(x: 0, y: 0))
		secondCirclePath.addLine(to: CGPoint(x: 0, y: 0))
		secondCirclePath.addQuadCurve(to: CGPoint(x: spacingDistance, y: 0), controlPoint: CGPoint(x: spacingDistance / 2.0, y: -spacingDistance * 1.5))
		secondCirclePath.addQuadCurve(to: CGPoint(x: spacingDistance * 2.0, y: 0), controlPoint: CGPoint(x: spacingDistance, y: spacingDistance * 1.5))
		secondCirclePath.addLine(to: CGPoint(x: spacingDistance * 2.0, y: 0))
		secondCirclePath.addLine(to: CGPoint(x: spacingDistance, y: 0))
		
		let secondAnimation = CAKeyframeAnimation(keyPath: "transform.translation")
		secondAnimation.path = secondCirclePath.cgPath
		secondAnimation.calculationMode = kCAAnimationCubic
		secondAnimation.keyTimes = [0.0, 0.16, 0.33, 0.5, 0.67, 0.83, 1.0]
		secondAnimation.timingFunctions = timingFunctions
		secondAnimation.repeatCount = .infinity
		secondAnimation.duration = 3.0
		secondAnimation.beginTime = currentTime

		circle2Layer.add(secondAnimation, forKey: "2")
		
		
		let thirdCirclePath = UIBezierPath()
		thirdCirclePath.move(to: CGPoint(x: spacingDistance * 2.0, y: 0.0))
		thirdCirclePath.addLine(to: CGPoint(x: spacingDistance * 2.0, y: 0))
		thirdCirclePath.addLine(to: CGPoint(x: spacingDistance, y: 0))
		thirdCirclePath.addLine(to: CGPoint(x: 0, y: 0))
		thirdCirclePath.addLine(to: CGPoint(x: 0, y: 0))
		thirdCirclePath.addQuadCurve(to: CGPoint(x: spacingDistance, y: 0), controlPoint: CGPoint(x: spacingDistance / 2.0, y: -spacingDistance * 1.5))
		thirdCirclePath.addQuadCurve(to: CGPoint(x: spacingDistance * 2.0, y: 0), controlPoint: CGPoint(x: spacingDistance, y: spacingDistance * 1.5))

		let thirdAnimation = CAKeyframeAnimation(keyPath: "transform.translation")
		thirdAnimation.path = thirdCirclePath.cgPath
		thirdAnimation.calculationMode = kCAAnimationCubic
		thirdAnimation.keyTimes = [0.0, 0.16, 0.33, 0.5, 0.67, 0.83, 1.0]
		thirdAnimation.timingFunctions = timingFunctions
		thirdAnimation.repeatCount = .infinity
		thirdAnimation.duration = 3.0
		thirdAnimation.beginTime = currentTime

		circle3Layer.add(thirdAnimation, forKey: "3")
	}
}
