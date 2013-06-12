package controller 
{
	import flash.text.TextField;
	/**
	 * ...
	 * @author gil
	 */
	public class MessageManager 
	{
		private var m_field:TextField;
		
		public function MessageManager(field:TextField) 
		{
			m_field = field;
		}
		
		public function addMessage(message:String):void
		{
			m_field.text += message + "\n";
		}
	}

}