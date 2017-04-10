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
    
    let   leftpadding:CGFloat = 5
    
    lazy  var   curcategry:LLContenCategory = {
         let   cur = LLContenCategory()
        return cur
    }()//  名称 图片
    
    
     lazy   var   categoryimg:UIImageView! =  {
      let   img = UIImageView()
        img.isUserInteractionEnabled  =  true
        return img
    }()
    lazy  var   categorytitle:UILabel!   = {
        
       let  lab = UILabel()
      
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.textAlignment = .left
        lab.textColor = fontcolor
        
        
        
        return  lab
        
    }()
    
    //封面图片集合列表
    lazy var collectionView: LLBaseCollectionView = {
        let  layout  = LLCollectionViewLayout()
        layout.scrollDirection = .horizontal
        
        layout.itemSize = CGSize(width: ScreenWidth, height: ScreenWidth)
        let      collectionView = LLBaseCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
    }()
    
    // 所有items
    lazy var   recitems:[LLCategoryRecItem] = {
         let   items =  [LLCategoryRecItem]()
        return  items
    }()
    
    
    //封面数据

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        
        contentView.addSubview(categoryimg)
        contentView.addSubview(categorytitle)
        //二级视图
        
     
       collectionView.delegate = self
       collectionView.dataSource = self

       collectionView.register(LLMovieItemCell.self, forCellWithReuseIdentifier: "cell")
       contentView.addSubview(collectionView)
        
        
        
        categoryimg.snp.makeConstraints { (maker) in
            maker.height.equalTo(70)
            maker.left.equalTo(leftpadding)
            maker.top.equalTo(leftpadding)
            maker.width.equalTo(70)
        }
        categorytitle.snp.makeConstraints { (maker) in
            maker.width.equalTo(100)
            maker.height.equalTo(30)
            maker.left.equalTo(130)
            maker.top.equalTo(30)
            
        }
        collectionView.snp.makeConstraints { (maker) in
            maker.top.equalTo(90)
            maker.width.equalTo(ScreenWidth)
            maker.height.equalTo(ScreenWidth)
            maker.left.equalTo(0)
        }
        
        
    }
    func setcategory(_ category:LLContenCategory){
        
         curcategry = category
        categoryimg.kf.setImage(with: URL(string:category.iconurl) , placeholder: UIImage(named:"palcehold"), options: nil, progressBlock: nil, completionHandler: nil)
        categorytitle.text = curcategry.title
        
        //  这里就是拿到过后  movieitem
    
        
        var    itemurl = ""
        if  category.code == "movie" || category.code == "tv"||category.code == "zongyi"||category.code == "comic"||category.code == "jilu"{
            
            itemurl = "http://open.moretv.com.cn/position/" + category.code
            
        }
        else{
            itemurl = "http://open.moretv.com.cn/position/comic"
        }
            weak   var  tmp = self
            _  =  LLAuthManager.Authorizon(itemurl, datablock: { (data) in
            
             LLCategoryRecItem.GetMovieItems(category, data, { (items) in
                tmp?.recitems = items
                tmp?.collectionView.reloadData()
                
             })
            
        })
      
        
        
     
        
    }
    
  
    
    required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
    //   代理
    
    
    // 数据
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return    recitems.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return   1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        var    cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?   LLMovieItemCell
        
        let  item = recitems[indexPath.row]
        
        if   cell == nil {
            cell = LLMovieItemCell()
            
            
            
        }
        cell?.backgroundColor = UIColor.black
        cell?.setitem(item)
        return   cell!
    }
    
    
    
}





