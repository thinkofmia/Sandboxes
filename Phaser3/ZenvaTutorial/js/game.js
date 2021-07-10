// create a new scene
let gameScene = new Phaser.Scene('Game');

//Load Assets
gameScene.preload = function(){
  //Load Images
  this.load.image('background', 'assets/background.png');
  this.load.image('player', 'assets/player.png');
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
