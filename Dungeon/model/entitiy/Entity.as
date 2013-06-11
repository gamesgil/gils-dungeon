package model.entitiy
{
	import model.Cell;
	import model.datatypes.DirectionType;
	/**
	 * ...
	 * @author gil
	 */
	public class Entity 
	{
		static private var m_idx:uint = 0;
		
		private var m_cell:Cell;
		
		public function Entity() 
		{
			m_idx++;
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
		
	}

}