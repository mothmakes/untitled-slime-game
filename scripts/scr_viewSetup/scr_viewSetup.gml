// A basic view setup script to run in a gamemanager
function scr_viewSetup(){
	view_enabled = true;
	view_visible[0] = true;
	// Additional views here
	// Setup basic resolution
	base_w = 640;
	base_h = 360;
	
	var max_w = display_get_width();
	var max_h = display_get_height();
	var aspect = display_get_width() / display_get_height();
	if (max_w < max_h)
	    {
	    // portait
	     var VIEW_WIDTH = min(base_w, max_w);
	    var VIEW_HEIGHT = VIEW_WIDTH / aspect;
	    }
	else
	    {
	    // landscape
	    var VIEW_HEIGHT = min(base_h, max_h);
	    var VIEW_WIDTH = VIEW_HEIGHT * aspect;
	    }
	view_wport[0] = max_w;
	view_hport[0] = max_h;
	
	surface_resize(application_surface, view_wport[0], view_hport[0]);
	
	view_camera[0] = camera_create_view(0, 0, 640, 360, 0, noone, -1, -1, -1, -1);
}