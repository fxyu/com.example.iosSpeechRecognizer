/*global cordova, module*/

module.exports = {
    greet: function (name, successCallback) {
        cordova.exec(successCallback, null, "iosSpeechRecognizer", "greet", [name]);
    },
        
    initTheSpeechRecognizer: function (){
        cordova.exec(null,null, "iosSpeechRecognizer", "initTheSpeechRecognizer", []);
    },
        
    startDictation: function (){
        cordova.exec(null,null, "iosSpeechRecognizer", "startDictation", []);
    },
        
    stopDictation: function (successCallback){
        cordova.exec(successCallback, null, "iosSpeechRecognizer", "stopDictation", []);
    },

    startDictationWithCallBack: function (successCallback){
        cordova.exec(successCallback, null, "iosSpeechRecognizer", "startDictationWithCallBack", []);
    }
};
