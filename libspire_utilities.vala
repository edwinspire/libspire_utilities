//	
//
//  Author:
//       Edwin De La Cruz <admin@edwinspire.com>
//
//  Copyright (c) 2013 edwinspire
//  Web Site http://edwinspire.com
//
//  Quito - Ecuador
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or		
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
using Gee;
using GLib;

    /**
    * Namespace covering additional classes for general use.
    */ 
namespace edwinspire.utils{

    /**
    * Basic functions for reading and writing files.
    */    
    public class FileFunctions:GLib.Object{
        /**
        * file_name is the name of the file to be read or written. 
        * You may need to put the full path.
        */
        public string file_name = "file.uhttp";
        public string full_path{get; private set; default = "";}
           
            public FileFunctions(){
            }
            
		/**
		* Create DataInputStream
		* Creates a DataInputStream from the data passed as a parameter .
		*/
		public static DataInputStream create_DataInputStream_from_data(uint8[] data){
		
			MemoryInputStream Mis = new MemoryInputStream.from_data(data, null);
			var dis = new DataInputStream(Mis);
			dis.set_buffer_size(data.length);
			return dis;
		}           
            
            /**
            * Removes leading and trailing whitespace from a string.
            */            
            public static string text_strip(string t){
            	return t.strip();
            }
            
            /**
            * Create the file if it does not exist with the data passed as a parameter.
            */
            public bool create_if_does_not_exist(uint8[] data = "".data){
                    var file = File.new_for_path (this.file_name);
                    this.full_path = file.get_path();

                    if (!file.query_exists ()) {
                        this.create_new_file(data);
                    }
                    return true;            
            }
            /**
            * Create a new file with the data passed as a parameter.
            */
            public long create_new_file(uint8[] data = "".data){
                return this.write_file(data);                
            }
            
            /**
            * Writes data to the file, replacing the previous.
            */
            public long write_file(uint8[] data = "".data){
                long written = 0;
                try {
                    // an output file in the current working directory
                    var file = File.new_for_path (this.file_name);
                	 this.full_path = file.get_path();
                   if (file.query_exists ()) {
                   file.delete ();
                    }

                    // creating a file and a DataOutputStream to the file
                    var dos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION));
                    // For long string writes, a loop should be used, because sometimes not all data can be written in one run
                    // 'written' is used to check how much of the string has already been written
                    while (written < data.length) { 
                    // sum of the bytes of 'text' that already have been written to the stream
                    written += dos.write (data[written:data.length]);
                    }
                    
                } catch (Error e) {
                stderr.printf ("%s\n", e.message);
                }  
            return written;          
            }
            
            /**
            * Read binary data file.
            */
            public uint8[] read_file(){
                var file = File.new_for_path (this.file_name);
               // warning(file.get_path());
                uint8[] Retorno = {}; 
                if (file.query_exists ()) {
                        try {
                        
                         var file_info = file.query_info ("*", FileQueryInfoFlags.NONE);
                        //    stdout.printf ("File size: %lld bytes\n", file_info.get_size ());
                        Retorno = new uint8[file_info.get_size()];
                        // Open file for reading and wrap returned FileInputStream into a
                        // DataInputStream, so we can read line by line
                        var dis = new DataInputStream (file.read ());  
                        size_t bytes_read;
                       dis.read_all(Retorno, out bytes_read);
                       //message("File '%s' loading... %s = %s - %s\n", file.get_path (), (string)Retorno, bytes_read.to_string(), dis.has_pending ().to_string());
                    } catch (Error e) {
                        error ("%s", e.message);
                    } 
                }else{
                stderr.printf ("File '%s' doesn't exist.\n", file.get_path ());
                }  
                
                return Retorno;         
            }
            
            /**
            * Read data from the file and returns them as a BinaryData Class.
            */            
            public BinaryData read_as_binarydata(){
            return new BinaryData(this.read_file());            
            }
            
            /**
            * Read data from the file and returns them as a string with only valid characters unichar.
            */
            public string load_only_valid_unichars(){
                var B = new BinaryData(this.read_file());
                return B.to_string_only_valid_unichars();                
            }
    

    
    } 



    /**
    * Class representing a file with values ​​KeyFile
    */
    public class KeyValueFile:FileFunctions{
    	/**
    	* Regular expression used for detection of the fields.
    	*/  
    	public string Exp = """(?<key>[0-9\w]+):[\s]+(?<value>[0-9\w\s\W]+)""";
    	/**
    	* Default Message to save the file.
    	*/      
    	public string default_message = "";
    	/**
    	* Returns a HashMap from file.
    	*/  
      	public HashMap<string, string> KeyValue = new HashMap<string, string>();
    	public KeyValueFile(){
    		this.default_message = "# Configuration File";
    		//this.Exp = regex;
    		this.file_name = "kf.conf";
    	}
    
    /**
    * Returns a string that represents the Hashmap passed as parameter.
    */      
    	public static string HashMapToString(HashMap<string, string> hm) {
			var Retorno = new StringBuilder();
			foreach(var r in hm.entries) {
				Retorno.append_printf("%s: %s\n", r.key, r.value);
			}
		return Retorno.str;
	}

    /**
    * Returns a string that represents the KeyValue File, with title.
    */ 
	public string to_string(string title = "KeyValueFile\n"){
		var Retorno = new StringBuilder(title);
		Retorno.append(HashMapToString(KeyValue));
		return Retorno.str;
	}
	
    /**
    * Load the file with the data.
    */ 	    
    	public void load(){
                this.create_if_does_not_exist(this.default_message.data);
                var lines = this.load_only_valid_unichars().split("\n");
                try {
                	//warning(Exp);
                                	Regex RegExp = new Regex(Exp);       
					MatchInfo match;
					      
                    foreach(var l in lines){
                            if(!l.has_prefix("#") && l.length > 0){
                            
                               // warning(l);
					// Verify that the file passed as an argument matches any of the regular expression patterns.
						if(RegExp.match(l, RegexMatchFlags.ANCHORED, out match)) {
							//warning("Funca\n");	  
						  string? k = match.fetch_named("key");
						  string? v = match.fetch_named("value");
						  
						  if(k != null && k.length>0){
						  	if(v == null){
						  		v = "";
						  	}
						  	this.KeyValue[k] = text_strip(v); 
						  }						  
						  
						}
				                                             
                            }

                        }
                        
                        }catch (RegexError err) {
							warning (err.message);
						}

                    
                   
            }
            

	    /**
	    * Returns the value of the key as a string.
	    */             
            public string get_as_string(string key){
            	if(KeyValue.has_key(key)){
            		return KeyValue[key];
            	}else{
            		return "";
            	}
            }
            
	    /**
	    * Returns the value of the key as a boolean.
	    */                       
	public bool get_as_bool(string key){
            	if(KeyValue.has_key(key)){
            		return bool.parse(KeyValue[key]);
            	}else{
            		return false;
            	}
        }
          
	    /**
	    * Returns the value of the key as a uint16.
	    */             
		public uint16 get_as_uint16(string key){
            		return (uint16)this.get_as_int(key);
		}            
            
	    /**
	    * Returns the value of the key as a int.
	    */              
		public int get_as_int(string key){
            	if(KeyValue.has_key(key)){
            		return int.parse(KeyValue[key]);
            	}else{
            		return 0;
            	}
		}            
            
                
    
    }  
    
    
    /**
    * Class representing the lines of a file as an ArrayList<string>
    */
    public class FilesLinesArray:FileFunctions{
        /**
    	* File Lines
    	*/
        public ArrayList<string> Lines = new ArrayList<string>();    
        /**
    	* Default text for the file
    	*/        
        public string default_message = """#The lines of this file shall be converted to an ArrayList, the lines starting with # will not be taken into account.
""";
    
            /**
            * Constructor
            */
            public FilesLinesArray(){
            }   

            /**
            * Read the file data and loads the valid values ​​in the ArrayList
            */
            public void load(){
                this.create_if_does_not_exist(this.default_message.data);
                var lines = this.load_only_valid_unichars().split("\n");
                    foreach(var l in lines){
                            //stdout.printf ("-%s\n", l);
                            if(!l.has_prefix("#") && l.length > 0){
                                this.Lines.add(l);                             
                            }

                        }            
                      
            }
    

    
    }     
    
    
    /**
    * This class represents binary data in uitn8[] with features that be converted to string
    */
    public class BinaryData:GLib.Object{
    
        private ArrayList<uint8> internal_data = new ArrayList<uint8>();
        
        public BinaryData(uint8[] binary = {}){
            this.data = binary;        
        }  
       
    /**
    *  Checksum use the MD5 hashing algorithm
    */        
        public string md5(){
        return Checksum.compute_for_data (ChecksumType.MD5, this.data);
        }
        
    /**
    *  Size of the data.
    */          
        public int length{
        	get {
        		return internal_data.size;
        	}
        }
 
    /**
    *  Data as uint8[]
    */        
	public uint8[] data{
		owned get{
		
			return this.internal_data.to_array();
		}
		set{
			this.internal_data.clear();
			foreach(var d in value){
				this.internal_data.add(d);			
			}
		}
	}    
	
	  
            
        /**
        * Returns the data as a string.
        */  
        public string to_string(){
            return (string)this.data;
        }

        /**
        * Add a uint8 to class.
        */         
        public void add_uint8(uint8 byte){
          	this.internal_data.add(byte);   
        }
        /**
        * Convert data and returns them as a string with only valid characters unichar.
        */
        public string to_string_only_valid_unichars() {
			var R = new StringBuilder();
			string Cadena = this.to_string();
			int CLength = this.data.length;
			unichar caracter;
			if(CLength > 0) {
				for (int i = 0; Cadena.get_next_char(ref i, out caracter);) {
					if(i>CLength) {
						break;
					}
					if(caracter.validate()) {
						R.append_unichar(caracter);
					}
				}
			}
			return R.str;
		}
    
    }    
    



}
