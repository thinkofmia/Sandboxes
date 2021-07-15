console.log('Hello world!');

var age = 26;
age = 27;
age = age + 1;

var health = 0.65;

var isAlive = true;
isAlive = false;

isAlive = 5 > 2;

const pi = 3.14159;
let numberOfLimbs = 4;

var name = "Mia";
var kai = "Kyrin";

let finalString = `${name} is ${age} years old.`;

kai = kai.padEnd(8, '.'); 

let appid = 221380;
//http://api.steampowered.com/ISteamUserStats/GetGlobalAchievementPercentagesForApp/v0002/?gameid=221380&format=xml
//Steam api

var numbers = [1,2,3];
numbers = [1,2];
numbers[1];
numbers[0] = 4;

numbers.includes(4);

var inventory = {'food': 2, 'clothing': 3};
inventory['clothing'] = 4;
inventory['food'];

function sum(number1, number2 = 2) {
    return number1 + number2;
}

var result = sum(1,2);
var result = sum(1);

var result = (number1, number2) => { return number1 + number2};