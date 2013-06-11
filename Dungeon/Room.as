package  
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author gil
	 */
	public class Room 
	{
		private var m_rect:Rectangle;
		private var m_id:uint;
		private var m_door:Point;
		
		public function Room(rect:Rectangle) 
		{
			m_rect = rect;
		}
		
		public function addRandomDoor():void
		{
			addDoor([DirectionType.NORTH, DirectionType.SOUTH, DirectionType.EAST, DirectionType.WEST][Map.rand(0, 4)]);
		}
		
		public function addDoor(side:String):void
		{
			var rand:uint;
			
			switch (side)
			{
				case DirectionType.NORTH:
					rand = Map.rand(1, width - 2);
					door = new Point(rand, 0);
					break;
					
				case DirectionType.SOUTH:
					rand = Map.rand(1, width - 2);
					door = new Point(rand, height - 1);
					break;
				
				case DirectionType.EAST:
					rand = Map.rand(1, height - 1);
					door = new Point(0, rand);
					break;
					
				case DirectionType.WEST:
					rand = Map.rand(1, height - 1);
					door = new Point(width - 1, rand);
					break;
				
			}
		}
		
		public function get top():uint 
		{
			return m_rect.top;
		}
		
		public function get left():uint 
		{
			return m_rect.left;
		}
		
		public function get width():uint 
		{
			return m_rect.width;
		}
		
		public function get height():uint 
		{
			return m_rect.height;
		}
		
		public function get id():uint 
		{
			return m_id;
		}
		
		public function set id(value:uint):void 
		{
			m_id = value;
		}
		
		public function get door():Point 
		{
			return m_door;
		}
		
		public function set door(value:Point):void 
		{
			m_door = value;
		}
		
		public function get rect():Rectangle 
		{
			return m_rect;
		}
				
	}

}