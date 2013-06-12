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
		
		public function Item() 
		{
			
		}
		
		public function get type():ItemType 
		{
			return m_type;
		}
		
		public function set type(value:ItemType):void 
		{
			m_type = value;
		}
		
	}

}