const { execFile } = require('child_process');
var exec = require('child_process').exec;
const port = process.env.NODE_PORT ||  3001; //Save the port number where your server will be listening
const express = require('express'); //Import the express dependency
var cors = require('cors');
var app = express();


var corsOptions = {
        "origin": "*",
        "methods": "GET,HEAD,PUT,PATCH,POST,DELETE",
        "preflightContinue": true,
        "optionsSuccessStatus": 200
}

app.use(cors(corsOptions));
app.options('*', cors())

/*
* RESTART (_POST)
*/
app.get('/server_restart', (req, res) => {
    execFile('/var/www/sh-runner/sh-runner-server/server.sh', ['-req=server_restart','-u='+req.params.username,'-p='+req.params.password], (error, stdout, stderr) => {
        console.log(stdout);
        console.log(stderr);
        if (error !== null) {
            res.sendFile('error.json', {root: __dirname});
            console.log(`exec error: ${error}`);
        }else{
            res.send(`${stdout}`);
        }
    });
});

/*
* INFO
*/
app.get('/server_info', (req, res) => {
    execFile('/var/www/sh-runner/sh-runner-server/server.sh', ['-req=server_info'], (error, stdout, stderr) => {
        console.log(stdout);
        console.log(stderr);
        if (error !== null) {
            res.sendFile('error.json', {root: __dirname});
            console.log(`exec error: ${error}`);
        }else{
            res.send(`${stdout}`);
        }
    });
});

/*
* STATUS (_POST)
*/
app.get('/server_status', (req, res) => {
    execFile('/var/www/sh-runner/sh-runner-server/server.sh', ['-req=server_status','-u='+req.params.username,'-p='+req.params.password], (error, stdout, stderr) => {
        console.log(stdout);
        console.log(stderr);
        if (error !== null) {
            res.sendFile('error.json', {root: __dirname});
            console.log(`exec error: ${error}`);
        }else{
            res.send(`${stdout}`);
        }
    });
});

/*
* AUTH (_POST)
*/
app.get('/server_signin', (req, res) => {
    execFile('/var/www/sh-runner/sh-runner-server/server.sh', ['-req=server_signin','-u='+req.params.username,'-p='+req.params.password], (error, stdout, stderr) => {
        console.log(stdout);
        console.log(stderr);
        if (error !== null) {
            res.sendFile('error.json', {root: __dirname});
            console.log(`exec error: ${error}`);
        }else{
            res.send(`${stdout}`);
        }
    });
});


app.listen(port, () => {            //server starts listening for any attempts from a client to connect at port: {port}
    console.log(`Welcome to your server! Listening on port ${port}`); 
});
