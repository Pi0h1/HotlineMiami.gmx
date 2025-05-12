function LoadJSONFromFile(_filename){

	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete (_buffer);

	var _json = json_decode(_string);
	return _json;
}