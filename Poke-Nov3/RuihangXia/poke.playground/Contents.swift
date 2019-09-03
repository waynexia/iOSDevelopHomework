enum Rank: Int {
    case UNSPECIFIED = 0
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit: Int {
    case UNSPECIFIED = 0
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        default:
            return "unspecified"
        }
    }
}

class Card{
    var rank : Rank = Rank.UNSPECIFIED
    var suit : Suit = Suit.UNSPECIFIED
    
    init(rank : Int, suit:Int){
        self.rank = Rank(rawValue : rank)!
        self.suit = Suit(rawValue : suit)!
    }
    
    func show(){
        print("\(self.suit)\t\t\(self.rank)")
    }
}

class Deck{
    var cards = [Card]()
    var is_init = false;
    
    func initialize(){
        for suit in 1...4 {
            for rank in 1...13{
                cards.append(Card(rank:rank,suit:suit))
            }
        }
        cards.shuffle()
        self.is_init = true;
    }
    
    func deal() -> Card?{
        assert(self.is_init)
        let ret = cards.popLast()
        return ret;
    }
    
    func startGame(players:Int, cards:Int){
        if !self.is_init{
            print("Deck uninitialized, quit game")
            return
        }
        
        if players * cards > self.cards.count {
            print("Cards in this deck is not enough, quit game")
            return
        }
        
        for player in 1 ... players{
            print("Cards of Player \(player):")
            for _ in 1 ... cards{
                if let card = deal(){
                    card.show()
                }
            }
            print("\n")
        }
        
        self.is_init = false
    }
}


// body

// normal situation
let deck = Deck()
deck.initialize()
deck.startGame(players: 4, cards: 3)

// uninitialie
deck.startGame(players: 4, cards: 3)

// cards not enough
deck.initialize()
deck.startGame(players: 10, cards: 10)
