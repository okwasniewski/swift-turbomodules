import Foundation

@objcMembers public class NativeLocalStorage: NSObject {
  public static let storageKey = "local-storage"
  let userDefaults = UserDefaults(suiteName: storageKey)
  
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
