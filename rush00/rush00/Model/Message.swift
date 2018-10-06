
class Message {
    var id: String
    var message: String
    var date: String
    var author: String
    var topicId: String
    var reply: Bool

    init(id: String, message: String, date: String, author: String, topicId: String, reply: Bool) {
        self.id = id
        self.message = message
        self.date = date
        self.author = author
        self.topicId = topicId
        self.reply = reply
    }
}