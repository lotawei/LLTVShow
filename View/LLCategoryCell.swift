//
//  LLCategoryCell.swift
//  LLTVShow
//
//  Created by lotawei on 17/4/8.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
//内容 cell

import UIKit

class LLCategoryCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    let   leftpadding:CGFloat = 15.0
    
    var   curcategry:LLContenCategory!  //  名称 图片
    
    
     lazy   var   categoryimg:UIImageView! =  {
      let   img = UIImageView()
        img.isUserInteractionEnabled  =  true
        return img
    }()
    lazy  var   categorytitle:UILabel!   = {
        
       let  lab = UILabel()
      
        lab.font = UIFont.systemFont(ofSize: 16)
        lab.textAlignment = .left
        lab.textColor = fontcolor
        
        
        
        return  lab
        
    }()
    
    //封面图片集合列表
    var collectionView: LLBaseCollectionView!
    
    
    
    
    //封面数据

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        
        contentView.addSubview(self.categoryimg)
        contentView.addSubview(self.categorytitle)
        
        
    }
    func setcategory(_ category:LLContenCategory){
        
          curcategry = category
        
       
        //设置collectionView的代理
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
        self.categoryimg.kf.setImage(with: URL(string:curcategry.iconurl) , placeholder: UIImage(named:"palcehold"), options: nil, progressBlock: nil, completionHandler: nil)
        self.categorytitle.text = curcategry.title
        
        //  这里就是拿到过后
        
     
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.categoryimg.snp.makeConstraints { (maker) in
            maker.height.equalTo(80)
            maker.left.equalTo(leftpadding)
            maker.top.equalTo(leftpadding)
            maker.width.equalTo(80)
        }
        self.categorytitle.snp.makeConstraints { (maker) in
            maker.width.equalTo(100)
            maker.height.equalTo(30)
            maker.left.equalTo(130)
            maker.top.equalTo(20)
            
        }
        
        
    }
    
    required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //加载数据
    func reloadData() {
        //collectionView重新加载数据
        self.collectionView.reloadData()
    }
    
    //返回collectionView的单元格数量
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    //返回对应的单元格
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                       for: indexPath) as! LLMovieItemCell
        
        return cell
    }
    
    //绘制单元格底部横线
    override func draw(_ rect: CGRect) {
        //线宽
        let lineWidth = 1 / UIScreen.main.scale
        //线偏移量
        let lineAdjustOffset = 1 / UIScreen.main.scale / 2
        //线条颜色
        let lineColor = UIColor(red: 0xe0/255, green: 0xe0/255, blue: 0xe0/255, alpha: 1)
        
        //获取绘图上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        //创建一个矩形，它的所有边都内缩固定的偏移量
        let drawingRect = self.bounds.insetBy(dx: lineAdjustOffset, dy: lineAdjustOffset)
        
        //创建并设置路径
        let path = CGMutablePath()
        path.move(to: CGPoint(x: drawingRect.minX, y: drawingRect.maxY))
        path.addLine(to: CGPoint(x: drawingRect.maxX, y: drawingRect.maxY))
        
        //添加路径到图形上下文
        context.addPath(path)
        
        //设置笔触颜色
        context.setStrokeColor(lineColor.cgColor)
        //设置笔触宽度
        context.setLineWidth(lineWidth)
        
        //绘制路径
        context.strokePath()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

