# File type info

Proposed file types (ideas):
* General:
	* `.list` - a list of strings
		* a list of strings placed in separate lines
		* doesn't count empty lines
		* gotta think about comments within
			* maybe the standard `//`?
			* maybe `;`, etc at the beginning of line?
	* `.map` - a map of key-value pairs
		* primarily for saving values of actual objects' parameters
		* can be used for other purposes as well
	* `.class` - a class file
		* parent object reference
		* references to `.list`
			* primitive variables list
			* object reference list
		* references to maps (see below)
			* for constants
			* for static variables
			* for methods
* For handling objects:
	* a folder for keeping static class definitions
	* a folder for keeping object instances
	* a ledger for keeping track of object instances
		* and maybe relations?
* For future reference:
	* `.vob` - visual object-batch