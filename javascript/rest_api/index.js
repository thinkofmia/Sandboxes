require('dotenv').config();

const express = require ('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const cookieParser = require('cookie-parser');

const routes = require('./routes/main');
const passwordRoutes = require('./routes/password');

const app = express();
const port = process.env.PORT || 3000;
console.log(process.env);

//Update express settings
app.use(bodyParser.urlencoded({extended: false}));// parse app/x-www-form-urlencoded
app.use(bodyParser.json()); //parse app/json
app.use(cookieParser());
app.use(cors({credentials: true, origin: process.env.CORS_ORIGIN}))

//Require passport auth
require('./auth/auth');

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

//Setup Routes
app.use('/', routes);
app.use('/', passwordRoutes);

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