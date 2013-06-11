package model
{
	import flash.geom.Point;
	import model.datatypes.CellType;
	/**
	 * ...
	 * @author gil
	 */
	public class Cell 
	{
		private var m_visited:Boolean;
		private var m_type:String;
		private var m_coordinates:Point;
		
		public function Cell(point:Point) 
		{
			m_visited = false;
			m_coordinates = point;
			
			type = CellType.EMPTY;
		}
		
		public function get visited():Boolean 
		{
			return m_visited;
		}
		
		public function set visited(value:Boolean):void 
		{
			m_visited = value;
		}
		
		public function get type():String 
		{
			return m_type;
		}
		
		public function set type(value:String):void 
		{
			m_type = value;
		}
		
		public function get x():int 
		{
			return m_coordinates.x;
		}
		
		public function get y():int 
		{
			return m_coordinates.y;
		}
		
	}

}