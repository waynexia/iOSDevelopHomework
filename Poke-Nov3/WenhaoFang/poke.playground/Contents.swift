import UIKit

var str = "Hello, playground"

class Game {
    var cards = Array<Dictionary<String, Int>>()
    
    init(){
        for num in 1...13 {
            for sym in 1...4 {
                cards.append(["number": num, "symbol": sym])
            }
        }
    }
    
    func getOne() -> Dictionary<String, Int> {
        if cards.count > 0 {
            let randomIndex = Int(arc4random()) % cards.count
            return cards.remove(at: randomIndex)
        } else {
            return ["number": 0, "symbol": 0]
        }
    }
    
    func getMany(userNum: Int, cardNum: Int) -> Array<Array<Dictionary<String, Int>>> {
        if userNum * cardNum < cards.count {
            var result = Array<Array<Dictionary<String, Int>>>()
            for _ in 1...userNum {
                var user = Array<Dictionary<String, Int>>()
                for _ in 1...cardNum {
                    let randomIndex = Int(arc4random()) % cards.count
                    let card = cards.remove(at: randomIndex)
                    user.append(card)
                }
                result.append(user)
            }
            return result
        } else {
            return [[["number": 0, "symbol": 0]]]
        }
    }
}

var game = Game()
print(game.getMany(userNum: 2, cardNum: 13))
print(game.getOne())
print(game.getMany(userNum: 2, cardNum: 13))
