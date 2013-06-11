package  
{
	/**
	 * ...
	 * @author gil
	 */
	public class Entity 
	{
		static private var m_idx:uint = 0;
		
		public function Entity() 
		{
			m_idx++;
		}
		
		static public function get idx():uint 
		{
			return m_idx;
		}
		
	}

}