if (y > room_height + 100 || x < -100 || x > room_width + 100) 
{
    instance_destroy();
}

image_angle += rotateSpeed;