# Cordova IOS STT zh-hk Plugin

A simple plugin that recongizie your speech using native ios API.

P.S. This plugin only support cantonese on IOS devices only.

Welcome for any suggestion on this plugin.

## Using
    
For test the plugin: 

```js
    iosSpeechRecognizer.greet("Hello World",function(msg){console.log(msg);});
        
```

For init the plugin

```js
    iosSpeechRecognizer.initTheSpeechRecognizer();
```

Start the recongition by this API

```js
    iosSpeechRecognizer.startDictation();
```

Get the Result and stop the recongition by this API

```js
    iosSpeechRecognizer.stopDictation(function(msg){
        console.log(msg); // msg is the result
    });
```

UPDATE: 
This method will return recongizied string after user speak more than 4 words.
```js
    iosSpeechRecognizer.startDictationWithCallBack(function(msg){
        console.log(msg); // msg is the result
    });
```


Install the plugin

    cordova plugin add https://github.com/fxyu/com.example.iosSpeechRecognizer
    
Run the code



## More Info
This plugin was modified base on helloworld Plugin 

For more information on setting up Cordova see [the documentation](http://cordova.apache.org/docs/en/latest/guide/cli/index.html)

For more info on plugins see the [Plugin Development Guide](http://cordova.apache.org/docs/en/latest/guide/hybrid/plugins/index.html)
