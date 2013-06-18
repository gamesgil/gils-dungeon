package model 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import model.entitiy.Entity;
	import model.entitiy.Player;
	/**
	 * ...
	 * @author gil
	 */
	public class FightManager extends EventDispatcher
	{
		
		public function FightManager() 
		{
			
		}
		
		public function fight(attacker:Entity, receiver:Entity):void
		{
			var missChance:Number = 0.5;
			var damage:uint = attacker.power;
			
			trace(attacker.name + " attacks " + receiver.name);
			
			if (Math.random() > missChance)
			{
				receiver.hp -= damage;
				
				trace(receiver.name + " takes " + damage + " points of damage");
			}
			else
			{
				trace(attacker.name + " misses...");
			}
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
	}

}