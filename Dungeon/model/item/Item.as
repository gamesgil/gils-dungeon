package model.item 
{
	import model.datatypes.ItemType;
	/**
	 * ...
	 * @author gil
	 */
	public class Item 
	{
		private var m_type:ItemType;
		protected var m_xp:uint;
		protected var m_coins:uint;
		
		public function Item() 
		{
			
		}
		
		public function toString():String
		{
			return null;
		}
		
		public function get type():ItemType 
		{
			return m_type;
		}
		
		public function set type(value:ItemType):void 
		{
			m_type = value;
		}
		
		public function get xp():uint 
		{
			return m_xp;
		}
		
		public function set xp(value:uint):void 
		{
			m_xp = value;
		}
		
		public function get coins():uint 
		{
			return m_coins;
		}
		
		public function set coins(value:uint):void 
		{
			m_coins = value;
		}
		
	}

}