// interact event
i_event    = function(){};

// can collide
collidable = true;

// char behaviour here
move     = { "0": 0, "90": 0, "180": 0, "270": 0 }; // buffer
sprites  = { "0": undefined, "90": undefined, "180": undefined, "270": undefined };

dir_lock = false;
dir      = 270; // down