const { execFile } = require('child_process');
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
* INFO
*/
app.get('/server_info', (req, res) => {

    execFile('./server.sh', ['server_info'], (error, stdout, stderr) => {
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
* STATUS
*/
app.get('/server_status', (req, res) => {

    execFile('./server.sh', ['server_status'], (error, stdout, stderr) => {
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
* AUTH
*/
app.get('/server_auth', (req, res) => {

    execFile('./server.sh', ['server_auth'], (error, stdout, stderr) => {
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