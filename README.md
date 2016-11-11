# Cordova Hello World Plugin

Simple plugin that returns your string prefixed with hello.

A simple plugin that recongizie your speech using native ios API.


## Using
    

Edit `www/js/index.js` and add the following code inside `onDeviceReady`

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


Install iOS or Android platform

    cordova platform add ios
    cordova platform add android
    
Run the code


## More Info
This plugin was modified base on helloworld Plugin 

For more information on setting up Cordova see [the documentation](http://cordova.apache.org/docs/en/latest/guide/cli/index.html)

For more info on plugins see the [Plugin Development Guide](http://cordova.apache.org/docs/en/latest/guide/hybrid/plugins/index.html)
