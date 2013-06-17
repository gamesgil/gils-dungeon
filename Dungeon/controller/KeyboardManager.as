package controller 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import model.datatypes.DirectionType;
	import model.Map;
	/**
	 * ...
	 * @author gil
	 */
	public class KeyboardManager extends EventDispatcher
	{
		private var m_map:Map;
		
		public function KeyboardManager(stage:Stage) 
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown, false, 0, true);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			var success:Boolean = false;
			
			switch (e.keyCode)
			{
				case 37:
					success = map.moveEntity(map.player, DirectionType.WEST);
					break;
					
				case 38:
					success = map.moveEntity(map.player, DirectionType.NORTH);
					break;
					
				case 39:
					success = map.moveEntity(map.player, DirectionType.EAST);
					break;
					
				case 40:
					success = map.moveEntity(map.player, DirectionType.SOUTH);
					break;
			}
			
			if (success)
			{
				trace("success");
				dispatchEvent(new Event(Event.CHANGE));
			}
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