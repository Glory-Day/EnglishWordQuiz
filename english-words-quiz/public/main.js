import { app, BrowserWindow } from 'electron';
import path from 'path';
import isDev from 'electron-is-dev';

function createWindow() {
    const window = new BrowserWindow({
        width: 1280,
        height: 720,
        webPreferences: {
            nodeIntegration: true,
            enableRemoteModule: true,
            devTools: isDev
        },
    });

    window.loadURL(
        isDev ? "http://localhost:3000" :
        `file://${path.join(__dirname, "../build/index.html")}`
    );

    if (isDev) {
        window.webContents.openDevTools({mode: 'detach'});
    }

    window.setResizable(true);
    window.on('close', () => (window = null));
    window.focus();
}

app.on("ready", createWindow);
app.on("window-all-closed", () => {
    if (process.platform !== "darwin") {
        app.quit(); 
    }
});
app.on("activate", () => {
    if (window === null) {
        createWindow()
    }
});
