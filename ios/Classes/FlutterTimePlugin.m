#import "FlutterTimePlugin.h"

@implementation FlutterTimePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_time"
            binaryMessenger:[registrar messenger]];
  FlutterTimePlugin* instance = [[FlutterTimePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"autoTimeIsEnable" isEqualToString:call.method]) {
    NSDictionary *pref = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.apple.timed"];
    BOOL autotime = [[pref objectForKey:@"TMAutomaticTimeEnabled"] boolValue];
    result([NSNumber numberWithBool:autotime]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
