package  
{
	/**
	 * ...
	 * @author gil
	 */
	public class Generator 
	{
		private var m_map:Map;
		
		public function Generator() 
		{
			
		}
		
		public function generate():Map
		{
			map = new Map(10, 10);
			map.pickRandomCellAndMarkItVisited();
			
			return map;
		}
		
		public function get map():Map 
		{
			return m_map;
		}
		
		public function set map(value:Map):void 
		{
			m_map = value;
		}
	}

}