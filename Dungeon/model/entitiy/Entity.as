package model.entitiy
{
	import model.Cell;
	import model.datatypes.DirectionType;
	import model.datatypes.EntityType;
	/**
	 * ...
	 * @author gil
	 */
	public class Entity 
	{
		static private var m_idx:uint = 0;
		
		private var m_cell:Cell;
		private var m_type:EntityType;
		
		public function Entity() 
		{
			m_idx++;
		}
		
		public function toString():String
		{
			return type.toString();
		}
		
		static public function get idx():uint 
		{
			return m_idx;
		}
		
		public function get x():uint 
		{
			return m_cell.x;
		}
		
		public function get y():uint 
		{
			return m_cell.y;
		}
		
		public function get cell():Cell 
		{
			return m_cell;
		}
		
		public function set cell(value:Cell):void 
		{
			m_cell = value;
		}
		
		public function get type():EntityType 
		{
			return m_type;
		}
		
		public function set type(value:EntityType):void 
		{
			m_type = value;
		}
		
	}

}