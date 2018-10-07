
import Foundation

print("Testing topics")
for topic in topicData {
    print("Id \(topic.id) Topic: \(topic.topic) Date: \(topic.date)")
}

print("\nTesting messages")
for message in messageData {
    print("ID \(message.id) | Message : \(message.message) | Date : \(message.date) | Author \(message.date)")
}

print("\nConnecting to 42")

getMessages()
//getTokenKey()
