import Foundation

@objcMembers public class NativeLocalStorage: NSObject {
  let userDefaults = UserDefaults(suiteName: "local-storage")
  
  public func getItem(for key: String) -> String? {
    return userDefaults?.string(forKey: key)
  }
  
  public func setItem(for key: String, value: String) {
    userDefaults?.set(value, forKey: key)
  }
  
  public func removeItem(for key: String) {
    userDefaults?.removeObject(forKey: key)
  }
  
  public func clear() {
    userDefaults?.dictionaryRepresentation().keys.forEach { removeItem(for: $0) }
  }
}
