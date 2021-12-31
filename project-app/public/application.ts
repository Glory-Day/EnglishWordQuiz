// Use the following two modules to import HTML files built in a deployment environment
import * as path from "path";
import * as url from "url";

import { app, BrowserWindow } from "electron";
import * as isDev from "electron-is-dev";

const baseUrl: string = "http://localhost:3000";

let mainWindow: BrowserWindow | null;

function createMainWindow(): void {
    mainWindow = new BrowserWindow({
        width: 1280,
        height: 720,
        resizable: false,
        titleBarStyle: "hidden",

        // It means combining the Node environment with the Electron to use the above path and url module.
        webPreferences: {
            nodeIntegration: true,
        },
    });
    
    // Actually deployed applications serve the built index.html file.
    // Objects that appear as url.pathToFileURL() need to be converted to string type.
    const mainWindowUrl: string = url.pathToFileURL(path.join(__dirname, '../build/index.html')).toString();

    // Check the development environment and serve with the correct url/file.
    mainWindow.loadURL(isDev ? baseUrl : mainWindowUrl);

    // For the development environment, open and use Chrome's developer tool.
    if (isDev) {
        mainWindow.webContents.openDevTools();
    }

    mainWindow.on("closed", (): void => {
        mainWindow = null;
    });
}

// If the application is ready, run it as a desktop application.
app.on("ready", (): void => {
    createMainWindow();
});

// If all windows are closed, exit the application.
app.on("window-all-closed", (): void => {
    app.quit();
});

app.on("activate", (): void => {
    if (mainWindow === null) {
        createMainWindow();
    }
});