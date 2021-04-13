//
//  ViewController.swift
//  viewDidLoad畫面1-黑魔女
//
//  Created by 蔡佳穎 on 2021/4/13.
//

import UIKit
import SpriteKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //【漸層背景】
        let gradientView = UIView(frame: view.bounds)
        //漸層View，大小跟預設的螢幕View一樣
                
        let gradientLayer = CAGradientLayer()
        //建立顯示漸層的CAGradientLayer物件
                
        gradientLayer.frame = gradientView.bounds
        //設定漸層Layer和漸層View大小一樣
                
        gradientLayer.colors =
                    [UIColor(red: 227/255, green: 79/255, blue: 3/255, alpha: 1).cgColor,
        UIColor(red: 140/255, green: 13/255, blue: 9/255, alpha: 1).cgColor, UIColor(red: 191/255/255, green: 12/255, blue: 11/255, alpha: 1).cgColor]
        //設定漸層顏色，用陣列設定不限數目
                
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        //設定漸層方向
                
        gradientLayer.locations = [0, 0.8, 1]
        //設定漸層顏色比例（0~1）
                
        gradientView.layer.addSublayer(gradientLayer)
        /*利用gradientView.layer的addSublayer加入gradientLayer。因為gradientLayer是layer，所以必須用 addSublayer加入，不能用addSubview*/
        view.addSubview(gradientView)
        //把gradientView加入螢幕的View
        
        
        //【加入黑魔女mask】
        let witchImage = UIImage(named: "黑魔女")
        let witchImageView = UIImageView(image: witchImage)
        witchImageView.frame = view.bounds
        witchImageView.contentMode = .scaleAspectFit
        //設定witchImageView大小維持比例
                
        gradientView.mask = witchImageView
        //把mask加入gradientView
        
        
        //【加入火焰效果】
        let skView = SKView(frame: view.frame)
        //SpriteKit顯示的畫面呈現在SKView型別的view裡，因此要先產生SKView物件
        view.insertSubview(skView, at: 0)
        //用insertSubview把skView加到畫面底層
                
        let scene = SKScene(size: skView.frame.size)
        //SKView顯示的內容由SKScene控制，因此產生SKScene
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.07)
        //設定火的位置，畫面左下角(0, 0)，右上角(1, 1)
                
        let emitterNode = SKEmitterNode(fileNamed: "MyFireParticle")
        /*SKEmitterNode專門呈現粒子效果。
        我們在產生SKEmitterNode時傳入SpriteKit Particle File的檔名，產生製造火焰效果的SKEmitterNode*/
        scene.addChild(emitterNode!)
        //再從scene呼叫addChild加入SKEmitterNode，讓scene顯示火焰的粒子效果
                
        skView.presentScene(scene)
        //從skView呼叫presentScene顯示SKScene的內容
        
        
        //【加入GIF動畫】
        //產生imageView
        let batImageView = UIImageView(frame: CGRect(x: 0, y: 200, width: 108.5, height: 94))
        let smallBatImageView = UIImageView(frame: CGRect(x: 0, y: 200, width: 75.95, height: 47))
        let moonImageView = UIImageView(frame: CGRect(x: 250, y: 50, width: 100, height: 100))
        moonImageView.alpha = 0.3
                
        //位移&縮放
        batImageView.transform = CGAffineTransform.identity.scaledBy(x: 0.45, y: 0.45).translatedBy(x: 3, y: 3)
        smallBatImageView.transform = CGAffineTransform.identity.scaledBy(x: 0.35, y: 0.35).translatedBy(x: 2.5, y: 2.5)
                
        //把imageView加入view
        view.addSubview(batImageView)
        view.addSubview(moonImageView)
        view.addSubview(smallBatImageView)
                
        //產生動畫圖片的array
        var batImages = [UIImage]()
        var smallBatImages = [UIImage]()
        var moonImages = [UIImage]()
        for i in 0...3 {
                batImages.append(UIImage(named: "145e605194c84aaa9503a1062e300a86WBGDkYnMfjM9L8GE-\(i)")!)
                }
        for i in 0...3 {
                smallBatImages.append(UIImage(named: "145e605194c84aaa9503a1062e300a86WBGDkYnMfjM9L8GE-\(i)")!)
                }
        for i in 0...11 {
                moonImages.append(UIImage(named: "798dd88f9ad54bbc85af30d7fbb70ad8hx59ZAQVNQ2Z0v3a-\(i)")!)
                }
                
        //將產生的動畫array儲存到imageView的animationImages
        batImageView.animationImages = batImages
        smallBatImageView.animationImages = smallBatImages
        moonImageView.animationImages = moonImages
                
        //動畫時間
        batImageView.animationDuration = 1.15
        smallBatImageView.animationDuration = 0.8
        moonImageView.animationDuration = 14
                
        //動畫次數
        batImageView.animationRepeatCount = 18
        smallBatImageView.animationRepeatCount = 20
        moonImageView.animationRepeatCount = 3
                
        //動畫停止的最後畫面
        batImageView.image = batImages.last
        smallBatImageView.image = batImages.last
        moonImageView.image = moonImages.last
                
        //開始動畫
        batImageView.startAnimating()
        smallBatImageView.startAnimating()
        moonImageView.startAnimating()
    }


}

