new Vue({
    //El proxy - Vue js gonna make an instance with html element #vue-app
    el:'#vue-app',
    data: {
        name: 'Nina',
        job: 'Breaker',
        age: 22,
        x: 0,
        y: 0,
        a: 0,
        b: 0,
        //Array of strings
        characters: ['Hitomi','Mila','Zack','Gen Fu'],
        //Array of objects
        ninjas: [
            {name:'Hayate', age: 27},
            {name:'Kasumi', age: 18},
            {name:'Hayabusa', age: 99}
        ],
        error: false,
        success: false,
        available: false,
        nearby: false,
        website: 'http://www.thenetninja.co.uk',
        websiteTag: '<a href="http://www.thenetninja.co.uk">The Net Ninja Website</a>'
    },
    //Method is a function
    methods: {
        //Function to greet user by their name
        greet: function(time){
            //this.data.name;//Access all the data in this function
            return 'Good '+ time + " " + this.name;
        },
        //Functions to add/subtract to age
        add: function(inc){
            this.age += inc
        },
        subtract: function(dec){
            this.age -= dec
        },
        //Function to update x y coordinates
        updateXY: function(event){
            //Debug message to see event parameters
            //console.log(event);
            //Set new coordinates
            this.x = event.offsetX;
            this.y = event.offsetY; 
        },
        //Function on click
        click: function(){
            alert("You clicked me!");
        },
        //Log Name function
        logName: function(){
            console.log("You entered your name.");
        },
        //Log Age function
        logAge: function(){
            console.log("You entered your age.");
        }
    },
    computed:{
        //Add to Age Functions
        addToA: function(){
            return this.a + this.age;
        },
        addToB: function(){
            return this.b + this.age;
        },
        compClasses: function(){
            return{
                available: this.available,
                nearby: this.nearby
            }
        }
    }
});