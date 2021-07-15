const express = require ('express');
const app = express();
const port = 3000;

/**
 * Routes:
 *  - 404 Handler
 *  - 500 Handler
 *  - status
 *  - signup
 *  - login
 *  - logout
 *  - token
 *  - forget password
 *  - reset password
 */

app.get('/', (request, response)=>{
    console.log("Hi:");
    response.send('Hello world');
});

app.get('/status', (request, response)=>{
    response.status(200).json({ message: 'ok', status: 200});
    response.send('Hello world');
});

app.post('/signup', (request, response, next)=>{
    next(new Error('test'));
//    response.status(200).json({ message: 'ok', status: 200});
});

app.post('/login', (request, response)=>{
    response.status(200).json({ message: 'ok', status: 200});
});

app.post('/logout', (request, response)=>{
    response.status(200).json({ message: 'ok', status: 200});
});

app.post('/token', (request, response)=>{
    response.status(200).json({ message: 'ok', status: 200});
});

app.post('/forget-password', (request, response)=>{
    response.status(200).json({ message: 'ok', status: 200});
});

app.post('/reset-password', (request, response, next)=>{
    response.status(200).json({ message: 'ok', status: 200});
});

app.get('/test', (request, response)=>{
    //console.log(request);
    response.send('Test');
});

//Catch all other routes
app.use((request, response) => {
    response.status(404).json({ message: '404 - Not Found', status: 404});
});

//Handle errors
app.use((error, request, response, next) => {
    response.status(error.status||500).json({error:error, status: 500})
})

app.listen(port, ()=>{
    console.log(`Server is running on port ${port}`);
});