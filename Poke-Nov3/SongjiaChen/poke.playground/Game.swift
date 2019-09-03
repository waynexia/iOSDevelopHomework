import Cocoa

var str = "Hello, playground"

struct Card{
    var number: Int
    var symbol: String
}

class Game{
    
    var cards = [Card]()
    
    init(){
        for _number in 1...13{
            for _symbol in ["♦️", "♣️", "♠️", "♥️"]{
                cards.append(Card(number:_number, symbol: _symbol))
            }
        }
    }
    func getCards(_count: Int) -> Array<Card>{
        // 牌余量不足
        if(self.cards.count < _count){
            return [Card]()
        }
        var result = [Card]()
        for _ in 0..<_count{
            // 随机
            let randomNumber = Int(arc4random())%(cards.count)
            result.append(cards.remove(at: randomNumber))
        }
        return result
    }
    func distributeCards(_userCount: Int, _cardCount: Int) -> Array<Array<Card>>{
        var result = [Array<Card>]()
        for _ in 0..<_userCount{
            let userResult = self.getCards(_count: _cardCount)
            if(userResult.count > 0){
                result.append(userResult)
            }
            else{
                return [Array<Card>]()
            }
        }
        return result
    }
}

let myGame = Game()
for item in myGame.distributeCards(_userCount: 6, _cardCount: 4){
    print(item)
}
