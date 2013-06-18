package model.entitiy 
{
	import model.datatypes.EntityType;
	/**
	 * ...
	 * @author gil
	 */
	public class Monster extends Entity 
	{
		public function Monster() 
		{
			type = EntityType.MONSTER;
			
			power = 1;
			hp = 2;
		}
		
		override public function get name():String
		{
			return "Monster " + idx;
		}
		
	}

}