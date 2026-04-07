/************************************
 * MODULE: scr_save_system.gml
 * AUTHOR: Rei Taylor
 * Product of Velvet Clover
 ************************************/

//#macro __SAVE_SET_TYPE__ -99

//save_set("EXAMPLE", "EXAMPLE", "EXAMPLE");
//save_type("EXAMPLE");
//__saves__(true, "EXAMPLE", {});
//show_message(save_get("EXAMPLE", "EXAMPLE", "NOTHING"));
//save_load_type("EXAMPLE");
//show_message(save_get("EXAMPLE", "EXAMPLE", "NOTHING"));

function __saves__(_should_set = false, _type = undefined, _key_val = {})
{
	static saves = {};
	
	if (_should_set) saves[$ _type] = _key_val;
	
	return saves;
}

function save_set(_type, _key, _val)
{
	var _ref = __saves__();
	if (!is_struct(_ref[$ _type])) _ref[$ _type] = {};
	_ref[$ _type][$ _key] = _val;
}

function save_get(_type, _key, _def = undefined)
{
	var _ty  = __saves__()[$ _type] ?? {};
	var _val = _ty[$ _key] ?? _def;
	
	return _val;
}

function save_type(_type)
{
	var _fname = __save_file_name(_type);
	var _json  = __saves__()[$ _type];
	var _str   = json_stringify(_json);
	var _dir   = filename_path(_fname);
	
	if (!directory_exists(_dir)) directory_create(_dir);
	
	var _buff = buffer_create(string_byte_length(_str), buffer_fixed, 1);
	
	buffer_write(_buff, buffer_text, _str);
	buffer_save(_buff, _fname);
	buffer_delete(_buff);
}

function save_load_type(_type, _fname = undefined)
{
	var _name   = _fname ?? __save_file_name(_type);
	var _buffer = buffer_load(_name);
	var _str    = buffer_read(_buffer, buffer_text);
	var _json   = json_parse(_str);
	
	buffer_delete(_buffer);
	__saves__(true, _type, _json);
}

function __save_file_name(_type)
{
	var _str = "";
	
	switch(_type)
	{
		default:
			_str = $"{_type}.save";
			break;
	}
	
	return _str;
}