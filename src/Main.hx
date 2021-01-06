package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Assets;
import motion.Actuate;
import motion.easing.Elastic;
import motion.easing.Expo;
import haxe.Timer;
import openfl.media.Sound;

/**
 * ...
 * @author kokoscript
 */
class Main extends Sprite 
{
	var img:Bitmap = new Bitmap(Assets.getBitmapData ("assets/fox.png"));
	var sprite:Sprite = new Sprite();
	var sound:Sound = Assets.getSound("assets/squeak.mp3");

	public function new(){
		super();

		img.x = -175;
		img.y = -175;
		sprite.addChild (img);
		sprite.buttonMode = true;
		sprite.x = (stage.stageWidth) / 2;
        sprite.y = (stage.stageHeight) / 2;
		addChild(sprite);
		
		sprite.addEventListener (MouseEvent.MOUSE_DOWN, function (e) {
			Timer.delay(function(){
				Actuate.tween(sprite, 1.5, { scaleX:1, scaleY:1 }).ease(Elastic.easeOut);
				img.bitmapData = Assets.getBitmapData ("assets/fox.png");
			}, 250);
			sound.play();
			img.bitmapData = Assets.getBitmapData ("assets/fox2.png");
			Actuate.tween(sprite, .25, { scaleX:.75, scaleY:.75}).ease(Expo.easeOut);
		});
	}
}
