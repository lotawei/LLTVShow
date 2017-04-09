//
//  LLMovieItemCell.swift
//  LLTVShow
//
//  Created by lotawei on 17/4/8.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLMovieItemCell: UICollectionViewCell,LTMorphingLabelDelegate {
    //上边距
    let  toppadding:CGFloat = 5
    
    //  上下间距
    let  lblpadding:CGFloat  = 25
    let  imgwidth:CGFloat = 208
    let  imgheight:CGFloat = 300
    
    
    // 描述 
    let  lblwidth:CGFloat = 27
    
    let  lblheight:CGFloat = 21
    let  scorewidth:CGFloat = 60
    // 具体放数据
    let  lbltxtwitdh:CGFloat = ScreenWidth - 208 - 27 - 2 * 15
    let  lbltxtheight:CGFloat  = 21
    //  影片图片
    lazy  var   itemimg:UIImageView = {
        
        let    imgview = UIImageView()
        imgview.isUserInteractionEnabled = true
        imgview.contentMode = .scaleAspectFit
        return  imgview
        
    }()
    
    
    
    
    // 影片名称
    lazy var  lblitemtitle:LTMorphingLabel = {
        let  alab = LTMorphingLabel()
        alab.delegate = self
        alab.morphingDuration = 2.0
        alab.textColor = UIColor.white
        alab.font = UIFont.systemFont(ofSize: 16)
        alab.morphingEffect = .burn
        alab.textAlignment = .center
        
        
        return  alab
    }()
    //导演
    lazy  var  lbldirector:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.white
        alab.font = UIFont.systemFont(ofSize: 10)
        alab.text = "导演:"
        alab.textAlignment = .left
        return  alab
    }()
    
    //
    lazy var  lbldirectxt:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.gray
        alab.font = UIFont.systemFont(ofSize: 10)
        alab.textAlignment = .left
        return  alab
    }()
    //主演
    lazy var  lblcast:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.white
        alab.font = UIFont.systemFont(ofSize: 10)
        alab.text = "主演:"
        alab.textAlignment = .left
        return  alab
    }()
    lazy var  lblcasttxt:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.gray
        alab.font = UIFont.systemFont(ofSize: 10)
        alab.textAlignment = .left
        return  alab
    }()
    //标签
    lazy  var  lbltag:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.white
        alab.font = UIFont.systemFont(ofSize: 10)
        alab.text = "标签:"
        alab.textAlignment = .left
        return  alab
    }()
    //
    lazy var  lbltagttxt:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.gray
        alab.font = UIFont.systemFont(ofSize: 12)
        alab.textAlignment = .left
        return  alab
    }()
    
    //地区
    lazy var  lblarea:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.white
        alab.font = UIFont.systemFont(ofSize: 10)
        alab.text = "地区:"
        alab.textAlignment = .left
        return  alab
    }()
    //
    lazy var  lblareatxt:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.gray
        alab.font = UIFont.systemFont(ofSize: 12)
        alab.textAlignment = .left
        return  alab
    }()
    
    
    //年份
    lazy var  lblyear:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.white
        alab.font = UIFont.systemFont(ofSize: 10)
        alab.text = "年份:"
        alab.textAlignment = .left
        return  alab
    }()
    //
    lazy var  lblyeartxt:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.gray
        alab.font = UIFont.systemFont(ofSize: 12)
        alab.textAlignment = .left
        return  alab
    }()
    // 评价
    lazy  var  lblscore:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = UIColor.white
        alab.font = UIFont.systemFont(ofSize: 10)
        alab.text = "评价:"
        alab.textAlignment = .left
        return  alab
    }()
    //
    lazy var  lblscoretxt:UILabel = {
        let  alab = UILabel()
        
        
        alab.textColor = fontcolor
        alab.font = UIFont.systemFont(ofSize: 14)
        alab.textAlignment = .left
        return  alab
    }()
    
    lazy  var   scoreimg:UIImageView = {
        
        let    imgview = UIImageView()
        imgview.isUserInteractionEnabled = true
        imgview.contentMode = .scaleAspectFit
        
        return  imgview
        
        
    }()
    lazy  var   btncollect:UIButton = {
        let   btn  =  UIButton()
        btn.setTitle("收藏", for: .normal)
        btn.backgroundColor = UIColor.gray
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        return  btn
        
    }()
    
    lazy var   itemmodel:LLCategoryRecItem = {
        let  item  =  LLCategoryRecItem()
        return  item
    }()
    override   init(frame:CGRect){
        
        
        
        super.init(frame: frame)
        
        
        
        contentView.addSubview(self.itemimg)
        contentView.addSubview(self.lblitemtitle)
        contentView.addSubview(self.lbldirector)
        contentView.addSubview(self.lbltag)
        contentView.addSubview(self.lblarea)
        contentView.addSubview(self.lblcast)
        contentView.addSubview(self.lblyear)
        contentView.addSubview(self.lblscore)
        contentView.addSubview(self.lblyear)
        contentView.addSubview(self.lbltagttxt)
        contentView.addSubview(self.lblscoretxt)
        contentView.addSubview(self.lblyeartxt)
        contentView.addSubview(self.lblareatxt)
        contentView.addSubview(self.lblcasttxt)
        contentView.addSubview(self.lbldirectxt)
        contentView.addSubview(self.scoreimg)
        contentView.addSubview(self.btncollect)
        
        
    }
    func   setitem(_ item:LLCategoryRecItem){
        self.itemmodel = item
        
        
        
        self.itemimg.kf.setImage(with: URL(string:item.item_icon1) , placeholder: UIImage(named:"cellimgpalcehold"), options: nil, progressBlock: nil, completionHandler: nil)
        
        self.lblitemtitle.text = item.item_title
        self.lbldirectxt.text = item.displaydirector()
        self.lblcasttxt.text = item.displaycast()
        self.lbltagttxt.text = item.displaytag()
        self.lblyeartxt.text = item.item_year
        self.lblscoretxt.text = item.item_score
        let   score = item.item_score.StringToFloat()
        if   score >= 7.0 {
            self.scoreimg.image = UIImage(named:"hot")
        }else  if  score > 5.0 &&  score < 7 {
              self.scoreimg.image = UIImage(named:"mid")
        }
        else{
             self.scoreimg.image = UIImage(named:"little")
        }
        
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.snp.makeConstraints { (maker) in
            maker.top.equalTo(0)
            maker.left.equalTo(0)
            maker.width.equalTo(ScreenWidth)
            maker.height.equalTo(ScreenWidth)
        }
        self.lblitemtitle.snp.makeConstraints { (maker) in
            maker.top.equalTo(imgheight + 2 * toppadding )
            maker.left.equalTo(toppadding)
            maker.width.equalTo(imgwidth)
            maker.height.equalTo(30)
        }
        
        self.itemimg.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding)
            maker.left.equalTo(toppadding)
            maker.width.equalTo(imgwidth)
            maker.height.equalTo(imgheight)
        }
        
        self.lbldirector.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding)
            maker.left.equalTo(imgwidth + toppadding * 2)
            maker.width.equalTo(lblwidth)
            maker.height.equalTo(lblheight)
        }
        //
        self.lbldirectxt.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding)
            maker.left.equalTo(imgwidth + toppadding * 2 + lblwidth)
            maker.width.equalTo(lbltxtwitdh)
            maker.height.equalTo(lbltxtheight)
        }
        
        
        self.lblcast.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding + lblheight + lblpadding)
            maker.left.equalTo(imgwidth + toppadding * 2)
            maker.width.equalTo(lblwidth)
            maker.height.equalTo(lblheight)
        }
        //
        self.lblcasttxt.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding + lblheight + lblpadding)
            maker.left.equalTo(imgwidth + toppadding * 2 + lblwidth)
            maker.width.equalTo(lbltxtwitdh)
            maker.height.equalTo(lbltxtheight)
        }
        
        self.lbltag.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding + 2 *  (lblheight  +  lblpadding))
            maker.left.equalTo(imgwidth + toppadding * 2)
            maker.width.equalTo(lblwidth)
            maker.height.equalTo(lblheight)
        }
        //
        self.lbltagttxt.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding + 2 *  (lblheight  +  lblpadding))
            maker.left.equalTo(imgwidth + toppadding * 2 + lblwidth)

            maker.width.equalTo(lbltxtwitdh)
            maker.height.equalTo(lbltxtheight)
        }
        self.lblyear.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding + 3 *  (lblheight  +  lblpadding))
            maker.left.equalTo(imgwidth + toppadding * 2)
            maker.width.equalTo(lblwidth)
            maker.height.equalTo(lblheight)
        }
        //
        self.lblyeartxt.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding + 3 *  (lblheight  +  lblpadding))
             maker.left.equalTo(imgwidth + toppadding * 2 + lblwidth )
            maker.width.equalTo(lbltxtwitdh)
            maker.height.equalTo(lbltxtheight)
        }
        
        self.lblscore.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding + 4 *  (lblheight  +  lblpadding))
            maker.left.equalTo(imgwidth + toppadding * 2)
            maker.width.equalTo(lblwidth)
            maker.height.equalTo(lblheight)
        }
        //
        self.lblscoretxt.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding + 4 *  (lblheight  +  lblpadding))
            maker.left.equalTo(imgwidth + toppadding * 2 + lblwidth)
            maker.width.equalTo(scorewidth)
            maker.height.equalTo(lblheight)
        }
        //
        self.scoreimg.snp.makeConstraints { (maker) in
            maker.top.equalTo(toppadding + 4 *  (lblheight  +  lblpadding))
            maker.left.equalTo(imgwidth + toppadding * 2 + lblwidth + scorewidth)
            maker.width.equalTo(lblheight)
            maker.height.equalTo(lblheight)
        }
        self.btncollect.snp.makeConstraints { (maker) in
            maker.top.equalTo( imgheight + 2 * toppadding)
            maker.width.equalTo(60)
            
            maker.height.equalTo(lblheight)
            maker.right.equalTo(-toppadding)
            
            
            
            
            
        }
       
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
    
}
