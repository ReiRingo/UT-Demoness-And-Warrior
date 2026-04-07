content = "";

var buff_ref = buffer_load("bsod_msg.txt");
content = buffer_read(buff_ref, buffer_string);
buffer_delete(buff_ref);