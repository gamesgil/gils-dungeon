package model.item
{
	import model.Cell;
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
			var cell:Cell;
			
			for (var i:int = 0; i < 10; i++) 
			{
				cell = m_map.findRandomFreeCell();
				cell.item = new TreasureChest();
			}
		}
		
	}

}