//
//  LLAcountViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
//  这里  使用 列表模拟数据
class LLAcountViewController: BaseViewController {
    var sourceType = UIImagePickerControllerSourceType.photoLibrary
    let   mainscrollerview:UIScrollView! = nil
    // 数据  暂时先自己构建吧
    let   accoutlistdata: NSMutableArray = {
        let    data = NSMutableArray(capacity: 0)
        
        // isdefault 三个值  defalut 又详情的按钮  on  表示夜间开关模式
        let   se1 =    ["info":"我的消息","icon":"message","isdefault":"default"]
        let  se2r0 =    ["info":"升级会员","icon":"VIP","isdefault":"default"]
        let  se2r1 =     ["info":"猜你喜欢","icon":"intersting","isdefault":"default"]
        let  se2r2 =     ["info":"主题皮肤","icon":"skin","isdefault":"default"]
        let  se3r0 =    ["info":"夜间模式","icon":"darkstyle","isdefault":"on"]
        let  se3r1 =      ["info":"分享","icon":"share","isdefault":"default"]
        let  se3r2 =     ["info":"清理缓存","icon":"clean","isdefault":"default"]
        let  se3r3 =     ["info":"关于","icon":"about","isdefault":"default"]
        let    section1 = NSMutableArray(capacity: 0)
        section1.add(se1)
        let     section2 =  NSMutableArray(capacity: 0)
         section2.add(se2r0)
         section2.add(se2r1)
         section2.add(se2r2)
        let    section3 =  NSMutableArray(capacity: 0)
        section3.add(se3r0)
         section3.add(se3r1)
         section3.add(se3r2)
         section3.add(se3r3)
        data.add(section1)
        data.add(section2)
        data.add(section3)
        return   data
    }()
    
    //头部
    
    //  头像
    var   imgportrait:UIImage!
    // 功能不实现
    lazy var   infoview:LLUerInfoView = {
        
        let   ainfoview = Bundle.main.loadNibNamed("LLUerInfoView", owner: nil, options: nil)?.first  as!LLUerInfoView
        return  ainfoview
    }()
    
    
    let   headview:UIView = UIView()
    //
    lazy var   btnlogin:UIButton = {
        let  btn = UIButton()
        btn.backgroundColor = fontcolor
        btn.setTitle("登录", for: .normal)
        btn.addTarget(self, action: #selector(LLAcountViewController.login), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        return  btn
    }()
    //
    lazy var   btnregister:UIButton = {
        let  abtn = UIButton()
        abtn.backgroundColor = fontcolor
        abtn.setTitle("注册", for: .normal)
        abtn.addTarget(self, action: #selector(LLAcountViewController.register), for: .touchUpInside)
        abtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        return  abtn
    }()
    
    //头像
    lazy  var  portraitimg:UIImageView = {
        let  img = UIImageView()
        img.backgroundColor = UIColor.black
        img.isUserInteractionEnabled  =  true
        let  atapgesture = UITapGestureRecognizer(target: self, action: #selector(LLAcountViewController.changeportrait))
        img.addGestureRecognizer(atapgesture)
        return  img
    }()
    //退出按钮
    lazy   var   btnlogout:UIButton = {
        
        let  logout  = UIButton()
        logout.setTitle("退出", for: .normal)
        logout.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        logout.backgroundColor = fontcolor
        logout.addTarget(self, action: #selector(LLAcountViewController.logout), for: .touchUpInside)
        return  logout
    }()
    
    //下方列表
    
    lazy var   tableview:LLBaseTableView = {
        let   listtable = LLBaseTableView(frame: CGRect.zero,style: .plain)
        
        return  listtable
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        initialview()
        
        updateview()
      //订阅
        NOTIfyCenter.addObserver(self, selector: #selector(LLAcountViewController.getnotify(_:)), name: NSNotification.Name(rawValue: notificationName), object: nil)
        
        NOTIfyCenter.addObserver(self, selector: #selector(LLAcountViewController.getnotify(_:)), name: NSNotification.Name(rawValue: notificationSelect), object: nil)
        
    }
    func animateTable(_ tableView:UITableView) {
         tableview.reloadData()
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateview()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         animateTable(self.tableview)
    }
    // configheadview
    func updateview()  {
        //无用户
        let   auser = LLCurrentUser.currentuser.user
        var   porimg:UIImage!
        
        
        if  auser  != nil &&   (auser?.alreadysetportrait())!{
            let    imgpath = auser?.portrait
            porimg  =  UIImage(contentsOfFile: imgpath!)
        }
        else  if  auser == nil {
            porimg  =  UIImage(named: "default")
        }
            
        else{
            porimg  =  UIImage(named: (auser?.portrait)!)
        }
        if auser != nil {
            
            self.btnlogin.isHidden  =  true
            self.btnregister.isHidden = true
            self.btnlogout.isHidden = false
        }
        else{
            
            self.btnlogin.isHidden  =  false
            self.btnregister.isHidden = false
            self.btnlogout.isHidden = true
        }
        self.portraitimg.image =  porimg
    }
    func initialview(){
        self.navigationController?.navigationBar.isHidden = true
        view.addSubview(headview)
        headview.backgroundColor = UIColor.gray
        headview.addSubview(self.btnlogin)
        headview.addSubview(self.btnregister)
        headview.addSubview(self.portraitimg)
        headview.addSubview(self.btnlogout)
        view.addSubview(self.infoview)
        view.addSubview(self.tableview)
        self.infoview.delegate = self
        self.tableview.delegate = self
        self.tableview.dataSource = self
        let cellNib = UINib(nibName: "LLAccoutCell", bundle: nil)
        self.tableview.register(cellNib, forCellReuseIdentifier: "cell")
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.portraitimg.clipsToBounds = true
        self.portraitimg.layer.cornerRadius = 40
        
        
        self.btnlogin.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-60)
            maker.left.equalTo((ScreenWidth - 240)/2.0)
            
        }
        self.infoview.snp.makeConstraints { (maker) in
            maker.width.equalTo(ScreenWidth)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-60)
            maker.left.equalTo(0)
        }
        
        self.portraitimg.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(80)
            maker.centerX.equalTo(headview)
            maker.top.equalTo(25)
        }
        self.btnregister.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-60)
            maker.right.equalTo(-(ScreenWidth - 240 )/2.0)
        }
        self.headview.snp.makeConstraints { (maker) in
            maker.top.equalTo(0)
            maker.width.equalTo(ScreenWidth)
            maker.height.equalTo(200)
        }
        self.btnlogout.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(headview)
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-60)
            
        }
        self.tableview.snp.makeConstraints { (maker) in
            maker.width.equalTo(ScreenWidth)
            
            maker.height.equalTo(ScreenHeight  -  245)
            maker.top.equalTo(202)
        }
        self.infoview.snp.makeConstraints { (maker) in
            maker.width.equalTo(ScreenWidth)
            maker.left.equalTo(0)
            maker.height.equalTo(30)
            maker.top.equalTo(170)
        }
        
        updateview()
    }
    func login()  {
        
        
        self.navigationController?.pushViewController(LLLoginViewController(), animated: true)
        
        
    }
    func     register(){
        self.navigationController?.pushViewController(LLRegisterViewController(), animated: true)
        
        
        
    }
    func  logout(){
        LLCurrentUser.currentuser.user.cleanuser()
        updateview()
        
    }
    // 改变头像
    func   changeportrait(){
        let   auser = LLCurrentUser.currentuser.user
        if auser == nil {
            
            _  = SweetAlert().showAlert("请先登录")
            return
        }
        
        
        let   alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "相册", style: .default, handler: {(action) in
            if(self.PhotoLibraryPermissions() == true){
                self.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.open()
            }else{
                _  = SweetAlert().showAlert("请到通用－>隐私设置允许访问相册")
                
                
            }
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "软件提供", style: .default, handler: { (action) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
      
        
    }
   
    
    private    func  open(){
        let imagePickerController:UIImagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true//true为拍照、选择完进入图片编辑模式
        imagePickerController.sourceType = sourceType
        self.present(imagePickerController, animated: true, completion:nil)
    }
    //访问相机
    private  func cameraPermissions() -> Bool{
        
        let authStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        if(authStatus == AVAuthorizationStatus.denied || authStatus == AVAuthorizationStatus.restricted) {
            return false
        }else {
            return true
        }
        
    }
    //访问相册
    private  func PhotoLibraryPermissions() -> Bool {
        
        let library:PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        if(library == PHAuthorizationStatus.denied || library == PHAuthorizationStatus.restricted){
            return false
        }else {
            return true
        }
    }
    
    
    
    
    
    
    
    
    //移除通知
    
    deinit {
        
        NOTIfyCenter.removeObserver(self, name: NSNotification.Name(rawValue: notificationName), object: nil)
        
        NOTIfyCenter.removeObserver(self, name: NSNotification.Name(rawValue: notificationSelect), object: nil)
        
        
        
    }
    
    
}
extension  LLAcountViewController : UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate , UIImagePickerControllerDelegate ,LLUerInfoViewProDelegate{
    //  tableview 代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return  accoutlistdata.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let     arr = self.accoutlistdata[section] as!  NSArray
        return  arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var  cell = tableview.dequeueReusableCell(withIdentifier: "cell") as?  LLAccoutCell
        let  cells = self.accoutlistdata[indexPath.section]  as!   NSArray
        let  info = cells[indexPath.row] as!  NSDictionary
        if   cell ==  nil {
            
            cell = LLAccoutCell(style: .default, reuseIdentifier: "cell")
        }
//        cell?.textLabel?.text = accoutlistdata[indexPath.row]
        cell?.model = info
        return cell!
    }
  
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return   15
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if   indexPath.section == 2  && indexPath.row == 0{
            return
        }
        let  cells = self.accoutlistdata[indexPath.section]  as!   NSArray
        let  info = cells[indexPath.row] as!  NSDictionary
        let   selectnname = info["info"] as! String
        
        
        let notificationName = Notification.Name(rawValue: "notifystyle")
        let obj = trantonotifyname(selectnname)
        NotificationCenter.default.post(name: notificationName, object: obj,
            userInfo:nil)
        
    }
    
    
    // 页面跳转回调用
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        updateview()
    }
    
    //  图片选择代理
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController( _ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        // 拿到此图片 需要 存入本地
        let   userpath = userCachePath.appending("\(LLCurrentUser.currentuser.user.username)_por.png")
        let   imgdata = UIImageJPEGRepresentation(image, 0.5)
        //  写入时先将本地头像清理了
        if(FileManager.default.fileExists(atPath:userpath)){
            // 删除
            try! FileManager.default.removeItem(atPath: userpath)
        }
        do  {
            try imgdata?.write(to: URL(fileURLWithPath: userpath))
            //  需要重新归档
            _   =  LLCurrentUser.currentuser.user.changeportrait(path:userpath)
            _ = LLCurrentUser.currentuser.user.saveuser()
            
        }catch {
            print(error)
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func  selectindexitem(index:Int){
        print(index)
    }
    func  getnotify(_ notify:Notification){
         let  str  =  notify.object  as!  String
        switch str {
        case "我的消息":
            _  = SweetAlert().showAlert(str)
        case "升级会员":
            _  = SweetAlert().showAlert(str)
        case "主题皮肤":
            _  = SweetAlert().showAlert(str)
        case "分享":
            _  = SweetAlert().showAlert(str)
        case "清理缓存":
            _  = SweetAlert().showAlert(str)
        case "关于":
            _  = SweetAlert().showAlert(str)
        default:
            _  = SweetAlert().showAlert("nil")
        }
        
        
        
    }
    func   trantonotifyname(_ str:String) -> String{
        
        if  str == "我的消息"{
            
            return LLPOSTmsg
        }
        if  str == "升级会员"{
            
            return LLPOSTLevelUpVip
        }
        if  str == "主题皮肤"{
            
            return LLPOSTSubstyle
        }
        if  str == "分享"{
            
            return LLPOSTShare
        }
        if  str == "清理缓存"{
            
            return LLPOSTClean
        }
        if  str == "关于"{
            
            return LLPOSTAbout
        }
        return   ""
        
    }
    
    
}
