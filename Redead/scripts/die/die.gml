// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function die(){
	instance_destroy(damageBox);
	
	switch object_index
	{
		case objEnemySmashable:
			var inst = instance_create_depth(x,y,SortLayer.Ground, objEnemySmashed);
			var _returnDir = returnDir;
			with inst
			{
				returnDir = _returnDir;
			}
			instance_destroy();
		break;
		
		case objEnemyLeavesCorpse:
		instance_create_depth(x,y,SortLayer.Above, objEnemyDie);
			instance_create_depth(x,y,SortLayer.Object, objCorpseRaiseAnimate);
			instance_destroy();
		break;
		
		default:
			instance_create_depth(x,y,SortLayer.Above, objEnemyDie);
			instance_destroy();
		break;
	
		
	}
	
	

}