function keycode_to_string(_key,_return_uppercase)
{
	var _r = "UNDEFINED";
	
	switch(_key)
	{
		case vk_add:		 _r = "add"			break;
		case vk_alt:		 _r = "alt"			break;
		case vk_backspace:	 _r = "backspace"	break;
		case vk_control:	 _r = "ctrl"		break;
		case vk_decimal:	 _r = "decimal"		break;
		case vk_delete:		 _r = "delete"		break;
		case vk_divide:		 _r = "divide"		break;
		case vk_down:		 _r = "down"		break;
		case vk_end:		 _r = "end"			break;
		case vk_escape:		 _r = "escape"		break;
		case vk_f1:			 _r = "f1"			break;
		case vk_f2:			 _r = "f2"			break;
		case vk_f3:			 _r = "f3"			break;
		case vk_f4:			 _r = "f4"			break;
		case vk_f5:			 _r = "f5"			break;
		case vk_f6:			 _r = "f6"			break;
		case vk_f7:			 _r = "f7"			break;
		case vk_f8:			 _r = "f8"			break;
		case vk_f9:			 _r = "f9"			break;
		case vk_f10:		 _r = "f10"			break;
		case vk_f11:		 _r = "f11"			break;
		case vk_f12:		 _r = "f1"			break;
		case vk_home:		 _r = "home"		break;
		case vk_insert:		 _r = "insert"		break;
		case vk_lalt:		 _r = "lalt"		break;
		case vk_lcontrol:	 _r = "lcontrol"	break;
		case vk_left:		 _r = "left"		break;
		case vk_multiply:	 _r = "multiply"	break;
		case vk_numpad0:	 _r = "numpad0"		break;
		case vk_numpad1:	 _r = "numpad1"		break;
		case vk_numpad2:	 _r = "numpad2"		break;
		case vk_numpad3:	 _r = "numpad3"		break;
		case vk_numpad4:	 _r = "numpad4"		break;
		case vk_numpad5:	 _r = "numpad5"		break;
		case vk_numpad6:	 _r = "numpad6"		break;
		case vk_numpad7:	 _r = "numpad7"		break;
		case vk_numpad8:	 _r = "numpad8"		break;
		case vk_numpad9:	 _r = "numpad9"		break;
		case vk_pagedown:	 _r = "pagedown"	break;
		case vk_pageup:		 _r = "pageup"		break;
		case vk_pause:		 _r = "pause"		break;
		case vk_printscreen: _r = "printscreen"	break;
		case vk_ralt:		 _r = "ralt"		break;
		case vk_rcontrol:	 _r = "rcontrol"	break;
		case vk_return:		 _r = "return"		break;
		case vk_right:		 _r = "right"		break;
		case vk_rshift:		 _r = "rshift"		break;
		case vk_shift:		 _r = "shift"		break;
		case vk_space:		 _r = "space"		break;
		case vk_subtract:	 _r = "subtract"	break;
		case vk_tab:		 _r = "tab"			break;
		case vk_up:			 _r = "up"			break;
		
		case ord("0"):		 _r = "0"		break;
		case ord("1"):		 _r = "1"		break;
		case ord("2"):		 _r = "2"		break;
		case ord("3"):		 _r = "3"		break;
		case ord("4"):		 _r = "4"		break;
		case ord("5"):		 _r = "5"		break;
		case ord("6"):		 _r = "6"		break;
		case ord("7"):		 _r = "7"		break;
		case ord("8"):		 _r = "8"		break;
		case ord("9"):		 _r = "9"		break;
		
		case ord("A"):		 _r = "A"		break;
		case ord("B"):		 _r = "B"		break;
		case ord("C"):		 _r = "C"		break;
		case ord("D"):		 _r = "D"		break;
		case ord("E"):		 _r = "E"		break;
		case ord("F"):		 _r = "F"		break;
		case ord("G"):		 _r = "G"		break;
		case ord("H"):		 _r = "H"		break;
		case ord("I"):		 _r = "I"		break;
		case ord("J"):		 _r = "J"		break;
		case ord("K"):		 _r = "K"		break;
		case ord("L"):		 _r = "L"		break;
		case ord("M"):		 _r = "M"		break;
		case ord("N"):		 _r = "N"		break;
		case ord("O"):		 _r = "O"		break;
		case ord("P"):		 _r = "P"		break;
		case ord("Q"):		 _r = "Q"		break;
		case ord("R"):		 _r = "R"		break;
		case ord("S"):		 _r = "S"		break;
		case ord("T"):		 _r = "T"		break;
		case ord("U"):		 _r = "U"		break;
		case ord("V"):		 _r = "V"		break;
		case ord("W"):		 _r = "W"		break;
		case ord("X"):		 _r = "X"		break;
		case ord("Y"):		 _r = "Y"		break;
		case ord("Z"):		 _r = "Z"		break;
	}
	
	if _return_uppercase {_r = string_upper(_r);}
	
	return(_r)
}