package model.item 
{
	import model.datatypes.ItemType;
	/**
	 * ...
	 * @author gil
	 */
	public class TreasureChest extends Item
	{
		public function TreasureChest() 
		{
			type = ItemType.TREASURE_CHEST;
			
			coins = Math.floor(Math.random() * 10);
		}
		
		override public function toString():String 
		{
			return "Treasure Chest: " + coins + " coins";
		}
		
	}

}