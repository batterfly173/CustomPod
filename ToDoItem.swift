import Foundation

public let formatterJson: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    return dateFormatter
}()

public enum Priority: String
{
    case none
    case usual
    case important
}

public struct ToDoItem
{
    public let id: String
    public let text: String
    public let priority: Priority
    public let deadLine: Date?
    public var isDone: Bool
    
    public let createdAt: Int
    public var updatedAt: Int
    
    public var isDirty: Bool
    
    public init(id: String = UUID().uuidString, text: String, priority: Priority, deadLine: Date? = nil, isDone: Bool)
    {
        self.id = id
        self.text = text
        self.priority = priority
        self.deadLine = deadLine
        self.isDone = isDone
        
        self.createdAt = 1191991 //MARK: Должна быть дата
        self.updatedAt = self.createdAt
        self.isDirty = false
    }
}

extension ToDoItem
{
    public var json: Any {
        
        var jsonResult: [String : Any] = [:]
        
        jsonResult["text"] = self.text
        jsonResult["priority"] = priority.rawValue
        jsonResult["id"] = self.id
        
        if self.priority != .none
        {
            jsonResult["priority"] = priority.rawValue
        }
        
        jsonResult["done"] = self.isDone
        
        if deadLine != nil {
            jsonResult["deadLine"] = formatterJson.string(from: deadLine!)
        }
        
        return jsonResult
    }
    
    
    public static func parse(json: Any) -> ToDoItem?
    {
        guard let json = json as? [String: Any] else { return nil }

        
        guard let id = json["id"] as? String,
              let text = json["text"] as? String,
              let done = json["done"] as? Bool else { return nil }
        
        let result = ToDoItem(id: id,
                              text: text,
                              priority: Priority(rawValue: (json["priority"] as? String ?? "none"))!,
                              deadLine: formatterJson.date(from: json["deadLine"] as? String ?? ""),
                              isDone: done)
        
        return result
    }
}
