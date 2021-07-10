// create a new scene
let gameScene = new Phaser.Scene('Game');

//Load Assets
gameScene.preload = function(){
  //Load Images
  this.load.image('background', 'assets/background.png');
  this.load.image('player', 'assets/player.png');
  this.load.image('enemy', 'assets/dragon.png');
};

//Called once after the preload ends
gameScene.create = function() {
  // create bg sprite
  let bg = this.add.sprite(0, 0, 'background');
 
  let gameW = this.sys.game.config.width;
  let gameH = this.sys.game.config.height;

  //Change origin
  //bg.setOrigin(0,0);

  // place player sprite
  bg.setPosition(gameW/2, gameH/2);
  this.player = this.add.sprite(70, 180, 'player');
  //player.depth = 1;
  //player.x = 10;
  //player.y = 10;

  //Scaling of player
  this.player.setScale(0.5);


  //Create enemu
  this.enemy1 = this.add.sprite(250,180,'enemy');
  this.enemy2 = this.add.sprite(450,180,'enemy');

  //enemy1.setOrigin(0,0);

  this.enemy1.scaleX = 3;
  this.enemy1.scaleY = 3;
  
  this.enemy2.displayWidth = 300;

  //Flip dragon
  this.enemy1.flipX = true;
  this.enemy2.flipY = true;

  //Rotate in degrees
  this.enemy1.angle = 45; //rotate 45 degrees clockwise
  this.enemy2.setAngle(-45);// counterclockwise

  //Rotate in radians
  this.enemy1.rotation = Math.PI/4;
  this.enemy2.setRotation(Math.PI/4);
}

// this is called up to 60 times/s
gameScene.update = function(){
  this.enemy1.x += 1;

  this.enemy2.angle += 1;

  if (this.player.scaleX<2) this.player.scaleX += 0.1;
  if (this.player.scaleY<2) this.player.scaleY += 0.1;
}

// set the configuration of the game
let config = {
  type: Phaser.AUTO, // Phaser will use WebGL if available, if not it will use Canvas
  width: 640,
  height: 360,
  scene: gameScene
};

// create a new game, pass the configuration
let game = new Phaser.Game(config);
