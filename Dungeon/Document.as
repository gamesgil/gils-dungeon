package  
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.KeyboardEvent;
	import model.Map;
	import model.datatypes.CellType;
	import model.datatypes.ItemType;
	import model.entitiy.Player;
	import model.entitiy.Entity;
	import model.datatypes.EntityType;
	import controller.KeyboardManager;
	import flash.events.Event;
	/**
	 * ...
	 * @author gil
	 */
	public class Document extends Sprite
	{
		private var map:Map;
		private var roomW:uint;
		private var roomH:uint;
		
		public function Document() 
		{
			map = new Map(100, 100);
			
			for (var i:uint = 0; i < 10; i++)
			{
				roomW = Map.rand(4, 15);
				roomH = Map.rand(4, 15);
				
				map.createRoom(new Rectangle(Map.rand(2, map.width - roomW - 2), Map.rand(2, map.height - roomH - 2), roomW, roomH));
			}

			for (var j:uint = 0; j < map.rooms.length - 1; j++)
			{
				map.connectPoints(map.roomToMapCoordinates(map.rooms[j], map.rooms[j].door), map.roomToMapCoordinates(map.rooms[j + 1], map.rooms[j + 1].door));
			}

			map.surroundFloorTilesWithWalls();
			map.placeItems();
			map.addEntity(new Player());
			
			redraw();
		}
		
		function redraw(e:Event = null):void
		{
			txt.text = map.getViewPort(map.getPlayerRect(20, 20));
			colorizeMap(txt);
		}

		function colorizeMap(txt:TextField):void
		{
			var colorize:Boolean;
			var format:TextFormat = new TextFormat();
			format.color = 0x555555;
			
			for (var i:uint = 0; i < txt.text.length; i++)
			{
				switch (txt.text.charAt(i))
				{
					case CellType.EMPTY.toString():
						format.color = 0xeeeeee;
						break;
						
					case CellType.FLOOR.toString():
						format.color = 0xcccccc;
						break;
						
					case CellType.WALL.toString():
						format.color = 0x000000;
						break;
						
					case ItemType.TREASURE_CHEST.toString():
						format.color = 0x000000;
						break;
						
					case EntityType.PLAYER.toString():
						format.color = 0xff0000;
						break;
						
					case CellType.DOOR.toString():
						format.color = 0x009900;
						break;
						
					
				}
				
				txt.setTextFormat(format, i, i + 1);
				
			}
			 
		}

		
	}

}