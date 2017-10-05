//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


var str = "Hello, playground"


let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0))
containerView.backgroundColor = UIColor.green

let viewHeader = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 375.0, height:200))
let headerColor = UIColor.red
let path = UIBezierPath()
let cpoint1 = CGPoint(x: viewHeader.frame.width/4, y: 160)
let cpoint2 = CGPoint(x: viewHeader.frame.width*3/4, y: viewHeader.frame.height + 50)
path.move(to:.init(x: 0, y: 0))
path.addLine(to:.init(x: 0, y: viewHeader.frame.height + 10))
path.addCurve(to: .init(x: viewHeader.frame.width, y: viewHeader.frame.height + 12), controlPoint1: cpoint1, controlPoint2: cpoint2)
path.addLine(to: CGPoint(x: viewHeader.frame.width, y: 0))
path.addLine(to: CGPoint(x: 0, y: 0))
path.close()
let shapeLayer = CAShapeLayer()
shapeLayer.path = path.reversing().cgPath
shapeLayer.fillColor = headerColor.cgColor
shapeLayer.strokeColor =  headerColor.cgColor
shapeLayer.lineWidth = 1.0
viewHeader.layer.addSublayer(shapeLayer)
containerView.addSubview(viewHeader)




