var app = require('app');
var BrowserWindow = require('browser-window');
var mainWindow = null;

if (process.env.NODE_ENV === 'develop') {
  crashReporter.start();
}

app.on('window-all-closed', function() { app.quit(); });

app.on('ready', function() {
  mainWindow = new BrowserWindow({width: 800, height: 600});
  mainWindow.loadUrl('file://' + __dirname + '/index.html');
  mainWindow.on('closed', function() { mainWindow = null; });
});
