if (isFinished)
{
	instance_destroy();
	exit;
}

if (face_blink)
{
	face_bl++;
	if (face_bl >= 2)
	{
		face_blink = false;
		face_bl = 0;
	}
}

if (textDelay > 0)
{
	if (can_skip && inputPressed(KEY_CANCEL))
	{
		textDelay = 0;
	}
	else
	{
		textDelay -= 1;
	}
}

if (isPaused && inputPressed(KEY_CONFIRM))
{
	isPaused = false;
}

if (!isFinished && !isPaused && textDelay <= 0)
{
	internalCounter++;
	
	var isFastForward = can_skip && inputPressed(KEY_CANCEL);
	
	face_index += face_speed;
	face_index %= face_num;

	if (internalCounter >= textSpeed || isFastForward)
	{
		internalCounter = 0;

		while (textRawCount < string_length(text))
		{
			var char = string_char_at(text, textRawCount + 1);

			if (char == "/")
			{
				var nextChar = string_char_at(text, textRawCount + 2);

				// ESCAPE CHARACTER (// becomes /)
				if (nextChar == "/")
				{
					// Skip the first slash and treat the second as a normal glyph
					textRawCount++; 
					char = "/"; 
					// We don't 'continue' here; we let it fall through to createGlyph(char)
				}
				else
				{
					// FACE
					if (nextChar == "F")
					{
						var has_comma;
						var count    = real(string_char_at(text, textRawCount + 3));
						has_comma    = string_char_at(text, textRawCount + 4) == ",";
						var arg      = "";
						
						if (has_comma)
						{
							arg      += string_copy(text, textRawCount + 5, count);
							arg      = real(arg);
							textRawCount += 4+count;
						}
						else
						{
							arg      = count;
							textRawCount += 3;
						}
						
						textFace     = arg;
						
						var ref_face = faces[textFace];
						face_index   = 0;
						face_num     = sprite_get_number(ref_face);
						face_speed   = sprite_get_speed(ref_face) / 60;
						face_blink   = true;
						continue;
					}

					// EFFECTS
					if (nextChar == "E")
					{
						textEffect = real(string_char_at(text, textRawCount + 3));
						textRawCount += 3;
						continue;
					}

					// BREAK (clear board)
					if (nextChar == "B")
					{
						glyphs = [];
						textX = 0;
						textY = 0;
						textRawCount += 2;
						face_blink = true;
						if (!isFastForward) break; 
						continue;
					}

					// ABSOLUTE END
					if (nextChar == "%")
					{
						isFinished = true;
						instance_destroy();
						exit;
					}

					// PAUSE
					if (nextChar == "P")
					{
						isPaused = true;
						textRawCount += 2;
						break;
					}

					// COLOUR
					if (nextChar == "C")
					{
						textColour = string_char_at(text, textRawCount + 3);
						textRawCount += 3;
						continue;
					}

					// DELAY
					if (nextChar == "D")
					{
						var readCount = real(string_char_at(text, textRawCount + 3));
						var rd = "";
						var hasComma = (string_char_at(text, textRawCount + 4) == ",");
						
						if (hasComma)
						{
							for (var i=0; i<readCount; ++i)
							{
								rd += string_char_at(text, textRawCount + 5 + i);
							}
						}
						else 
						{
							rd = readCount;
						}

						textRawCount += hasComma ? (4 + readCount) : 3;

						if (!isFastForward)
						{
							textDelay = real(rd);
							break;
						}
						continue;
					}
					
					// VOICE
					if (nextChar == "V")
					{
						var has_comma;
						var count    = real(string_char_at(text, textRawCount + 3));
						has_comma    = string_char_at(text, textRawCount + 4) == ",";
						var arg      = "";
						
						if (has_comma)
						{
							arg      += string_copy(text, textRawCount + 5, count);
							arg      = real(arg);
							textRawCount += 4+count;
						}
						else
						{
							arg      = count;
							textRawCount += 3;
						}
						
						textVoice    = arg;
						continue;
					}
					
					// SKIPPABLE
					if (nextChar == "K")
					{
						can_skip = int64(string_char_at(text, textRawCount + 3));
						textRawCount += 3;
						continue;
					}
					
					// SPEED
					if (nextChar == "s")
					{
						var has_comma;
						var count    = real(string_char_at(text, textRawCount + 3));
						has_comma    = string_char_at(text, textRawCount + 4) == ",";
						var arg      = "";
						
						if (has_comma)
						{
							var temp_arg = real(arg);
							arg          += string_copy(text, textRawCount + 5, count);
							arg          = temp_arg <= 0 ? 1 : temp_arg;
							textRawCount += 4+count;
						}
						else
						{
							arg      = count;
							textRawCount += 3;
						}
						
						textSpeed    = arg;
						continue;
					}
				}
			}
			else if (char == "&")
			{
				textX = 0;
				textY += (string_height(char) * textScale) + textV;
				textRawCount++;
				continue;
			}

			// New Glyph!
			createGlyph(char);
			textRawCount++;
			
			if (audio_exists(voices[textVoice]))
			{
				if (!isFastForward || (textRawCount % 2 == 0))
				{
					sndOnce(voices[textVoice]);
				}
			}

			if (!isFastForward) 
			{
				break;
			}
		}
	}
}
else
{
	face_index = 0;
}

var len = array_length(glyphs);
for (var i = 0; i < len; ++i)
{
	glyphs[i].step(current_time);
}