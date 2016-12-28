#import <Cordova/CDV.h>
#import <AVFoundation/AVFoundation.h>
#import <Speech/Speech.h>

@interface iosSpeechRecognizer : CDVPlugin{

}
@property   AVAudioEngine *audioEngine;
@property   SFSpeechRecognizer *speechRecognizer;
@property   SFSpeechAudioBufferRecognitionRequest *speechRequest;
@property   SFSpeechRecognitionTask *currentSpeechTask;
@property   NSString *result;
@property   CDVInvokedUrlCommand *cacheCommand;
@property   NSTimer *timer;

- (void) greet:(CDVInvokedUrlCommand*)command;
- (void) initTheSpeechRecognizer:(CDVInvokedUrlCommand*)command;
- (void) startDictation:(CDVInvokedUrlCommand*)command;
- (void) stopDictation:(CDVInvokedUrlCommand*)command;
- (void) startDictationWithCallBack:(CDVInvokedUrlCommand*)command;

@end
