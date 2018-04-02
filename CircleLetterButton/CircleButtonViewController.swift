//
//  CircleButtonViewController.swift
//  CircleButton
//
//  Created by Lewis Griffin on 3/31/18.
//  Copyright © 2018 Lewis Griffin. All rights reserved.
//

import UIKit

public protocol CircleButtonDelegate {
    func buttonWasPressed()
}
public class CircleButtonViewController: UIViewController {
    public var delegate:CircleButtonDelegate!
    
    public var sizeOfButton:CGSize!
    public var colorOFButton:UIColor!
    public var colorOfText:UIColor!
    public var buttonText:String?
    public var buttonBorderWidth:CGFloat!
    public var backgroundColorOfView:UIColor = .white
    public var subTitleText:String?
    public var subTitleBold:Bool?
    public var subTitleColor:UIColor?
    

    public override func viewDidLoad() {
        super.viewDidLoad()

        createButton()
    }

    func createButton() {
        view.backgroundColor = backgroundColorOfView
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = colorOFButton.cgColor
        button.layer.borderWidth = buttonBorderWidth
        button.frame.size = CGSize(width: sizeOfButton.width, height: sizeOfButton.height)
        
        view.addSubview(button)
        [
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: sizeOfButton.width),
            button.heightAnchor.constraint(equalToConstant: sizeOfButton.height)
        ].forEach({ $0.isActive = true })
        
        button.setTitle(buttonText, for: .normal)
        button.backgroundColor = colorOFButton
        button.layer.cornerRadius = button.frame.size.width / 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        
        if let subTitle = subTitleText {
            let subTitleLabel = UILabel()
            subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            subTitleLabel.adjustsFontSizeToFitWidth = true
            subTitleLabel.textAlignment = .center
            view.addSubview(subTitleLabel)
            [
                subTitleLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
                subTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
                subTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
                
                ].forEach( { $0.isActive = true })
            subTitleLabel.text = subTitle
            if let textColor = subTitleColor {
                subTitleLabel.textColor = textColor
            }
            if let _ = subTitleBold {
                subTitleLabel.attributedText = NSAttributedString(string: subTitle, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 15)])
            }
        }
        
    }
    
    @objc func buttonPressed() {
        delegate.buttonWasPressed()
        dismiss(animated: true, completion: nil)
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
