package model.entitiy
{
	import model.datatypes.EntityType;
	/**
	 * ...
	 * @author gil
	 */
	public class Player extends Entity 
	{
		
		public function Player() 
		{
			type = EntityType.PLAYER;
			
			hp = Math.floor(Math.random() * 3 + 1);
			power = Math.floor(Math.random() * 1 + 1);
		}
		
		override public function toString():String 
		{
			if (hp)
			{
				return super.toString();
			}
			else
			{
				return "X";
			}
		}
		override public function get name():String
		{
			return "Player";
		}
	}

}