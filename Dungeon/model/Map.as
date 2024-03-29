﻿package model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import model.datatypes.CellType;
	import model.datatypes.DirectionType;
	import model.datatypes.ItemType;
	import model.entitiy.Entity;
	import model.entitiy.EntityManager;
	import model.entitiy.Monster;
	import model.entitiy.Player;
	import model.item.Item;
	import model.item.ItemManager;
	
	/**
	 * ...
	 * @author gil
	 */
	public class Map extends EventDispatcher
	{
		private var m_width:uint;
		private var m_height:uint;
		private var m_cells:Array;
		private var m_rooms:Array;
		private var m_type:String;
		private var m_itemManager:ItemManager;
		private var m_entityManager:EntityManager;
		private var m_fightManager:FightManager;
		
		public function Map(width:uint, height:uint)
		{
			this.width = width;
			this.height = height;
			
			m_cells = [];
			m_rooms = [];
			m_itemManager = new ItemManager(this);
			m_entityManager = new EntityManager(this);
			m_fightManager = new FightManager();
			
			for (var i:int = 0; i < height; i++)
			{
				for (var j:int = 0; j < width; j++)
				{
					m_cells.push(new Cell(new Point(j, i)));
				}
			}
			
			m_fightManager.addEventListener(Event.CHANGE, checkStatus);
		}
		
		private function checkStatus(e:Event):void
		{
			//go over all entities and kill them if necessary
			entityManager.scanForDeadEntities();
			
			trace("isGameOver=" + isGameOver());
			
			if (!isGameOver())
			{
				updateChange();
				
				doCpuTurn();
			}
			else
			{
				
			}
		}
		
		private function doCpuTurn():void 
		{
			var entity:Entity;
			
			for (var i:int = 0; i < entityManager.numOfEntities && !isGameOver(); i++) 
			{
				entity = entityManager.getEntity(i);
				
				if (entity is Monster)
				{
					trace(entity);
					if (entityManager.isEntityWithinRangeOrAnother(entity, player, 1))
					{
						m_fightManager.fight(entity, player);
					}
					else
					{
						//move monster
						trace(entity + " moves");
					}
				}
			}
			
			updateChange();
		}
		
		public function get mapData():String
		{
			return getViewPort(new Rectangle(0, 0, width, height));
		}
		
		public function getViewPort(rect:Rectangle):String
		{
			var result:String = "";
			var cell:Cell;
			var item:Item;
			var entity:Entity;
			var top:uint = Math.min(Math.max(0, rect.top), height);
			var bottom:uint = Math.min(Math.max(0, top + rect.height), height);
			
			var left:uint = Math.min(Math.max(0, rect.left), width);
			var right:uint = Math.min(Math.max(0, left + rect.width), width);
			
			for (var i:int = top; i < bottom; i++)
			{
				for (var j:int = left; j < right; j++)
				{
					cell = getCell(new Point(j, i));
					
					if (cell.entity)
					{
						result += cell.entity;
					}
					else if (cell.item)
					{
						result += cell.item.type;
					}
					else
					{
						result += cell.type;
					}
				}
				
				result += "\n";
			}
			
			return result;
		}
		
		public function getPlayerRect(padWight:uint, padHeight:uint):Rectangle
		{
			var result:Rectangle = new Rectangle(player.x - padWight, player.y - padHeight, padWight * 2, padHeight * 2);
			
			return result;
		}
		
		public function moveEntity(entity:Entity, direction:DirectionType):Boolean
		{
			var cellPoint:Point;
			var cell:Cell;
			
			switch (direction)
			{
				case DirectionType.WEST: 
					cellPoint = new Point(player.x - 1, player.y);
					break;
				
				case DirectionType.NORTH: 
					cellPoint = new Point(player.x, player.y - 1);
					break;
				
				case DirectionType.EAST: 
					cellPoint = new Point(player.x + 1, player.y);
					break;
				
				case DirectionType.SOUTH: 
					cellPoint = new Point(player.x, player.y + 1);
					break;
			
			}
			
			if (cellPoint)
			{
				cell = getCell(cellPoint);
				
				if (entity.hp && cell.isTraversable())
				{
					entityManager.moveEntity(player, cell);
					entity.checkOverlapWithItem();
					
					updateChange();
				}
				else if (cell.entity)
				{
					m_fightManager.fight(player, cell.entity);
				}
				
			}
			
			return cellPoint != null;
		}
		
		private function updateChange():void
		{
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function placeItems():void
		{
			m_itemManager.placeItems();
		}
		
		public function addMonsters():void
		{
			var cell:Cell;
			
			for (var i:int = 0; i < 5; i++)
			{
				addEntity(new Monster());
			}
		}
		
		public function findRandomFreeCell():Cell
		{
			var result:Cell;
			var cells:Array = [];
			
			for (var i:int = 0; i < m_cells.length; i++)
			{
				if (Cell(m_cells[i]).type == CellType.FLOOR)
				{
					cells.push(m_cells[i]);
				}
			}
			
			result = cells[rand(0, cells.length)];
			
			return result;
		}
		
		public function setCell(point:Point, type:CellType):void
		{
			getCell(point).type = type;
		}
		
		public function createRoom(rect:Rectangle):void
		{
			var room:Room = new Room(rect);
			
			//disallow creating a room completely within another room
			var allow:Boolean = true;
			
			for (var i:int = 0; i < rooms.length; i++)
			{
				//if (!doesRoomIntersectAnother(room) && doesRoomTouchAnother(room)) //tends to create larger spaces 
				//if (!doesRoomIntersectAnother(room) && !doesRoomIntersectAnother(room)) //tends to create larger spaces 
				if (doesRoomIntersectAnother(room) || doesRoomTouchAnother(room)) //forces independent rooms
				{
					allow = false;
				}
			}
			
			if (allow)
			{
				room.id = rooms.length;
				rooms.push(room);
				
				//if (!doesRoomIntersectAnother(room))
				{
					room.addRandomDoor();
				}
				
				drawRoom(room);
			}
		}
		
		public function addEntity(entity:Entity):void
		{
			entityManager.addEntity(entity);
		}
		
		private function drawRoom(room:Room):void
		{
			var type:CellType;
			
			for (var i:int = 0; i < room.height; i++)
			{
				for (var j:int = 0; j < room.width; j++)
				{
					if ((i > 0 && i < room.height - 1 && j > 0 && j < room.width - 1) || isPointWithinRoom(new Point(room.left + j, room.top + i), room.id))
					{
						type = CellType.FLOOR;
					}
					else
					{
						if (!room.door || (j != room.door.x || i != room.door.y))
						{
							type = CellType.WALL;
						}
						else
						{
							type = CellType.DOOR;
						}
					}
					
					setCell(new Point(room.left + j, room.top + i), type);
				}
			}
		
		}
		
		public function doesRoomIntersectAnother(room:Room):Boolean
		{
			var result:Boolean = false;
			
			for (var i:int = 0; i < rooms.length; i++)
			{
				if (room.id != rooms[i].id)
				{
					if (room.rect.intersects(rooms[i].rect))
					{
						result = true;
						break;
					}
				}
			}
			
			return result;
		}
		
		private function doesRoomTouchAnother(room:Room):Boolean
		{
			var newRect:Rectangle = new Rectangle(room.left - 1, room.top - 1, room.width + 2, room.height + 2);
			var newRoom:Room = new Room(newRect);
			newRoom.id = room.id;
			
			return doesRoomIntersectAnother(newRoom);
		}
		
		public function isPointWithinRoom(point:Point, exclude:uint):Boolean
		{
			var result:Boolean = false;
			var room:Room;
			
			for (var i:int = 0; i < rooms.length; i++)
			{
				room = rooms[i];
				
				if (room.id != exclude)
				{
					if (point.x > room.left && point.x < room.left + room.width - 1 && point.y > room.top && point.y < room.top + room.height - 1)
					{
						result = true;
						break;
					}
				}
			}
			
			return result;
		}
		
		public function connectPoints(point1:Point, point2:Point):void
		{
			var iterations:uint = 0;
			var rand:Number;
			
			while ((point1.x != point2.x || point1.y != point2.y) && iterations < 100)
			{
				rand = Math.random();
				
				if (rand < 0.5)
				{
					if (point1.x < point2.x)
					{
						point1.x += 1;
					}
					else if (point1.x > point2.x)
					{
						point1.x -= 1;
					}
				}
				else
				{
					if (point1.y < point2.y)
					{
						point1.y += 1;
					}
					else if (point1.y > point2.y)
					{
						point1.y -= 1;
					}
				}
				
				setCell(point1, CellType.PASSAGE);
			}
		}
		
		public function isGameOver():Boolean
		{
			return (player == null || player.hp == 0);
		}
		
		public function pickRandomCellAndMarkItVisited():Point
		{
			var result:Point = new Point();
			result.x = rand(0, width);
			result.y = rand(0, height);
			
			getCell(result).visited = true;
			
			return result;
		}
		
		public function getCell(loc:Point):Cell
		{
			return m_cells[loc.y * width + loc.x];
		}
		
		public function get width():uint
		{
			return m_width;
		}
		
		public function set width(value:uint):void
		{
			m_width = value;
		}
		
		public function get height():uint
		{
			return m_height;
		}
		
		public function set height(value:uint):void
		{
			m_height = value;
		}
		
		public function get type():String
		{
			return m_type;
		}
		
		public function set type(value:String):void
		{
			m_type = value;
		}
		
		public function get rooms():Array
		{
			return m_rooms;
		}
		
		public function set rooms(value:Array):void
		{
			m_rooms = value;
		}
		
		public function get entityManager():EntityManager
		{
			return m_entityManager;
		}
		
		public function getRoomById(id:uint):Room
		{
			var result:Room;
			
			for (var i:int = 0; i < rooms.length; i++)
			{
				//trace("compare: " + rooms[i].id + " to " + id);
				if (rooms[i].id == id)
				{
					result = rooms[i];
					break;
				}
			}
			
			return result;
		}
		
		public function surroundFloorTilesWithWalls():void
		{
			var cell:Cell;
			
			for (var i:int = 0; i < m_cells.length; i++)
			{
				cell = Cell(m_cells[i]);
				
				if (cell.type == CellType.PASSAGE)
				{
					cell.type = CellType.FLOOR;
					
					if (getCell(new Point(cell.x - 1, cell.y)).type == CellType.EMPTY)
					{
						getCell(new Point(cell.x - 1, cell.y)).type = CellType.WALL;
					}
					
					if (getCell(new Point(cell.x + 1, cell.y)).type == CellType.EMPTY)
					{
						getCell(new Point(cell.x + 1, cell.y)).type = CellType.WALL;
					}
					
					if (getCell(new Point(cell.x, cell.y - 1)).type == CellType.EMPTY)
					{
						getCell(new Point(cell.x, cell.y - 1)).type = CellType.WALL;
					}
					
					if (getCell(new Point(cell.x, cell.y + 1)).type == CellType.EMPTY)
					{
						getCell(new Point(cell.x, cell.y + 1)).type = CellType.WALL;
					}
				}
			}
		}
		
		public function roomToMapCoordinates(room:Room, point:Point):Point
		{
			return new Point(room.left + point.x, room.top + point.y);
		}
		
		public function get player():Player
		{
			return entityManager.player;
		}
		
		static public function rand(min:uint, max:uint):uint
		{
			return Math.floor(Math.random() * (max - min)) + min;
		}
	}

}
