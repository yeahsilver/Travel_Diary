//
//  ViewController.swift
//  travel_diary
//
//  Created by 허예은 on 2020/07/13.
//  Copyright © 2020 허예은. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let viewModel = InfoViewModel()

    // UICollectionViewDataSource
    // > 보여주는 이미지 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfInfo
    }
    
    // > 셀 표현 방법
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else{
            return UICollectionViewCell()
        }
        
        let info = viewModel.info(at: indexPath.item)
            cell.update(info: info)
        cell.update(info: info)
        
        return cell
    }
    
    // UICollectionViewDelegate
    // > 셀이 클릭 된 뒤 액션 정의
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("-->\(indexPath.item)")
        performSegue(withIdentifier: "showAlbum", sender: indexPath.item)
    }
    
    // UICollectionViewDelegateFlowLayout
    // > cell size 계산
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height: CGFloat = width * 10/7 + textAreaHeight
        
        return CGSize(width: width, height: height)
    }
    
}

class GridCell: UICollectionViewCell{
   
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func update(info: Info){
        imgView.image = info.image
        dateLabel.text = info.date
        titleLabel.text = info.title
    }
}

struct Info{
    let date: String
    let title: String
    
    var image:UIImage?{
        return UIImage(named:"\(title).jpg")
    }
    
    init(date: String, title: String){
        self.date = date
        self.title = title
    }
}

class InfoViewModel{
    let infoList:[Info] = [
        Info(date: "2020.01.01 ~ 2020.01.03", title:"flower_travel"),
        Info(date: "2020.01.01 ~ 2020.01.03", title:"street_travel"),
        Info(date: "2020.01.01 ~ 2020.01.03", title:"sea_travel"),
        Info(date: "2020.01.01 ~ 2020.01.03", title:"forest_travel")
    ]
    
    var numOfInfo: Int{
        return infoList.count
    }
    
    func info(at index: Int) -> Info{
        return infoList[index]
    }
}
