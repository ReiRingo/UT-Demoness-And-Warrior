/***********************
 * MODULE: scr_battle_weapon_id.gml
 * AUTHOR: Rei Taylor
 * Product of Velvet Clover 2026
 */

#macro WEAPON_ID __weapon_id

function __weapon_id(op = "get", val = undefined)
{
	static weapon_id = -1;
	
	var ret = undefined;
	switch(op)
	{
		case "get":
			ret = weapon_id;
			break;
		
		case "set":
			weapon_id = val;
			break;
	}
}