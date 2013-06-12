package model.datatypes
{
	/**
	 * ...
	 * @author gil
	 */
	public final class DirectionType 
	{
		static public const NORTH:DirectionType = new DirectionType();
		static public const SOUTH:DirectionType = new DirectionType(); 
		static public const EAST:DirectionType = new DirectionType();
		static public const WEST:DirectionType = new DirectionType();
		
		public function toString():String
		{
			var result:String = "";
			
			switch (this)
			{
				case NORTH:
					result = "north";
					break;
					
				case SOUTH:
					result = "south";
					break;
					
				case EAST:
					result = "east";
					break;
					
				case WEST:
					result = "west";
					break;
			}
			
			return result;
		}
	}

}