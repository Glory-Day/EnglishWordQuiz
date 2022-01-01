"use strict";
exports.__esModule = true;
// Use the following two modules to import HTML files built in a deployment environment
var path = require("path");
var url = require("url");
var electron_1 = require("electron");
var isDev = require("electron-is-dev");
var baseUrl = "http://localhost:3000";
var mainWindow;
function createMainWindow() {
    mainWindow = new electron_1.BrowserWindow({
        width: 1280,
        height: 720,
        resizable: false,
        titleBarStyle: "hidden",
        // It means combining the Node environment with the Electron to use the above path and url module.
        webPreferences: {
            nodeIntegration: true
        }
    });
    // Actually deployed applications serve the built index.html file.
    // Objects that appear as url.pathToFileURL() need to be converted to string type.
    var mainWindowUrl = url.pathToFileURL(path.join(__dirname, '../build/index.html')).toString();
    // Check the development environment and serve with the correct url/file.
    mainWindow.loadURL(isDev ? baseUrl : mainWindowUrl);
    // For the development environment, open and use Chrome's developer tool.
    if (isDev) {
        mainWindow.webContents.openDevTools();
    }
    mainWindow.on("closed", function () {
        mainWindow = null;
    });
}
// If the application is ready, run it as a desktop application.
electron_1.app.on("ready", function () {
    createMainWindow();
});
// If all windows are closed, exit the application.
electron_1.app.on("window-all-closed", function () {
    electron_1.app.quit();
});
electron_1.app.on("activate", function () {
    if (mainWindow === null) {
        createMainWindow();
    }
});
