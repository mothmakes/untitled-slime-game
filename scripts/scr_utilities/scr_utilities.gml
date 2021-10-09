// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function a(){
	var arr;
	for(var i=0;i<argument_count;i++) {
		arr[i] = argument[i];
	}
	return arr;
}

function sdm(_string) {
	show_debug_message(_string);	
}

function array_delete_val(_array,_val) {
	for(var i=0;array_length(_array);i++) {
		if(_array[i] == _val) {
			array_delete(_array,i,1);	
		}
	}
}

/// smoothstep(a,b,x)
//
//  Returns 0 when (x < a), 1 when (x >= b), a smooth transition
//  from 0 to 1 otherwise, or (-1) on error (a == b).
//
//      a           upper bound, real
//      b           lower bound, real
//      x           value, real
//
/// GMLscripts.com/license
function smoothstep(_a,_b,_x) {
    var p;
    if (_x < _a) return 0;
    if (_x >= _b) return 1;
    if (_a == _b) return -1;
    p = (_x - _a) / (_b - _a);
    return (p * p * (3 - 2 * p));
}

function step(_a,_b,_x) {
    var p;
    if (_x < _a) return 0;
    if (_x >= _b) return 1;
    if (_a == _b) return -1;
    p = (_x - _a) / (_b - _a);
    return p;
}

/// smoothmap(a,b,x,start,end)
// Returns a value within the space provided by start and end, that is smoothly interpolated between the upper
// and lower bounds. Maps a value in the bounds to a value in the space.
//
// a			upper bound, real
// b			lower bound, real
// x			value, real
// start	space start, real
// end	space end, real
function smoothmap(_upper,_lower,_x,_spaceStart,_spaceEnd) {
	var _spaceSize = abs(_spaceEnd - _spaceStart);
	var _scaledValue = smoothstep(_upper,_lower,_x) * _spaceSize;
	return _scaledValue + _spaceStart;
}

function map(_upper,_lower,_x,_spaceStart,_spaceEnd) {
	var _spaceSize = abs(_spaceEnd - _spaceStart);
	var _scaledValue = step(_upper,_lower,_x) * _spaceSize;
	return _scaledValue + _spaceStart;
}

/// @function with_tagged(tag, lambda)
/// @param tag The tag or array of tags to operate on
/// @param lambda An inline function to be run
/// Applies the lambda function provided to every instance with a given tag
function with_tagged(tag, lambda) {
	var tagged = tag_get_asset_ids(tag, asset_object);
	for (var i = 0; i < array_length(tagged); i++) {
		with (tagged[i]) {
			var boundMethod = method(self, lambda);
			boundMethod();
		}
	}
}
	
function x_distance_to_instance(_x,_inst,_useMask) {
	if(!_useMask) {
		return abs(_x - _inst.x);
	} else {
		return min(abs(_x - _inst.bbox_left),abs(_x - _inst.bbox_right));
	}
}

function y_distance_to_instance(_y,_inst,_useMask) {
	if(!_useMask) {
		return abs(_y - _inst.y);
	} else {
		return min(abs(_y - _inst.bbox_top),abs(_y - _inst.bbox_bottom));
	}
}


function draw_circular_bar(x ,y ,value, max, colour, radius, transparency, width) {

	if (argument2 > 0) { // no point even running if there is nothing to display (also stops /0
	    var i, len, tx, ty, val;
    
	    var numberofsections = 60 // there is no draw_get_circle_precision() else I would use that here
	    var sizeofsection = 360/numberofsections
    
	    val = (argument2/argument3) * numberofsections 
    
	    if (val > 1) { // HTML5 version doesnt like triangle with only 2 sides 
    
	        piesurface = surface_create(argument5*2,argument5*2)
            
	        draw_set_colour(argument4);
	        draw_set_alpha(argument6);
        
	        surface_set_target(piesurface)
        
	        draw_clear_alpha(c_blue,0.7)
	        draw_clear_alpha(c_black,0)
        
	        draw_primitive_begin(pr_trianglefan);
	        draw_vertex(argument5, argument5);
        
	        for(i=0; i<=val; i++) {
	            len = (i*sizeofsection)+90; // the 90 here is the starting angle
	            tx = lengthdir_x(argument5, len);
	            ty = lengthdir_y(argument5, len);
	            draw_vertex(argument5+tx, argument5+ty);
	        }
        
	        draw_primitive_end();
        
	        draw_set_alpha(1);
        
	        gpu_set_blendmode(bm_subtract)
	        draw_set_colour(c_black)
	        draw_circle(argument5-1, argument5-1,argument5-argument7,false)
	        gpu_set_blendmode(bm_normal)

	        surface_reset_target()
     
	        draw_surface(piesurface,argument0-argument5, argument1-argument5)
        
	        surface_free(piesurface)
        
	    }
    
	}
}