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
		static private var s_idx:uint = 0;
		
		private var m_cell:Cell;
		private var m_type:EntityType;
		private var m_power:uint;
		private var m_hp:int;
		private var m_idx:uint;
		
		public function Entity() 
		{
			m_idx = ++s_idx;
			
			m_power = Math.floor(Math.random() * 5);
		}
		
		public function toString():String
		{
			return type.toString();
		}
		
		public function destroy():void
		{
			cell = null;
		}
		
		public function get name():String
		{
			return null;
		}
		
		public function checkOverlapWithItem():void
		{
			if (cell.item)
			{
				trace(cell.item);
			}
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
		
		public function get power():uint 
		{
			return m_power;
		}
		
		public function set power(value:uint):void 
		{
			m_power = Math.max(value, 0);
		}
		
		public function get hp():int 
		{
			return m_hp;
		}
		
		public function set hp(value:int):void 
		{
			m_hp = value;
		}
		
		public function get idx():uint 
		{
			return m_idx;
		}
		
	}

}