package  
{
	/**
	 * ...
	 * @author gil
	 */
	public class ItemGenerator 
	{
		private var m_map:Map;
		
		public function ItemGenerator(map:Map) 
		{
			m_map = map;
		}
		
		public function placeItems():void
		{
			for (var i:int = 0; i < 10; i++) 
			{
				m_map.findRandomFreeCell().type = ItemTypes.TREASURE_CHEST;
			}
		}
		
	}

}