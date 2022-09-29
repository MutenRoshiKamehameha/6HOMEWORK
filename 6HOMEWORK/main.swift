//
//  main.swift
//  6HOMEWORK
//
//  Created by Байгелди Акылбек уулу on 28/9/22.
//

import Foundation
//Переменные для общего чека
var namesOfProducts = ""
var pricesOfProducts1KG = ""
var pricesOfPruducts = ""
var creatorsOfProducts = ""
var weightsOfProducts = ""
var discountOfProducts = ""
var NumberOfShoping = 0

var totalCount:Float = 0


//переменные для единичного чека
var discountProduct:Float = 0.0
var priceProducts:Float = 0.0


//Функция которая либо продолжает добавялять продукты(да), либо останавливается и принтует общий чек
func addProducts(answer:String){
    if answer == "yes"{
    startToShop(move: move)
        
    }else if answer == "no"{
        print("""
        
        Название продукта            \(namesOfProducts)

        Название производителя       \(creatorsOfProducts)

        Цена за штуку/кг/л           \(pricesOfProducts1KG)

        Количество/вес               \(weightsOfProducts)

        Скидка                       \(discountOfProducts)

        Цена за каждый товар         \(pricesOfPruducts)

        Итого                        \(totalCount)

        """)
        print("Хорошо, спасибо за покупку, приходите еще")
    }else{
        print("""
        
        Название продукта            \(namesOfProducts)

        Название производителя       \(creatorsOfProducts)

        Цена за кг/л                 \(pricesOfProducts1KG)

        Вес                          \(weightsOfProducts)

        Скидка                       \(discountOfProducts)

        Цена за каждый товар         \(pricesOfPruducts)

        Итого                        \(totalCount)


    До свидания!
    """)
    }
}


//Функция которая принтует единичный чек
func startToShop(move:String){
    
    if move == "yes" {
        func shop(name:String,price1kg:Float,creators:String,weight:Float,discount:Float){
            
            NumberOfShoping += 1
            
            if discount != 0 {
                 priceProducts += (price1kg * weight)
                 discountProduct += (discount * 0.01)
                 priceProducts -= (priceProducts * discountProduct)
            
            
            
                
            }else if discount == 0 {
                
                priceProducts += (price1kg * weight)
                
            }
            namesOfProducts += ("(\(NumberOfShoping)) \(name),")
            creatorsOfProducts += ("(\(NumberOfShoping)) \(creators),")
            pricesOfProducts1KG += ("(\(NumberOfShoping)) \(price1kg),")
            weightsOfProducts += ("(\(NumberOfShoping)) \(weight),")
            discountOfProducts += ("(\(NumberOfShoping)) \(discount),")
            pricesOfPruducts += ("(\(NumberOfShoping)) \(priceProducts),")
           totalCount += priceProducts
            
            
                print("""
        
        Название продукта            \(name)
        Название производителя       \(creators)
        Цена за штуку/кг/л/          \(price1kg)
        Количество/вес               \(weight)
        Скидка                       \(discount)
        К оплате                     \(priceProducts)
        
        """)
            }
        print("Напишите название товара (обязательно):")
        let name = readLine()!

        print("Напишите название проивзодственной компании (если есть):")
        let creators = readLine()!

        print("Напишите количество или вес(кг/л) если на развес :")
        let weight = readLine()!

        print("Напишите цену товара за 1 штуку/кг/л :")
        let price1kg = readLine()!

        print("Напишите скидку (если есть):")
        let discount = readLine()!

        shop(name: name, price1kg: Float(price1kg) ?? 0, creators: creators,weight:Float(weight) ?? 0,
             discount:Float(discount) ?? 0)
        
        print("Добавить другой товар(yes/no)")
        let answer = readLine()!
            addProducts(answer: answer)
            
    }else if move == "no" {
        print("Ну а зачем ты тогда в магаз пришел?")
    }else{
        print("Я вас не понял перезапустите консоль")
    }
}
print("Здравствуйте, вы хотите что то купить? (yes/no)")
let move = readLine()!
startToShop(move: move)


