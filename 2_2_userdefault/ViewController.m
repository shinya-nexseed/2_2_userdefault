//
//  ViewController.m
//  2_2_userdefault
//
//  Created by Shinya Hirai on 2015/07/14.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSString *_str3; // str3を定義した
    // NSString *str4 = @"ほげ"; これはできない
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view, typically from a nib.
    
    // グローバル変数 ⇔ ローカル変数
    // 普通の変数 (ローカル変数) は、定義しているメソッド内でしか使用できません。
    // 例 : viewDidLoad内のdStr変数は、viewDidLoad内でしか使用できません。
    // ViewController.mファイル内のどこででも使用できる変数があれば、何かと便利です。
    // - おなじコード書かなくて良くなったり
    // 定義の仕方は、@interface ViewController ()の後に{}を作ってその中に定義します。
    // このとき、できるのは定義のみです。(初期化まではできません。)
    // 例 : NSString *str; ← これは◯
    //     NSString *str = @"hoge"; ← これは☓
    // グローバルな変数の場合、変数名の最初にアンダースコア(_)をつける
    // ※注意点
    // 影響が全体に与えられるので、使う際はより気を配って定義の流れとか、値の変更とかをする必要がある。
    
    
    // グローバル変数の初期化をする
    _str3 = @"ほげ";
    // myTextFieldとかのUIのパーツに名前つけてるものは_からでも呼び出せる
    
    
    // UserDefaultを定義、初期化
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 予約語
    // 例 : default
    
    // データの呼び出し
    NSString *dStr = [defaults stringForKey:@"MEMO"];
    
    
    self.myTextField.text = dStr;
    
    // アスタリスク (*) の位置について
    NSString *str1;
    NSString* str2;
    
    NSDictionary *dict1;
    NSString     *str3;
    NSArray      *ary2;
    // 半角スペースは、PCからしたらまったく意味がない
    // 人間にとって読みやすくするためだけにある
    
    // コードの読みやすさが超重要
    // - スペース
    // - 改行
    // - インデント
    
    if (0 == 0) {
        NSLog(@"ほげ");
    } else if (0 == 1) {
        // なにか
    } else {
        // ほげ
        for (int i = 0; i < 5; i++) {
            NSLog(@"hoge");
            
        }
    }
}


#pragma mark - viewAppear
- (void)viewWillAppear:(BOOL)animated {
    // 画面表示前に呼ばれるメソッド
    [super viewWillAppear:YES];
    NSLog(@"viewWillAppear");
    
    // TODO: ユーザー名を表示
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    // 画面表示後に呼ばれるメソッド
    NSLog(@"viewDidAppear");
}

#pragma mark - hoge

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputText:(id)sender {
    // UserDefaultを定義、初期化
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // TextFieldのtextの値をdefaultsのMEMOキーへ入れる
    [defaults setObject:self.myTextField.text forKey:@"MEMO"];
    
    // synchronizeで初めて保存される
    [defaults synchronize];
    // synchronizeしなくても一定時間アプリを起動してたら保存
}
@end
