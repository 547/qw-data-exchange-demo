import Foundation

public class DataExchangeNotificationListener {
    public typealias DataCallback = ([String: Any]) -> Void
    public init() {}
    /// 监听uniapp发送的数据
    public func listen(name: String, callback: @escaping DataCallback) -> Void {
        NotificationCenter.default.addObserver(forName:  Notification.Name(rawValue: name), object: nil, queue: nil) { notification in
            if let data = notification.userInfo as? [String: Any] {
                print("接收到\(name)消息，内容为：\n\(data)")
                callback(data)
            }
            else {
                print("接收到\(name)消息，但是内容为不是[String: Any]类型")
            }
        }

    }
    /// 移除当前Listener指定的（name）监听
    public func removeListener(name: String) -> () {
		print("移除\(name)的监听")
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: name), object: nil)
    }
    /// 移除当前Listener所有的监听
    public func removeListener() -> () {
        print("移除当前所有的监听")
        NotificationCenter.default.removeObserver(self)
    }
}
public class DataExchangeNotificationPoster {
    /// 发送给数据
    public static func post(name: String, data: [String: Any]) -> Void {
        print("发送\(name)消息，内容为：\n\(data)")
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: nil, userInfo: data)
    }
}
