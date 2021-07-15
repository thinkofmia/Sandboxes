const { request } = require('express');
const passport = require('passport');
const localStrategy = require('passport-local');

//Handle user registration
passport.use('signup', new localStrategy.Strategy({
    usernameField: 'email',
    passwordField: 'passwrd',
    passReqToCallback: true,
}, (request, email, password, done) => {
    console.log(email,password);
    console.log(request.body);

    const username = request.body;
    if(username && username!== 'error'){
        return done(null, {name: 'Anna'});
    }
    else {
        return done(new Error('Invalid User'));
    }
}));

//User login
//Handle user registration
passport.use('login', new localStrategy.Strategy({
    usernameField: 'email',
    passwordField: 'passwrd',
}, (email, password, done) => {

    const username = request.body;
    if(email!== 'anna@gmail.com'){
        return done(new Error('User nor found'), false);
    }
    if(password!== 'test'){
        return done(new Error('Invalid Password'), false);
    }
    return done(null, {name:'Anna'});
}));