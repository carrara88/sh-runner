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

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors(corsOptions));
app.options('*', cors())



/**
* REQUEST (_POST)
* PRIVATE API
* Authenticated POST requests
* availables requests:  ["server_restart", "server_status", "server_signin"]
*/
app.post('/_request/:request', (req, res) => {
    var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
    if(regularExpression.test(req.body.password)) {
        res.send(`PASS OK!`);
    }else{
        res.send(`PASS KO.`);
    }
    if( ["server_restart", "server_status", "server_signin"].includes(req.params.request) ){
        
        execFile('/var/www/sh-runner/sh-runner-server/server.sh', ['-req='+req.params.request,'-u='+req.body.username,'-p='+req.body.password], (error, stdout, stderr) => {
            console.log(stdout);
            console.log(stderr);
            if (error !== null) {
                res.sendFile('error.json', {root: __dirname});
                console.log(`exec error: ${error}`);
            }else{
                res.send(`${stdout}`);
            }
        });
    }else{
        console.log(`post request not found: ${req.params.request}`);
        res.send(`{"error":"post request not found"}`);
    }
});

/**
* INFO (_GET)
* PUBLIC API
* Un-Authenticated GET requests
* availables requests:  [server_info]
*/
app.get('/request/:request', (req, res) => {
    if( ["server_info"].includes(req.params.request) ){
        execFile('/var/www/sh-runner/sh-runner-server/server.sh', ['-req='+req.params.request], (error, stdout, stderr) => {
            console.log(stdout);
            console.log(stderr);
            if (error !== null) {
                res.sendFile('error.json', {root: __dirname});
                console.log(`exec error: ${error}`);
            }else{
                res.send(`${stdout}`);
            }
        });
    }else{
        console.log(`get request not found: ${req.params.request}`);
        res.send(`{"error":"get request not found"}`);
    }
});

/**
* Server listening on designed port
*/
app.listen(port, () => {
    console.log(`Welcome to sh-runner-server, listening on port ${port}`); 
});
