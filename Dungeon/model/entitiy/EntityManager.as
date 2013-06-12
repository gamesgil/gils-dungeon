package model.entitiy
{
	import model.Cell;
	import model.datatypes.CellType;
	import model.datatypes.EntityType;
	import model.Map;
	/**
	 * ...
	 * @author gil
	 */
	public class EntityManager
	{
		private var m_entities:Array;
		private var m_map:Map;
		
		public function EntityManager(map:Map) 
		{
			m_map = map;
			m_entities = [];
		}
		
		public function addEntity(entity:Entity):void
		{
			var cell:Cell = m_map.findRandomFreeCell();
			
			m_entities.push(entity);
			entity.cell = cell;
			
			cell.entity = entity;
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
		
		public function moveEntity(entity:Entity, cell:Cell):void
		{
			if (cell.type == CellType.FLOOR)
			{
				entity.cell.type = CellType.FLOOR;
				entity.cell.entity = null;
				entity.cell = cell;
				entity.cell.entity = entity;
			}
		}
	}

}