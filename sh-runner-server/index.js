const express = require('express'); //Import the express dependency
const app = express(); //Instantiate an express app, the main work horse of this server
const port = process.env.NODE_PORT ||  3002; //Save the port number where your server will be listening
const { exec } = require("child_process");


app.get('/', (req, res) => {

    exec('sh ./server.sh', (error, stdout, stderr) => {
        console.log(stdout);
        console.log(stderr);
        if (error !== null) {
            res.sendFile('error.html', {root: __dirname});
            console.log(`exec error: ${error}`);
        }else{
            res.send(`${stdout}`);
        }
    });

});

app.listen(port, () => {            //server starts listening for any attempts from a client to connect at port: {port}
    console.log(`Welcome to your server! Listening on port ${port}`); 
});