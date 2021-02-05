# プロジェクト名
ZooGo(ZooGoApp)  
-動物園マッチングアプリ-

# 開発フロー
アジャイル開発

# タスク管理
Git Issuesを使用

# 開発情報
・開発環境: Xcode(V12.4)  
・使用言語: Swift(5.3.2)  
・対応デバイス:iPhone(サポート対象:iOS14.3〜)  
・CocoaPods(V1.9.3)

# 使用ライブラリ  
**'lottie-ios'**  
 Airbnbが出しているアニメーションライブラリ  
 
**'SegementSlide'**  
スクロールメニューを実装できるライブラリ  
本アプリでは、ヘッダーの実装及び、今後,ニュースリーダーの機能拡張を想定し、使用  

**"SwiftyCam"**  
カメラ及びビデオの撮影機能を実装する  
本アプリはビデオの撮影機能のみ  

**'SwiftyJSON', '~> 4.0'**  
GitHubにMITライセンスで公開されているSwift用のJSONライブラリ  
本アプリでは、楽曲データを検索する時に使用  

**'Alamofire', '~> 5.2'**  
ネットワーク処理のプロセスを単純化するサードパーティー製のライブラリ  
本アプリでは、楽曲データを検索する時に使用  

**'SwiftVideoGenerator'**  
画像と音声を１つのビデオに合成したり、複数のビデオを1つにマージすることができるライブラリ  
本アプリでは、音楽と動画を合成する時に使用  

**'SDWebImage', '~> 5.0'**  
非同期処理で取得した画像を表示し、編集できるライブラリ  
本アプリでは、楽曲のジャケット写真を表示する時に使用  

**'Koloda', '~> 5.0.1'**  
スワイプ操作で対象を振り分けることができるライブラリ  

pod 'NVActivityIndicatorView'
pod 'ImpressiveNotifications'

# バージョン管理
GitHubを使用  
・ GitHub-Flow に基づき運用

# デザインパターン
MVCモデルを使用

# 環境構築
`` $ git clone https://github.com/Yamasaki-Shunta/ZooGoApp.git ``  
`` $ pod install ``

# インストール
[ZooGo(App Store)](https://apps.apple.com/jp/app/zoogo/id1552154924)

# 作者
shunta061689@gmail.com
