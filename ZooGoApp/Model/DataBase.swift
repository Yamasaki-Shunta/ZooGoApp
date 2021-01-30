//
//  DataBase.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/08.
//

import UIKit


struct DataSet {
    
    let  animalName: String
    let  parkName:String
    
    
}

let eastCuteData = [ 

    DataSet(animalName: "ホッキョクグマ", parkName:"円山動物園"),
    DataSet(animalName: "スナネコ", parkName:"那須どうぶつ王国"),
    DataSet(animalName: "レッサーパンダ", parkName:"八木山動物園"),
    DataSet(animalName: "オウサマペンギン", parkName:"旭山動物園"),
    DataSet(animalName: "ワオキツネザル", parkName:"東武動物公園"),
    DataSet(animalName: "オカピ", parkName:"よこはま動物園ズーラシア"),
    DataSet(animalName: "ベアードバク", parkName:"金沢動物園"),
    DataSet(animalName: "シロサイ", parkName:"群馬サファリパーク"),
    DataSet(animalName: "アムールトラ", parkName:"宇都宮動物園"),
    DataSet(animalName: "ゴリラ", parkName:"東山動物園"),
    DataSet(animalName: "カピバラ", parkName:"伊豆シャボテン動物公園"),
    DataSet(animalName: "タスマニアデビル", parkName:"多摩動物公園"),
    DataSet(animalName: "コアラ", parkName:"埼玉こども動物自然公園"),
    DataSet(animalName: "エゾヒグマ", parkName:"かみね動物園"),
    DataSet(animalName: "ジャイアントパンダ", parkName:"上野動物園")

]

let westCuteData = [

    DataSet(animalName: "ジャガー", parkName:"京都動物園"),
    DataSet(animalName: "ジャイアントパンダ", parkName:"アドベンチャーワールド"),
    DataSet(animalName: "カバ", parkName:"天王寺動物園"),
    DataSet(animalName: "ウォンバット", parkName:"五月山動物園"),
    DataSet(animalName: "マヌルネコ", parkName:"王子動物園"),
    DataSet(animalName: "ハシビロコウ", parkName:"神戸どうぶつ王国"),
    DataSet(animalName: "オオサンショウウオ", parkName:"安佐動物園"),
    DataSet(animalName: "シロテテナガザル", parkName:"ときわ動物園"),
    DataSet(animalName: "オランウータン", parkName:"とべ動物園"),
    DataSet(animalName: "コツメカワウソ", parkName:"のいち動物公園"),
    DataSet(animalName: "キリン", parkName:"大牟田動物園"),
    DataSet(animalName: "チンパンジー", parkName:"フェニックス自然動物園"),
    DataSet(animalName: "シンリンオオカミ", parkName:"平川動物公園"),
    DataSet(animalName: "キンカジュー", parkName:"ネオパーク沖縄"),

]

let feedingData = [

    DataSet(animalName: "オオカミの餌やり", parkName:"富士市ファミリーパーク(餌やり)"),
    DataSet(animalName: "オニオオハシの餌やり", parkName:"神戸どうぶつ王国(餌やり)"),
    DataSet(animalName: "カワウソの餌やり", parkName:"伊豆シャボテン動物公園(餌やり)"),
    DataSet(animalName: "キリンの餌やり", parkName:"かみね動物園(餌やり)"),
    DataSet(animalName: "チンパンジーの餌やり", parkName:"池田動物園(餌やり)"),
    DataSet(animalName: "ペンギンの餌やり", parkName:"埼玉こども動物自然公園(餌やり)"),
    DataSet(animalName: "ホワイトタイガーの餌やり", parkName:"宇都宮動物園(餌やり)"),
    DataSet(animalName: "ワオキツネザルの餌やり", parkName:"東武動物公園(餌やり)"),
    DataSet(animalName: "レッサーパンダの餌やり", parkName:"那須どうぶつ王国(餌やり)"),
    DataSet(animalName: "カバの餌やり", parkName:"アドベンチャーワールド(餌やり)"),

]

let eventData = [

    DataSet(animalName: "ペンギンのお散歩", parkName:"旭山動物園(イベント)"),
    DataSet(animalName: "ワラビーのふれあい", parkName:"宇都宮動物園(イベント)"),
    DataSet(animalName: "サファリツアー", parkName:"群馬サファリパーク(イベント)"),
    DataSet(animalName: "アシカショー", parkName:"アドベンチャーワールド(イベント)"),
    DataSet(animalName: "バードショー", parkName:"ネオパーク沖縄(イベント)"),
    DataSet(animalName: "ワオキツネザルの解説", parkName:"神戸どうぶつ王国(イベント)"),
    DataSet(animalName: "キャットショー", parkName:"那須どうぶつ王国(イベント)"),
    DataSet(animalName: "チンパンジーの解説", parkName:"かみね動物園(イベント)"),
    DataSet(animalName: "カワウソの解説", parkName:"のいち動物公園(イベント)"),
    DataSet(animalName: "フラミンゴショー", parkName:"フェニックス自然動物園(イベント)"),

]

let endangeredSpeciesData = [

    DataSet(animalName: "ミミセンザンコウ", parkName:"上野動物園(絶滅)"),
    DataSet(animalName: "ゴールデンライオンタマリン", parkName:"浜松市動物園(絶滅)"),
    DataSet(animalName: "ヒクイドリ", parkName:"東武動物公園(絶滅)"),
    DataSet(animalName: "ラッコ", parkName:"アドベンチャーワールド(絶滅)"),
    DataSet(animalName: "リカオン", parkName:"よこはま動物園ズーラシア(絶滅)"),
    DataSet(animalName: "ユキヒョウ", parkName:"旭山動物園(絶滅)"),
    DataSet(animalName: "パフィン", parkName:"那須どうぶつ王国(絶滅)"),
    DataSet(animalName: "ツシマヤマネコ", parkName:"福岡市動物園(絶滅)"),
    DataSet(animalName: "ニホンライチョウ", parkName:"富士市ファミリーパーク(絶滅)"),
    DataSet(animalName: "アムールヒョウ", parkName:"王子動物園(絶滅)"),
    DataSet(animalName: "キーウィ", parkName:"天王寺動物園(絶滅)"),
    DataSet(animalName: "ウンピョウ", parkName:"のいち動物公園(絶滅)"),
    DataSet(animalName: "コウノトリ", parkName:"多摩動物公園(絶滅)"),
    DataSet(animalName: "キンシコウ", parkName:"熊本市動植園(絶滅)"),
    DataSet(animalName: "クアッカワラビー", parkName:"埼玉こども動物自然公園(絶滅)"),

]
