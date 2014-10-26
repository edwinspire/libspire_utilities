/* libspire_utilities.vapi generated by valac 0.16.1, do not modify. */

namespace edwinspire {
	namespace utils {
		[CCode (cheader_filename = "libspire_utilities.h")]
		public class BinaryData : GLib.Object {
			public BinaryData (uint8[] binary = new uint8[0] { });
			public void add_uint8 (uint8 byte);
			public string md5 ();
			public string to_string ();
			public string to_string_only_valid_unichars ();
			public uint8[] data { owned get; set; }
			public int length { get; }
		}
		[CCode (cheader_filename = "libspire_utilities.h")]
		public class FileFunctions : GLib.Object {
			public string file_name;
			public FileFunctions ();
			public static GLib.DataInputStream create_DataInputStream_from_data (uint8[] data);
			public bool create_if_does_not_exist (uint8[] data = "".data);
			public long create_new_file (uint8[] data = "".data);
			public string load_only_valid_unichars ();
			public edwinspire.utils.BinaryData read_as_binarydata ();
			public uint8[] read_file ();
			public static string text_strip (string t);
			public long write_file (uint8[] data = "".data);
			public string full_path { get; private set; }
		}
		[CCode (cheader_filename = "libspire_utilities.h")]
		public class FilesLinesArray : edwinspire.utils.FileFunctions {
			public Gee.ArrayList<string> Lines;
			public string default_message;
			public FilesLinesArray ();
			public void load ();
		}
		[CCode (cheader_filename = "libspire_utilities.h")]
		public class KeyValueFile : edwinspire.utils.FileFunctions {
			public string Exp;
			public Gee.HashMap<string,string> KeyValue;
			public string default_message;
			public KeyValueFile ();
			public static string HashMapToString (Gee.HashMap<string,string> hm);
			public bool get_as_bool (string key);
			public int get_as_int (string key);
			public string get_as_string (string key);
			public uint16 get_as_uint16 (string key);
			public void load ();
			public string to_string (string title = "KeyValueFile\n");
		}
	}
}
