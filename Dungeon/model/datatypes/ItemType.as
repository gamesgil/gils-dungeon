package model.datatypes
{
	/**
	 * ...
	 * @author gil
	 */
	public final class ItemType 
	{
		static public const TREASURE_CHEST:ItemType = new ItemType();
		
		public function toString():String
		{
			var result:String = "";
			
			switch (this)
			{
				case TREASURE_CHEST:
					result = "T";
					break
			}
			
			return result;
		}
	}

}