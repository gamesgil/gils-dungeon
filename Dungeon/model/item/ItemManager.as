package model.item
{
	import model.datatypes.ItemType;
	import model.Map;
	/**
	 * ...
	 * @author gil
	 */
	public class ItemManager 
	{
		private var m_map:Map;
		
		public function ItemManager(map:Map) 
		{
			m_map = map;
		}
		
		public function placeItems():void
		{
			for (var i:int = 0; i < 10; i++) 
			{
				m_map.findRandomFreeCell().type =  ItemType.TREASURE_CHEST;
			}
		}
		
	}

}