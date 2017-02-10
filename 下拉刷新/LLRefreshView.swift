//
//  LLRefreshView.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/9.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

///** 刷新控件的状态 */
//typedef NS_ENUM(NSInteger, MJRefreshState) {
//    /** 普通闲置状态 */
//    MJRefreshStateIdle = 1,
//    /** 松开就可以进行刷新的状态 */
//    MJRefreshStatePulling,
//    /** 正在刷新中的状态 */
//    MJRefreshStateRefreshing,
//    /** 即将刷新的状态 */
//    MJRefreshStateWillRefresh,
//    /** 所有数据加载完毕，没有更多的数据了 */
//    MJRefreshStateNoMoreData
//};
class LLRefreshView: MJRefreshGifHeader {
    override func prepare() {
        super.prepare()
        stateLabel?.isHidden = false
        lastUpdatedTimeLabel?.isHidden = true
        
        setImages([#imageLiteral(resourceName: "idel1"),#imageLiteral(resourceName: "idel2"),#imageLiteral(resourceName: "idel3"),#imageLiteral(resourceName: "idel4"),#imageLiteral(resourceName: "idel5")], for: MJRefreshState.idle)
        setImages([UIImage(named: "v2_pullRefresh1")!], for: MJRefreshState.pulling)
        setImages([#imageLiteral(resourceName: "v2_pullRefresh2"),#imageLiteral(resourceName: "v2_pullRefresh3")], for: MJRefreshState.refreshing)
        setTitle("下拉刷新", for: .idle)
        setTitle("松手开始刷新", for: .pulling)
        setTitle("正在刷新", for: .refreshing)
    }
   

}
