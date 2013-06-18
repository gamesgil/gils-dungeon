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
		
		public function killEntity(entity:Entity):void
		{
			var pos:int = -1;
			
			for (var i:int = 0; i < m_entities.length; i++) 
			{
				if (Entity(m_entities[i]) == entity)
				{
					pos = i;
					break;
				}
			}
			
			if (entity != player)
			{
				m_entities.splice(pos, 1);
				entity.cell.entity = null;
				entity.destroy();
			}
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
		
		public function scanForDeadEntities():void 
		{
			for (var i:int = 0; i < m_entities.length; i++) 
			{
				if (Entity(m_entities[i]).hp <= 0)
				{
					trace(Entity(m_entities[i]).name + " dies");
					killEntity(m_entities[i]);
				}
			}
		}
		
		public function isEntityWithinRangeOrAnother(entity1:Entity, entity2:Entity, maxRange:uint):Boolean
		{
			var result:Boolean = false;
			
			var range:uint = Math.max(Math.abs(entity1.x - entity2.x), Math.abs(entity1.y - entity2.y));
			
			if (range <= maxRange)
			{
				result = true;
			}
			
			return result;
		}
		
		public function getEntity(idx:uint):Entity
		{
			return m_entities[Math.min(idx, m_entities.length - 1)];
		}
		
		public function get numOfEntities():uint
		{
			return m_entities.length;
		}
	}

}