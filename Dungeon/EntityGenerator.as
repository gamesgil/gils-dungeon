package  
{
	/**
	 * ...
	 * @author gil
	 */
	public class EntityGenerator 
	{
		private var m_entities:Array;
		private var m_map:Map;
		
		public function EntityGenerator(map:Map) 
		{
			m_map = map;
			m_entities = [];
		}
		
		public function addEntity(entity:Entity):void
		{
			m_entities.push(entity);
			
			m_map.findRandomFreeCell().type = EntityType.PLAYER;
		}
		
		public function get player():Player
		{
			var result:Player;
			
			for (var i:int = 0; i < m_entities.length; i++) 
			{
				if (m_entities[i] is Player)
				{
					result = m_entities[i];
					break;
				}
			}
			
			return result;
		}
		
	}

}