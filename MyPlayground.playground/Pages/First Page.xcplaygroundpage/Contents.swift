import UIKit

let constant = 10
var number = 10
var result = number + constant

//let constant: Int = 10
//var number: Int = 10
//var result: Int = number + constant

//var number: Double = 10.5

//var message = "The best way to get started is to stop talking and code."

var greeting = "Hello "
var name = "Loyio"
var message = greeting + name


message.uppercased()

message.lowercased()

message.count

var age = 20
//var greetMsg = "I am " + String(age) + " years old"

var greetMsg = "I am \(age) years old"

//var timeYouWakeUp = 6

//if timeYouWakeUp == 6 {
//    print("Cook yourself a big breakfast!")
//} else {
//    print("Go out for breakfast")
//}

var timeYouWakeUp = 6

switch timeYouWakeUp {
case 6:
    print("Cook yourself a big breakfast!")
default:
    print("Go out for breakfast")
}


var book1 = "C Programming"
var book2 = "Java Programming"
var book3 = "Swift Programming"

var bookCollection = ["C Programming", "Java Programming", "Swift Programming"]

bookCollection[0]

bookCollection.append("Python Programming")

bookCollection.count

for index in 0...3{
    print(bookCollection[index])
}

for index in 0...bookCollection.count-1 {
    print(bookCollection[index])
}

for book in bookCollection{
    print(book)
}

var bookCollectionDict = ["1457688765": "C Programming", "1786532456": "Java Programming", "1567588765": "Swift Programming"]

bookCollectionDict["1457688765"]

for (key, value) in bookCollectionDict {
    print("ISBN: \(key)")
    print("Title: \(value)")
}

var emojiDict: [String: String] = ["👻": "Ghost",
                                   "💩": "Poop",
                                   "😤": "Angry",
                                   "😱": "Scream",
                                   "👾": "Alien monster"
                                    ]
var wordToLookup = "👻"
var meaning = emojiDict[wordToLookup]
let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
containerView.backgroundColor = UIColor.orange

let emojiLabel = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))
emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

containerView.addSubview(emojiLabel)

let meaningLabel = UILabel(frame: CGRect(x: 110, y: 100, width: 150, height: 150))
meaningLabel.text = meaning
meaningLabel.font = UIFont.systemFont(ofSize: 30.0)
meaningLabel.textColor = UIColor.white

containerView.addSubview(meaningLabel)

print(meaning as Any)

wordToLookup = "😤"
meaning = emojiDict[wordToLookup]
print(meaning as Any)

//var message$
//var maxSpeed

var jobTitle: String?
jobTitle = "iOS Developer"

if jobTitle != nil{
    message = "Your job title is " + jobTitle!
}

if let jobTitleWithValue = jobTitle {
    message = "Your job tile is " + jobTitleWithValue
}

if let jobTitle = jobTitle {
    message = "Your job tile is " + jobTitle
}

