//
//  Page1ViewController.swift
//  NewsTest
//
//  Created by 山﨑隼汰 on 2020/11/24.
//

import UIKit

import UIKit
import SegementSlide

class PageViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate {
    
    
    //XMLParserのインスタンスを作成する
    var parser = XMLParser()
    
    //RSSのパース中の現在の要素名
    var currentElementName:String!
    
    var newsItems = [NewsItems]()
    var sections = [String]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .clear
        
        //画像をtableViewの下に置く
//        let image = UIImage(named: "")
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height))
//        imageView.image = image
//        self.tableView.backgroundView = imageView
//
        
        //XMLパース
        let urlString = "http://www3.asahi.com/rss/animal.rdf"
        let url:URL = URL(string: urlString)!
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
        
        
        
    }
    
    //テーブルビューに返す
    @objc var scrollView: UIScrollView{
        
        return tableView
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsItems.count
    }

    //テーブルビューの高さを決めていく
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height/4
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        //クリアにすることで、下の画像が見えるようになる
        cell.backgroundColor = .clear
        
        let newsItem = self.newsItems[indexPath.row]
        
        
        cell.textLabel?.text = newsItem.title
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        cell.textLabel?.textColor = .black
        //最大の行数
        cell.textLabel?.numberOfLines = 3
        
        //2行目
        cell.detailTextLabel?.text = newsItem.url
        cell.detailTextLabel?.textColor = .black
        
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let label : UILabel = UILabel()
//        label.backgroundColor = UIColor.gray
//        label.textColor = UIColor.white
//
//        if(section == 0){
//                    label.text = sections [section]
//                } else if (section == 1){
//                    label.text = sections [section]
//                }
//                return label
//
//    }

    //XMLパース
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElementName =  nil
        
        if elementName == "item"{
            
            //itemのエレメントが見つかった場合、NewsItemsを用意する
            self.newsItems.append(NewsItems())
            
    
            
        }else{
            
            currentElementName = elementName
            
        }
        
        
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if self.newsItems.count > 0{
            
            //[1]
            let lastItem = self.newsItems[self.newsItems.count - 1]
            
            switch self.currentElementName{
                
            case "title":
                lastItem.title = string
            
            case "link":
                lastItem.url = string
                
            case "pubDate":
                lastItem.pubDate = string
            default:break
            }
            
        }
        
        
    }
    
    //didEndElementというのは、<title>タイトル</title>の</title>に来たときを指している
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        self.currentElementName = nil
        
    }
    
    //全て終わったら、リロードデータをする
    func parserDidEndDocument(_ parser: XMLParser) {
        
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //WebViewContorllerへ値を渡しながら遷移
        let webVC = WebViewController() as UIViewController
        navigationController?.pushViewController(webVC, animated: true)
        let newsItem = newsItems[indexPath.row]
        UserDefaults.standard.set(newsItem.url, forKey: "url")
        
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    
}
