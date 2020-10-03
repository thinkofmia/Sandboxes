new Vue({
    el: '#vue-app',
    data: {
        health: 100,
        ended: false
    },
    methods:{
        //Punch function
        punch: function(){
            //Decrement health
            this.health -= 10;
            //Can check health status here
            if (this.health<=0){
                this.ended = true;
            }
        },
        //Restart function
        restart: function(){
            //Initialize the health
            this.health = 100;
            //Reset the ended status
            this.ended = false;
        }
    },
    computed: {

    }
})