new Vue({
    //El proxy - Vue js gonna make an instance with html element #vue-app
    el:'#vue-app',
    data: {
        name: 'Nina',
        job: 'Breaker',
        website: 'http://www.thenetninja.co.uk',
        websiteTag: '<a href="http://www.thenetninja.co.uk">The Net Ninja Website</a>'
    },
    //Method is a function
    methods: {
        greet: function(time){
            //this.data.name;//Access all the data in this function
            return 'Good '+ time + " " + this.name;
        }
    }
});