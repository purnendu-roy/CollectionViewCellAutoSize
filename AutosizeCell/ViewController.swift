//
//  ViewController.swift
//  AutosizeCell
//
//  Created by Purnendu on 10/12/17.
//  Copyright © 2017 Purnendu. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let randomTexts = ["Aenean dapibus urna a ullamcorper malesuada. Ut tempor.","Sed venenatis ligula massa, a vulputate ipsum fringilla eget. Ut justo erat, facilisis id rhoncus cursus, fringilla at.","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lobortis nibh metus, elementum tempus libero ornare vitae. Etiam sed leo pretium, consectetur turpis non, dapibus purus. Suspendisse potenti. Ut ut eros nunc. Cras nulla justo, porttitor non sapien at, iaculis.","Maecenas pellentesque sed magna in congue. Sed non lacus in mi posuere scelerisque. Aenean.","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget ex a velit tincidunt sodales. Donec elementum nisi at enim tempus, et rutrum erat semper. Phasellus ultricies est nec finibus."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let flowlayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowlayout.estimatedItemSize = CGSize(width: 1, height: 1)
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomTexts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AutoCollectionViewCell
        cell?.desc.text = randomTexts[indexPath.item]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let labelHeight: CGFloat = findHeightForLabel(text: randomTexts[indexPath.item], font: UIFont.systemFont(ofSize: UIFont.systemFontSize))
        return CGSize(width: UIScreen.main.bounds.width, height: labelHeight + 70)
    }
    
    func findHeightForLabel(text: String, font: UIFont) -> CGFloat {
        var size:CGSize = .zero
        if text != "" {
            let frame: CGRect = text.boundingRect(with: CGSize(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: font], context: nil)
            size = CGSize(width: frame.size.width, height: frame.size.height + 1)
        }
        return size.height
    }
}

