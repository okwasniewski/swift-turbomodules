#import "LocalStorage.h"

#if __has_include("LocalStorage/LocalStorage-Swift.h")
#import "LocalStorage/LocalStorage-Swift.h"
#else
#import "LocalStorage-Swift.h"
#endif

@implementation LocalStorage {
  NativeLocalStorage *_localStorage;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    _localStorage = [[NativeLocalStorage alloc] init];
  }
  return self;
}

- (void)setItem:(NSString *)value key:(NSString *)key {
  [_localStorage setItemFor:key value:value];
}

- (NSString *)getItem:(NSString *)key {
  return [_localStorage getItemFor:key];
}

- (void)removeItem:(NSString *)key {
  [_localStorage removeItemFor:key];
}

- (void)clear {
  [_localStorage clear];
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeLocalStorageSpecJSI>(params);
}

+ (NSString *)moduleName
{
  return @"LocalStorage";
}

@end
