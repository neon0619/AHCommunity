//
//  ProgressView.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/2/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

enum ProgressType: String {
    case percentage = "percentage"
    case timer = "timer"
    
}
class ProgressView: UIView, CAAnimationDelegate {
    
    fileprivate let progressLayer: CAShapeLayer = CAShapeLayer()
    fileprivate let progressLayerWhite : CAShapeLayer = CAShapeLayer()
    
    fileprivate var outerStrokeColor: CGColor = UIColor.blue.cgColor
    fileprivate var innerStrokeColor: CGColor = UIColor.white.cgColor
    
    fileprivate var outerStrokeLineWidth: CGFloat = 5.0
    fileprivate var innerStrokeLineWidth: CGFloat = 5.0
    
    fileprivate var lineCap: String? = kCALineCapRound
    
    fileprivate var timer = Timer()
    
    fileprivate var progressLabel: UILabel!
    fileprivate var innerLabelTextColor: UIColor = UIColor.white
    fileprivate var startingPercentage = 0.0
    fileprivate var currentProgressPercentage: CGFloat = 0.0
    fileprivate var progressType: ProgressType = .percentage
    fileprivate var isTimerStarted: Bool = false
    
    public func setOuterStrokeColor(color : CGColor){ outerStrokeColor = color}
    public func setInnerStrokeColor(color : CGColor){ innerStrokeColor = color}
    public func setOuterStrokeLineWidth( width: CGFloat){ outerStrokeLineWidth = width}
    public func setInnerStrokeLineWidth( width: CGFloat){ innerStrokeLineWidth = width}
    public func setCurrentProgressPercentage ( percentage: CGFloat){ currentProgressPercentage = percentage}
    public func setInnerLabelTextColor (textColor: UIColor) { innerLabelTextColor = textColor}
    public func setLineCap(lineCap: String?) { self.lineCap = lineCap}
    public func setProgressType (type: ProgressType) { progressType = type}
    
    override func draw(_ rect: CGRect) {
        
        createLabel(innerLabelTextColor)
        createProgressLayer(outerStrokeColor, strokeColor2: innerStrokeColor, lineWidth: outerStrokeLineWidth, lineWidth2: outerStrokeLineWidth, lineCap: lineCap)
//        animateProgressView(currentProgressPercentage, progressType: progressType)
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        createLabel(innerLabelTextColor)
////        createProgressLayer(outerStrokeColor, strokeColor2: innerStrokeColor, lineWidth: outerStrokeLineWidth, lineWidth2: outerStrokeLineWidth, lineCap: lineCap)
//    }
    
    
    
    func createLabel(_ textColor : UIColor) {
        progressLabel = UILabel()
        progressLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: 60.0))
        progressLabel.textColor = textColor
        progressLabel.textAlignment = .center
        progressLabel.text = "0%"
        progressLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressLabel)
        
        addConstraint(NSLayoutConstraint(item: progressLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: progressLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
    
    func createProgressLayer(_ strokeColor : CGColor, strokeColor2 : CGColor, lineWidth : CGFloat, lineWidth2 : CGFloat, lineCap : String?) {
        
        let startAngle = CGFloat(M_PI + M_PI_2)
        let endAngle = CGFloat(M_PI * 3 + M_PI_2)
        let centerPoint = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius = bounds.width/2 - 5
        
        //        let gradientMaskLayer = gradientMask()
        progressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: radius , startAngle:startAngle, endAngle:endAngle, clockwise: true).cgPath
        progressLayer.backgroundColor = UIColor.clear.cgColor
        progressLayer.fillColor = nil
        progressLayer.strokeColor = strokeColor
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = 0.0
        progressLayer.lineCap = lineCap ?? ""
        
        progressLayerWhite.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: startAngle,endAngle:endAngle, clockwise: true).cgPath
        progressLayerWhite.fillColor = UIColor.clear.cgColor
        progressLayerWhite.strokeColor = strokeColor2
        progressLayerWhite.lineWidth = lineWidth2
        
        //        gradientMaskLayer.mask = progressLayer
        self.layer.addSublayer(progressLayerWhite)
        self.layer.addSublayer(progressLayer)
        
    }
    
    fileprivate func gradientMask() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        gradientLayer.locations = [0.0, 0.0]
        
        let colorTop: AnyObject = UIColor(red: 255.0/255.0, green: 213.0/255.0, blue: 63.0/255.0, alpha: 1.0).cgColor
        let colorBottom: AnyObject = UIColor(red: 255.0/255.0, green: 198.0/255.0, blue: 5.0/255.0, alpha: 1.0).cgColor
        let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
        gradientLayer.colors = arrayOfColors
        
        return gradientLayer
    }
    
    func hideProgressView() {
        progressLayer.strokeEnd = 0.0
        progressLayer.removeAllAnimations()
        progressLabel.text = "Load content"
    }
    
    public func animateProgressView(_ currentProgressPercentage : CGFloat, progressType: ProgressType) {
        self.currentProgressPercentage = currentProgressPercentage
        self.progressType = progressType
        
        progressLayer.strokeEnd = 0.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.fromValue = CGFloat(startingPercentage)
        animation.toValue = CGFloat(currentProgressPercentage / 100)
        animation.duration = 1.0
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = kCAFillModeForwards
        progressLayer.add(animation, forKey: "strokeEnd")
        
    }
    
    public func starTimer() {
        isTimerStarted = true
//        self.progressType = progressType
        
        progressLayer.strokeStart = currentProgressPercentage
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        print("progress \(currentProgressPercentage)")
        animation.fromValue = CGFloat(currentProgressPercentage / 100)
        animation.toValue = CGFloat(0.0)
        animation.duration = Double(currentProgressPercentage)
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = kCAFillModeForwards
        progressLayer.add(animation, forKey: "strokeEnd")
        
    }

    
    func animationDidStart(_ anim: CAAnimation) {
        
        if !isTimerStarted {
        startingPercentage = 0.0
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ProgressView.updateProgressViewLabelWithProgress(_:)), userInfo: nil, repeats: true)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ProgressView.updateProgressViewLabelWithProgress(_:)), userInfo: nil, repeats: true)
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        timer.invalidate()
        
        if ProgressType.percentage == progressType {
            progressLabel.text = NSString(format: "%.0f%@", currentProgressPercentage , "%") as String
        }else {
            progressLabel.text = String(format: "%g", currentProgressPercentage)
        }
    }
    
    
    
    func updateProgressViewLabelWithProgress(_ percent: Float) {
        
        if !isTimerStarted {
            startingPercentage += (0.01 * 100)
            if ProgressType.percentage == progressType {
                progressLabel.text = NSString(format: "%.0f%@", startingPercentage , "%") as String
            }else {
                progressLabel.text = String(format: "%g", startingPercentage)
            }
        } else {
//            starTimer()
            if currentProgressPercentage != 0 {
                timer.invalidate()
                currentProgressPercentage -= 1
                progressLabel.text = String(format: "%g", currentProgressPercentage)
            } else {
                currentProgressPercentage = 60
                animateProgressView(currentProgressPercentage, progressType: .timer)
//                starTimer()
                timer.fire()
            }
        }
       
        
    }
    
    func removeSubviews() {
        for viewToRemove in self.subviews {
            viewToRemove.removeFromSuperview()
        }
    }
    
}
