//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山口 彰太 on 2019/11/05.
//  Copyright © 2019 shouta.yamaguchi4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var playAndStop: UIButton!

    var images: Array<UIImage?> = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5"),
        UIImage(named: "6"),
        UIImage(named: "7"),
    ]
    var position = 0
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 初期画像設定
        imageView.image = images[position]
    }

    // スライドショー戻るボタン
    @IBAction func backButton() {
        position -= 1
        var changeImage: UIImage?
        if (position >= 0) {
            changeImage = images[position]
        } else {
            position = images.count - 1
            changeImage = images[position]
        }
        imageView.image = changeImage
    }

    // スライドショー進むボタン
    @IBAction func goButton() {
        position += 1
        var changeImage: UIImage?
        if (position <= (images.count - 1)) {
            changeImage = images[position]
        } else {
            position = 0
            changeImage = images[position]
        }
        imageView.image = changeImage
    }

    // スライドショー再生,停止ボタン
    @IBAction func playAndStopButton() {
        if (timer == nil) {
            // 再生開始時 戻る、進むボタンdisabled
            back.isEnabled = false
            go.isEnabled = false
            playAndStop.setTitle("PAUSE", for: .normal)
            // 再生ボタンを押すとスライドショー始動
            // 2秒毎にスライド
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideImage(_:)), userInfo: nil, repeats: true)
        } else {
            // 再生ボタン押下後、再度ボタン押下されると停止
            self.timer.invalidate()
            self.timer = nil
            // 停止時 戻る、進むボタンenabled
            back.isEnabled = true
            go.isEnabled = true
            playAndStop.setTitle("PLAY", for: .normal)
        }
    }

    // セグエを使用して画面を遷移
    @IBAction func expandImage(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "expandImage", sender: nil)
    }

    // セグエ実行前処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (timer != nil) { playAndStopButton() }
        let expandImageController: ExpandImageViewController = segue.destination as! ExpandImageViewController
        expandImageController.image = imageView.image
    }

    // timeInterval: 2, repeats: true で指定された通り、2秒毎に呼び出され続ける
    @objc func slideImage(_ timer: Timer) {
        goButton()
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

