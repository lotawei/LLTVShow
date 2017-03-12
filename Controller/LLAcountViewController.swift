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
class LLAcountViewController: BaseViewController {
    var sourceType = UIImagePickerControllerSourceType.photoLibrary
    let   mainscrollerview:UIScrollView! = nil
    // 数据
    lazy   var   listcount = ["周一","zhoue","zhousa","zhousi","zhouw","周一","zhoue","zhousa","zhousi","zhouw","周一","zhoue","zhousa","zhousi","zhouw"]
    //头部

    //  头像
    var   imgportrait:UIImage!
    
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
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateview()
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
        view.addSubview(self.tableview)
        self.tableview.delegate = self
         self.tableview.dataSource = self
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.portraitimg.clipsToBounds = true
        self.portraitimg.layer.cornerRadius = 40
        
   
        self.btnlogin.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-10)
            maker.left.equalTo((ScreenWidth - 240)/2.0)
            
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
            maker.bottom.equalTo(-10)
             maker.right.equalTo(-(ScreenWidth - 240 )/2.0)
        }
        self.headview.snp.makeConstraints { (maker) in
            maker.top.equalTo(0)
            maker.width.equalTo(ScreenWidth)
            maker.height.equalTo(150)
        }
        self.btnlogout.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(headview)
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-10)

        }
        
        
        self.tableview.snp.makeConstraints { (maker) in
            maker.width.equalTo(ScreenWidth)
            
            maker.height.equalTo(ScreenHeight  -  199)
            maker.top.equalTo(150)
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
        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//        //按钮：从相册选择，类型：UIAlertActionStyleDefault
//        [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:nil]];
//        //按钮：拍照，类型：UIAlertActionStyleDefault
//        [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:nil]];
//        //按钮：取消，类型：UIAlertActionStyleCancel
//        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
//        [self presentViewController:alert animated:YES completion:nil];
          //弹窗
        
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
    
   

}
extension  LLAcountViewController : UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate , UIImagePickerControllerDelegate{
   //  tableview 代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return   1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.listcount.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var  cell = tableview.dequeueReusableCell(withIdentifier: "cell")
        
        if   cell ==  nil {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = listcount[indexPath.row]
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
    
    

    
}
