﻿package {
	import flash.display.*;
	import flash.geom.*;
  import flash.events.*;
  import flash.net.*;
	
	public class textboxclass  {
		public function textboxclass():void {
			firstcreate();
		}
		
		public function firstcreate():void {
			//Like clear, only it creates the actual arrays, etc
			for (iter = 0; iter < 10; iter++) {
				var t:String = new String;	t = "";
				line.push(t);
			}
			xp = 0; yp = 0; w = 0; h = 0; numlines = 0; lw = 0; tl = 0; tm = 0; active = false; timer = 0;
			ismenu = false; boxname = "textbox"; highlighted = 1;
		}
		
		public function clear():void {
			//Set all values to a default, required for creating a new entity
			for (iter = 0; iter < 10; iter++) {
				line[iter]="";
			}
			textrect = new Rectangle();
			xp = 0; yp = 0; w = 0; h = 0; numlines = 1; lw = 0; tl = 0; tm = 0; active = true; timer = 0;
		}
		
		public function centerx():void { resize();	xp = 160 - (w / 2);	resize(); }
		public function centery():void { resize();	yp = 120 - (h / 2); resize();	}
		
		public function initcol(rr:int, gg:int, bb:int):void {
			tr = rr; tg = gg; tb = bb;
			r = 0; g = 0; b = 0; tl = 0.5;
		}
		
		public function setcol(rr:int, gg:int, bb:int):void {
			r = rr; g = gg; b = bb;
		}
		
		public function update():void {
			if (tm == 0) {
				tl += .1;
				if (tl >= 1) { tl = 1; tm = 1; }
				setcol(int(tr * tl), int(tg * tl), int(tb * tl));
			}else if (tm == 2) {
				tl -= .1;
				if (tl <= 0.5) { tl = 0.5; active = false; }
				setcol(int(tr * tl), int(tg * tl), int(tb * tl));
			}
			if (timer > 0) {
				timer--;
				if (timer == 0) tm = 2;
			}
		}
		
		public function remove():void {
			tm = 2; tl = 1; //Remove mode
		}
		
		public function resize():void {
			//Set the width and height to the correct sizes
			max = 0;
			for (iter = 0; iter < numlines; iter++) if (line[iter].length > max) max = line[iter].length;
			
			lw = max;
			w = (max +2) * 6;
			h = (numlines + 2) * 8;
			textrect.x = xp; textrect.y = yp;	textrect.width = w;	textrect.height = h;
		}
		
		public function addline(t:String):void {
			line[numlines] = t;
			numlines++;
			resize();
			if (numlines >= 10) numlines = 0;
		}
		
    //Fundamentals
		public var line:Array = new Array;
		public var xp:int, yp:int, lw:int, w:int, h:int, numlines:int;
		public var r:int, g:int, b:int;
		public var tr:int, tg:int, tb:int;
		public var textrect:Rectangle;
		public var active:Boolean;
		public var timer:int;
		
		public var tl:Number, tm:int;
		
		public var iter:int, max:int;
		
		//Menu stuff
		public var ismenu:Boolean, boxname:String, highlighted:int;
	}
}
