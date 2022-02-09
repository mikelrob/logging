public protocol Loggable {
    /// Message: the message to be logged
    var message: String { get }
    /// Error: `Error` instance to be logged with its properties
    var error: Error? {get }
    /// Attributes: a dictionary of attributes to add for this message. If an attribute with
    /// the same key already exist in this logger, it will be overridden (just for this message).
    var attributes: [String: Codable]? { get }
}

public struct LogEntry: Loggable {
    public var message: String
    public var error: Error?
    public var attributes: [String: Codable]?

    public init(message: String, error: Error? = nil, attributes: [String: Codable]? = nil) {
        self.message = message
        self.error = error
        self.attributes = attributes
    }
}

extension String: Loggable {
    public var message: String { self }
    public var error: Error? { nil }
    public var attributes: [String: Codable]? { nil }
}

enum LogLevel {
    case debug
    case info
    case notice
    case warn
    case error
    case critical
}

extension LogLevel: CustomStringConvertible {
    var description: String {
        switch self {
        case .debug:
            return "🟢 [ DEBUG ] "
        case .info:
            return "⚪️ [ INFO ]"
        case .notice:
            return "🔵 [ NOTICE ]"
        case .warn:
            return "🟠 [ WARN ]"
        case .error:
            return "🔴 [ ERROR ]"
        case .critical:
            return "⚫️ [ CRITICAL ]"
        }
    }
}
public protocol Logging {

    // MARK: - Identifier

    /// Unique Identifer used to register the logger
    var identifier: String { get }

    // MARK: - Logging

    /// Sends a DEBUG log message.
    /// - Parameters:
    ///   - logEntry: the log entry to be logged
    func debug(_ logEntry: Loggable, file: String, function: String, line: Int)

    /// Sends an INFO log message.
    /// - Parameters:
    ///   - logEntry: the log entry to be logged
    func info(_ logEntry: Loggable, file: String, function: String, line: Int)

    /// Sends a NOTICE log message.
    /// - Parameters:
    ///   - logEntry: the log entry to be logged
    func notice(_ logEntry: Loggable, file: String, function: String, line: Int)

    /// Sends a WARN log message.
    /// - Parameters:
    ///   - logEntry: the log entry to be logged
    func warn(_ logEntry: Loggable, file: String, function: String, line: Int)

    /// Sends an ERROR log message.
    /// - Parameters:
    ///   - logEntry: the log entry to be logged
    func error(_ logEntry: Loggable, file: String, function: String, line: Int)

    /// Sends an ERROR log message.
    /// - Parameters:
    ///   - error: `Error` instance to be logged with its properties
    func error(_ error: Error, file: String, function: String, line: Int)

    /// Sends a CRITICAL log message.
    /// - Parameters:
    ///   - logEntry: the log entry to be logged
    func critical(_ logEntry: Loggable, file: String, function: String, line: Int)
}

extension Logging {
    public func error(_ error: Error, file: String = #file, function: String = #function, line: Int = #line) {
        let log = LogEntry(message: "\(error)", error: error, attributes: nil)
        self.error(log, file: file, function: function, line: line)
    }

    internal func filename(from filePath: String) -> String {
        return String(filePath.split(separator: "/").last?.split(separator: ".").first ?? "Unknown File")
    }

    internal func consolidateAttributes(attributes: [String: Codable]?, file: String, function: String, line: Int) -> [String: Codable] {
        var allAttrs = attributes ?? [String: Codable]()
        allAttrs["file"] = filename(from: file)
        allAttrs["function"] = function
        allAttrs["line"] = line
        return allAttrs
    }
}
