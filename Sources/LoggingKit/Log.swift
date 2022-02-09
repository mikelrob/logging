import Foundation

public final class Log {

    private static let shared = Log()

    private var loggers = [String: Logging]()
    private let queue = DispatchQueue.global(qos: .utility)
    private init() { }

    public static func register(logger: Logging) {
        shared.loggers[logger.identifier] = logger
    }

    public static func unregister(logger: Logging) {
        shared.loggers[logger.identifier] = nil
    }

    public static func unregister(named name: String) {
        shared.loggers[name] = nil
    }

    public static func debug(_ logEntry: Loggable, file: String = #file, function: String = #function, line: Int = #line) {
        shared.queue.async {
            shared.loggers.values.forEach { $0.debug(logEntry, file: file, function: function, line: line) }
        }
    }

    public static func info(_ logEntry: Loggable, file: String = #file, function: String = #function, line: Int = #line) {
        shared.queue.async {
            shared.loggers.values.forEach { $0.info(logEntry, file: file, function: function, line: line) }
        }
    }

    public static func notice(_ logEntry: Loggable, file: String = #file, function: String = #function, line: Int = #line) {
        shared.queue.async {
            shared.loggers.values.forEach { $0.notice(logEntry, file: file, function: function, line: line) }
        }
    }

    public static func warn(_ logEntry: Loggable, file: String = #file, function: String = #function, line: Int = #line) {
        shared.queue.async {
            shared.loggers.values.forEach { $0.warn(logEntry, file: file, function: function, line: line) }
        }
    }

    public static func error(_ logEntry: Loggable, file: String = #file, function: String = #function, line: Int = #line) {
        shared.queue.async {
            shared.loggers.values.forEach { $0.error(logEntry, file: file, function: function, line: line) }
        }
    }

    public static func error(_ error: Error, file: String = #file, function: String = #function, line: Int = #line) {
        shared.queue.async {
            shared.loggers.values.forEach { $0.error(error, file: file, function: function, line: line) }
        }
    }

    public static func critical(_ logEntry: Loggable, file: String = #file, function: String = #function, line: Int = #line) {
        shared.queue.async {
            shared.loggers.values.forEach { $0.critical(logEntry, file: file, function: function, line: line) }
        }
    }

    #if MP_BUILD_DEBUG
    public static func forceCrash(in seconds: Double = 2) {
        print("Will crash in \(seconds)....")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            print("Crashing....")
            let never: Never? = nil
            print("\(never!)")
            print("Crashed")
        }
    }
    #endif
}
