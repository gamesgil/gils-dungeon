package model
{
	import flash.geom.Point;
	import model.datatypes.CellType;
	import model.datatypes.ItemType;
	import model.entitiy.Entity;
	import model.item.Item;
	/**
	 * ...
	 * @author gil
	 */
	public class Cell 
	{
		private var m_visited:Boolean;
		private var m_type:CellType;
		private var m_coordinates:Point;
		private var m_item:Item;
		private var m_entity:Entity;
		
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
		
		public function get type():CellType 
		{
			return m_type;
		}
		
		public function set type(value:CellType):void 
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
		
		public function get item():Item 
		{
			return m_item;
		}
		
		public function set item(value:Item):void 
		{
			m_item = value;
		}
		
		public function get entity():Entity
		{
			return m_entity;
		}
		
		public function set entity(value:Entity):void 
		{
			m_entity = value;
		}
		
	}

}