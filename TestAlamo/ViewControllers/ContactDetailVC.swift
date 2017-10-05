//
//  ContactDetailVC.swift
//  TestAlamo
//
//  Created by Toseefhusen Khilji on 9/27/17.
//  Copyright © 2017 Toseefhusen Khilji. All rights reserved.
//

import UIKit

class ContactDetailVC: UIViewController {

    var contact : Contact!
    var headerColor : UIColor = UIColor.lightGray
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var linePhone: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lineAddress: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setDefaultNaigationUI()
    }
    
    func setupUI() {
        
//        self.imgProfile.backgroundColor = UIColor.blue
        self.imgProfile.tintColor = .white
        self.imgProfile.image =  self.imgProfile.image?.resized(to: .init(width: 60, height: 60)).withRenderingMode(.alwaysTemplate)
        self.imgProfile.layoutIfNeeded()
        
        setupNavigationUI()
        drawHeader()
        drawProfileOval()
    }
    
    func setupNavigationUI() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setDefaultNaigationUI() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    
    func drawProfileOval(){
        
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let pCenter = CGPoint(x: self.imgProfile.Width/2.0, y: self.imgProfile.Height/2.0)
        let rds =  (self.imgProfile.Width - 6)/2
        let path = UIBezierPath(arcCenter: pCenter, radius: rds, startAngle:  CGFloat(-Double.pi), endAngle:  CGFloat((Double.pi * 2.0) - Double.pi/2), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.white.cgColor
        circleLayer.lineWidth = 2.0;
        circleLayer.strokeEnd = 1.0
        
        // Add the circleLayer to the view's layer's sublayers
        self.imgProfile.layer.insertSublayer(circleLayer, at: 0)
    }
    
    func drawHeader() {
        let path = UIBezierPath()
        let cpoint1 = CGPoint(x: viewHeader.Width/4, y: viewHeader.Height)
        let x = (viewHeader.Width * 3/4) - 30
        let cpoint2 = CGPoint(x: x , y: viewHeader.Height + 70)
        path.move(to:.init(x: 0, y: 0))
        path.addLine(to:.init(x: 0, y: viewHeader.Height + 30))
        path.addCurve(to: .init(x: viewHeader.Width, y: viewHeader.Height + 40), controlPoint1: cpoint1, controlPoint2: cpoint2)
        path.addLine(to: CGPoint(x: viewHeader.Width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = self.headerColor.cgColor
        shapeLayer.strokeColor =  self.headerColor.cgColor
        shapeLayer.lineWidth = 1.0
        self.viewHeader.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    func setData() {
        lblName.text = contact.name
        lblEmail.text = contact.email
        lblMobile.text = contact.phone.mobile
        lblHome.text = contact.phone.home ?? contact.phone.office ?? "00-000"
        lblAddress.text = contact.address
        linePhone.backgroundColor = headerColor
        lineAddress.backgroundColor = headerColor
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        if #available(iOS 10.0, *) {
            return UIGraphicsImageRenderer(size: size).image { _ in
                draw(in: CGRect(origin: .zero, size: size))
            }
        } else {
            // Fallback on earlier versions
            return self;
        }
    }
}
