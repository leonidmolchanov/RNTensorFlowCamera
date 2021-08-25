
#import "React/RCTViewManager.h"
#import "RCTBridgeModule.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(TFImageClassification, RCTViewManager)
RCT_EXTERN_METHOD(onData:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(startCapture)
RCT_EXTERN_METHOD(stopCapture)

@end


@interface RCT_EXTERN_MODULE(ReactNativeEventEmitter, RCTEventEmitter)


- (NSArray<NSString *> *)supportedEvents {
  return @[@"TFImageClassification"];
}
@end
