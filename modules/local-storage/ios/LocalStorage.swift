import Foundation

@objcMembers public class NativeLocalStorage: NSObject {
  let userDefaults = UserDefaults(suiteName: "local-storage")
  private var onKeyAdded: ((NSDictionary) -> Void)?
  
  public init(onKeyAdded: @escaping (NSDictionary) -> Void) {
    super.init()
    self.onKeyAdded = onKeyAdded
  }
  
  public func getItem(for key: String) -> String? {
    return userDefaults?.string(forKey: key)
  }
  
  public func setItem(for key: String, value: String) {
    if userDefaults?.string(forKey: key) == nil {
      onKeyAdded?(["value": value, "key": key])
    }
    
    userDefaults?.set(value, forKey: key)
  }
  
  public func removeItem(for key: String) {
    userDefaults?.removeObject(forKey: key)
  }
  
  public func clear() {
    userDefaults?.dictionaryRepresentation().keys.forEach { removeItem(for: $0) }
  }
}
