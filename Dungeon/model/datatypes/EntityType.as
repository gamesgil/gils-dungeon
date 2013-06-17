package model.datatypes
{
	/**
	 * ...
	 * @author gil
	 */
	public final class EntityType
	{
		static public const PLAYER:EntityType = new EntityType();
		static public const MONSTER:EntityType = new EntityType();
		
		public function toString():String
		{
			var result:String = "";
			
			switch (this)
			{
				case PLAYER:
					result = "@";
					break;
					
				case MONSTER:
					result = "M";
					break;
			}
			
			return result;
		}
	}

}