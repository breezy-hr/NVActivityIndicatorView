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
		
		let spacing: CGFloat = 15.0
		let circleSize = (size.width - spacing * 2) / 3
		let centerY = (layer.bounds.height - circleSize) / 2

		let circle1 = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
		circle1.frame = CGRect(x: 0.0, y: centerY, width: circleSize, height: circleSize)

		let circle2 = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
		circle2.frame = CGRect(x: 0.0, y: centerY, width: circleSize, height: circleSize)

		let circle3 = NVActivityIndicatorShape.circle.layerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
		circle3.frame = CGRect(x: 0.0, y: centerY, width: circleSize, height: circleSize)
		
		layer.addSublayer(circle1)
		layer.addSublayer(circle2)
		layer.addSublayer(circle3)
		
		
		let currentTime = CACurrentMediaTime()
		let timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		let timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction, timingFunction, timingFunction]
		
		let firstPosition = CGPoint(x: 0.0, y: 0.0)
		let secondPosition = CGPoint(x: (size.width - circleSize) / 2.0, y: 0.0)
		let thirdPosition = CGPoint(x: size.width - circleSize, y: 0.0)
		let arcRadius = (secondPosition.x - firstPosition.x) / 2.0
		
		let firstCirclePath = UIBezierPath()
		firstCirclePath.move(to: firstPosition)
		firstCirclePath.addCurve(to: secondPosition,
								 controlPoint1: CGPoint(x: firstPosition.x, y: firstPosition.y - (arcRadius * 1.5)),
								 controlPoint2: CGPoint(x: secondPosition.x, y: secondPosition.y - (arcRadius * 1.5)))
		firstCirclePath.addCurve(to: thirdPosition,
								 controlPoint1: CGPoint(x: secondPosition.x, y: secondPosition.y + (arcRadius * 1.5)),
								 controlPoint2: CGPoint(x: thirdPosition.x, y: thirdPosition.y + (arcRadius * 1.5)))
		firstCirclePath.addLine(to: thirdPosition)
		firstCirclePath.addLine(to: secondPosition)
		firstCirclePath.addLine(to: firstPosition)
		firstCirclePath.addLine(to: firstPosition)
		
		let firstAnimation = CAKeyframeAnimation(keyPath: "transform.translation")
		firstAnimation.path = firstCirclePath.cgPath
		firstAnimation.calculationMode = kCAAnimationCubic
		firstAnimation.keyTimes = [0.0, 0.16, 0.33, 0.5, 0.67, 0.83, 1.0]
		firstAnimation.timingFunctions = timingFunctions
		firstAnimation.repeatCount = .infinity
		firstAnimation.duration = 3.0
		firstAnimation.beginTime = currentTime
		
		circle1.add(firstAnimation, forKey: "1")
		
		
		let secondCirclePath = UIBezierPath()
		secondCirclePath.move(to: secondPosition)
		secondCirclePath.addLine(to: firstPosition)
		secondCirclePath.addLine(to: firstPosition)
		secondCirclePath.addCurve(to: secondPosition,
								 controlPoint1: CGPoint(x: firstPosition.x, y: firstPosition.y - (arcRadius * 1.5)),
								 controlPoint2: CGPoint(x: secondPosition.x, y: secondPosition.y - (arcRadius * 1.5)))
		secondCirclePath.addCurve(to: thirdPosition,
								 controlPoint1: CGPoint(x: secondPosition.x, y: secondPosition.y + (arcRadius * 1.5)),
								 controlPoint2: CGPoint(x: thirdPosition.x, y: thirdPosition.y + (arcRadius * 1.5)))
		secondCirclePath.addLine(to: thirdPosition)
		secondCirclePath.addLine(to: secondPosition)
		
		let secondAnimation = CAKeyframeAnimation(keyPath: "transform.translation")
		secondAnimation.path = secondCirclePath.cgPath
		secondAnimation.calculationMode = kCAAnimationCubic
		secondAnimation.keyTimes = [0.0, 0.16, 0.33, 0.5, 0.67, 0.83, 1.0]
		secondAnimation.timingFunctions = timingFunctions
		secondAnimation.repeatCount = .infinity
		secondAnimation.duration = 3.0
		secondAnimation.beginTime = currentTime

		circle2.add(secondAnimation, forKey: "2")
		
		
		let thirdCirclePath = UIBezierPath()
		thirdCirclePath.move(to: thirdPosition)
		thirdCirclePath.addLine(to: thirdPosition)
		thirdCirclePath.addLine(to: secondPosition)
		thirdCirclePath.addLine(to: firstPosition)
		thirdCirclePath.addLine(to: firstPosition)
		thirdCirclePath.addCurve(to: secondPosition,
								 controlPoint1: CGPoint(x: firstPosition.x, y: firstPosition.y - (arcRadius * 1.5)),
								 controlPoint2: CGPoint(x: secondPosition.x, y: secondPosition.y - (arcRadius * 1.5)))
		thirdCirclePath.addCurve(to: thirdPosition,
								 controlPoint1: CGPoint(x: secondPosition.x, y: secondPosition.y + (arcRadius * 1.5)),
								 controlPoint2: CGPoint(x: thirdPosition.x, y: thirdPosition.y + (arcRadius * 1.5)))
		let thirdAnimation = CAKeyframeAnimation(keyPath: "transform.translation")
		thirdAnimation.path = thirdCirclePath.cgPath
		thirdAnimation.calculationMode = kCAAnimationCubic
		thirdAnimation.keyTimes = [0.0, 0.16, 0.33, 0.5, 0.67, 0.83, 1.0]
		thirdAnimation.timingFunctions = timingFunctions
		thirdAnimation.repeatCount = .infinity
		thirdAnimation.duration = 3.0
		thirdAnimation.beginTime = currentTime

		circle3.add(thirdAnimation, forKey: "3")
	}
}
