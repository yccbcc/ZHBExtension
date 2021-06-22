

//
//  Calayer+Animation.swift
//  lwWallet
//
//  Created by 徐丽 on 2019/7/24.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import Foundation
import UIKit

public extension CALayer{
    func shake() -> Void {
        let keyFrameAnimation = CAKeyframeAnimation.init(keyPath: "transform.translation.x");
        let s = 16;
        keyFrameAnimation.values = [-s,0,s,0,-s,0,s,0];
        keyFrameAnimation.duration = 0.1;
        keyFrameAnimation.repeatCount = 2;
        keyFrameAnimation.isRemovedOnCompletion = true;
        self.add(keyFrameAnimation, forKey: "shake")
    }
    
    func starAnimationLoading() -> Void {
        if (self.animation(forKey: "rotatianAnimKey") != nil) {
            if self.speed == 1{
                return;
            }else{
                self.speed = 1;
                self.beginTime = 0;
                let pauseTime = self.timeOffset;
                self.timeOffset = 0;
                self.beginTime = self.convertTime(CACurrentMediaTime(), from: nil)-pauseTime;
            }
        }else{
            self.addAnimation()
        }
    }
    
    func addAnimation() -> Void {
        let animation = CABasicAnimation.init(keyPath: "transform.rotation.z");
        animation.toValue = Double.pi*2;
        animation.duration = 0.8;
        animation.isCumulative = true;
        animation.autoreverses = false;
        animation.isRemovedOnCompletion = false;
        animation.fillMode = CAMediaTimingFillMode.forwards;
        animation.repeatCount = MAXFLOAT;
        self.add(animation, forKey: "rotatianAnimKey")
    }
    
    func stopAnimation() -> Void {
        if self.speed == 0 {
            return;
        }
        let pauseTime = self.convertTime(CACurrentMediaTime(), from: nil);
        self.speed = 0;
        self.timeOffset = pauseTime;

    }
    
    //添添加运动轨迹动画
    func addPathAnimation(path:CGPath) -> Void {
        let keyFrameAni = CAKeyframeAnimation.init(keyPath: "position");
        keyFrameAni.fillMode = CAMediaTimingFillMode.forwards;
        keyFrameAni.isRemovedOnCompletion = true;// 是否在动画完成后从 Layer 层上移除  回到最开始状态
        keyFrameAni.duration = 80;
        keyFrameAni.repeatCount = MAXFLOAT;
        keyFrameAni.path = path;
        self.add(keyFrameAni, forKey: nil);
    }
    
    //添加shapeLayer
    static func addShapeLayerWithPath(startPoint:(CGPoint),pointArray:(Array<Dictionary<String, CGPoint>>))->CAShapeLayer{
        let besizerPath = UIBezierPath.init();
        besizerPath.move(to:startPoint);
        for i in 0..<pointArray.count {
            let pointDic = pointArray[i];
            let endPoint:CGPoint = pointDic["endPoint"]!;
            let curvePoint:CGPoint = pointDic["curvePoint"]!;
            besizerPath.addQuadCurve(to: endPoint, controlPoint:curvePoint);
        }
        let shapeLayer = CAShapeLayer.init();
        shapeLayer.path = besizerPath.cgPath;
//        shapeLayer.strokeColor = UIColor.red.cgColor;
        shapeLayer.fillColor  = UIColor.clear.cgColor;
        shapeLayer.lineWidth = 1;
        return shapeLayer;
    }
    
    /**
     func addTopCakeyFrameAnimation() -> Void {
         
         let startPoint = CGPoint.init(x:self.topCircleImageView!.cy_centerX, y: self.topCircleImageView!.cy_centerY);
         let firstEndPoint = CGPoint.init(x:frame.size.width/2+100, y:100);
         let firstCurvePoint = CGPoint.init(x:frame.size.width/2+150, y:120);
         let firtPointDic = ["curvePoint":firstCurvePoint,"endPoint":firstEndPoint];
     
         let ThirdEndPoint = CGPoint.init(x:self.topCircleImageView!.cy_centerX, y: self.topCircleImageView!.cy_centerY);
         let ThirdCurvePoint = CGPoint.init(x:frame.size.width/2+150, y:80);
         let ThirdPointDic = ["curvePoint":ThirdCurvePoint,"endPoint":ThirdEndPoint];
         
         let arrayPoint = [firtPointDic,ThirdPointDic];
         
         let shapeLayer = CALayer.addShapeLayerWithPath(startPoint: startPoint, pointArray: arrayPoint);
         self.layer.addSublayer(shapeLayer);
         self.topCircleImageView?.layer.addPathAnimation(path: shapeLayer.path!);

     */
    
    
    
   
}
