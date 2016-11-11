#import "iosSpeechRecognizer.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Speech/Speech.h>

@implementation iosSpeechRecognizer


- (void)greet:(CDVInvokedUrlCommand*)command
{

    NSString* name = [[command arguments] objectAtIndex:0];
    NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Wait"
                          message:msg
                          delegate:self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:nil];
    [alert show];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:[NSString stringWithFormat:@"String received : %@", msg]
                               ];

    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


- (void) initTheSpeechRecognizer:(CDVInvokedUrlCommand*)command{
    
    NSLocale *zh_hk = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_HK"];
    self.audioEngine = [[AVAudioEngine alloc] init];
    self.speechRecognizer = [[SFSpeechRecognizer alloc] initWithLocale:zh_hk];
    
    [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
        if (status != SFSpeechRecognizerAuthorizationStatusAuthorized){
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:@"Please Enable the Speech Recognizer in Setting!"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  otherButtonTitles:nil];
            [alert show];
            return;
        }
        
        [self.audioEngine.inputNode
         installTapOnBus:0
         bufferSize:1024
         format:[self.audioEngine.inputNode outputFormatForBus:0]
         block:^(AVAudioPCMBuffer * _Nonnull buffer, AVAudioTime * _Nonnull when) {
             [self.speechRequest appendAudioPCMBuffer:buffer];
             [self.audioEngine prepare];
         }];
    }];
    
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:@"Tring to init"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void) startDictation:(CDVInvokedUrlCommand*)command{
    
    @try {
        [self.audioEngine startAndReturnError:nil];
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    
    self.speechRequest = [[SFSpeechAudioBufferRecognitionRequest alloc] init];
    self.currentSpeechTask = [self.speechRecognizer
                              recognitionTaskWithRequest:self.speechRequest
                              resultHandler:^(SFSpeechRecognitionResult * _Nullable result, NSError * _Nullable error) {
                                  if (result == nil) {return;}
                                  self.result = result.bestTranscription.formattedString;
    }];
    
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:@"Start Dictation"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void) stopDictation:(CDVInvokedUrlCommand*)command{
    
    [self.audioEngine stop];
    [self.speechRequest endAudio];
    
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:self.result];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
