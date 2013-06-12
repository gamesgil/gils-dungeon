package model.datatypes
{
	/**
	 * ...
	 * @author gil
	 */
	public final class CellType 
	{
		static public const FLOOR:CellType = new CellType();
		static public const WALL:CellType = new CellType(); 
		static public const EMPTY:CellType = new CellType();
		static public const DOOR:CellType = new CellType(); 
		static public const PASSAGE:CellType = new CellType();
		
		public function CellType() { }
		
		public function toString():String
		{
			var result:String = "";
			
			switch (this)
			{
				case FLOOR:
					result = "-";
					break;
					
				case WALL:
					result = "W";
					break;
					
				case EMPTY:
					result = ".";
					break;
					
				case DOOR:
					result = "+";
					break;
					
				case PASSAGE:
					result = "X";
					break;
			}
			
			return result;
		}
	}

}