/* libspire_gsm.vapi generated by valac 0.16.1, do not modify. */

namespace edwinspire {
	namespace GSM {
		namespace MODEM {
			[CCode (cheader_filename = "libspire_gsm.h")]
			public class Deliver : edwinspire.PDU.DELIVER, edwinspire.GSM.MODEM.iSMS {
				public Deliver ();
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public class FeaturesModem : GLib.Object {
				public string CGMI;
				public string CGMM;
				public string CGMR;
				public string CGSN;
				public string CIMI;
				public edwinspire.GSM.MODEM.Mode CMGF;
				public Gee.HashSet<edwinspire.GSM.MODEM.SMS_Status> CMGL;
				public Gee.HashSet<edwinspire.GSM.MODEM.CharSet> CSCS;
				public edwinspire.GSM.MODEM.ModemModel Model;
				public FeaturesModem ();
				public string ChecksumModel ();
				public string ToString ();
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			[Description (blurb = "Conecta y maneja modems GSM", nick = "ModemGSM para manejo de modem GSM")]
			public class ModemGSM : edwinspire.Ports.Modem {
				public edwinspire.GSM.MODEM.FeaturesModem Features;
				public ModemGSM ();
				[Description (blurb = "Obtiene la carga de la bateria", nick = "Battery Charge")]
				public edwinspire.GSM.MODEM.BatteryCharge BatteryCharge ();
				[Description (blurb = "Obtiene la carga de la bateria", nick = "CBC")]
				public edwinspire.GSM.MODEM.BatteryCharge CBC ();
				[Description (blurb = "Obtiene el manufaturador del modem ", nick = "CGMI")]
				public string CGMI ();
				[Description (blurb = "Obtiene el modelo del modem ", nick = "CGMM")]
				public string CGMM ();
				[Description (blurb = "Obtiene el numero de revision del modem ", nick = "CGMR")]
				public string CGMR ();
				[Description (blurb = "Obtiene el Product Serial Number Identification (IMEI)", nick = "CGSN")]
				public string CGSN ();
				[Description (blurb = "Finaliza una llamada en curso o rechaza una entrante", nick = "CHUP")]
				public bool CHUP ();
				[Description (blurb = "Obtiene el International Mobile Subscriber Identity", nick = "CIMI")]
				public string CIMI ();
				[Description (blurb = "Obtiene la lista de todos los comandos AT soportados por el modem", nick = "CLAC")]
				public Gee.HashSet<string> CLAC ();
				[Description (blurb = "Activa o desactiva el identificador de llamadas", nick = "CLIP")]
				public bool CLIP (bool Active);
				[Description (blurb = "Configura el mensaje de error", nick = "CMEE Set")]
				public bool CMEE_Set (edwinspire.GSM.MODEM.ExpandedErrorMessage messageerror);
				[Description (blurb = "Elimina un mensaje de texto.", nick = "CMGD")]
				public bool CMGD (uint MessageReference);
				[Description (blurb = "Obtiene el modo de mensaje", nick = "CMGF")]
				public edwinspire.GSM.MODEM.Mode CMGF ();
				[Description (blurb = "Configura el modo de formato de sms", nick = "CMGF Set")]
				public bool CMGF_Set (edwinspire.GSM.MODEM.Mode Mode_);
				[Description (blurb = "Obtiene el formato de sms soportado por el modem", nick = "CMGF Support")]
				public edwinspire.GSM.MODEM.Mode CMGF_Support ();
				[Description (blurb = "Lista de mensajes segun el estado ingresado como parametro", nick = "CMGL")]
				public Gee.ArrayList<edwinspire.GSM.MODEM.iSMS> CMGL (edwinspire.GSM.MODEM.SMS_Status Status = SMS_Status.ALL);
				[Description (blurb = "Lista de estados de sms soportado por el modem", nick = "CMGL Support")]
				public Gee.HashSet<edwinspire.GSM.MODEM.SMS_Status> CMGL_Support ();
				[Description (blurb = "Lista de mensajes segun el estado ingresado como parametro. Devuelve solo los indices", nick = "CMGL only index")]
				public Gee.HashSet<uint> CMGL_only_index (edwinspire.GSM.MODEM.SMS_Status Status);
				[Description (blurb = "Le el mensaje pasado como parametro", nick = "CMGR")]
				public edwinspire.GSM.MODEM.iSMS CMGR (uint index);
				[Description (blurb = "Envia un mensaje en formato PDU, devuelve el numero de referencia del sms", nick = "CMGS en PDU")]
				public int CMGS_PDU (int LengthPDU, string PDU);
				[Description (blurb = "Envia un mensaje en formato texto en la memoria", nick = "CMGS Modo texto")]
				public int CMGS_TXT (string Phone, string Message);
				[Description (blurb = "Escribe en memoria un mensaje en formato PDU, devuelve el numero de referencia del sms", nick = "CMGW en PDU")]
				public int CMGW_PDU (int LengthPDU, string PDU);
				[Description (blurb = "Escribe un mensaje en formato texto en la memoria", nick = "CMGW Modo texto")]
				public int CMGW_TXT (string Phone, string Message);
				[Description (blurb = "Estado de la actividad del modem", nick = "CPAS")]
				public edwinspire.GSM.MODEM.PhoneActivityStatus CPAS ();
				[Description (blurb = "Get Phone Book Memory Storage actual", nick = "CPBS  actual")]
				public edwinspire.GSM.MODEM.PBMS CPBS ();
				[Description (blurb = "Setea en PhoneBookMemoryStorage", nick = "CPBS Set")]
				public bool CPBS_Set (edwinspire.GSM.MODEM.PhoneBookMemoryStorage pbms);
				[Description (blurb = "Setea en PhoneBookMemoryStorage, ingresa como parametro texto", nick = "CPBS Set from text")]
				public bool CPBS_Set_from_text (string cs);
				[Description (blurb = "Obtiene los Phone Book Memory Storage soportados por el modem", nick = "CPBS Support")]
				public Gee.HashSet<edwinspire.GSM.MODEM.PhoneBookMemoryStorage> CPBS_Support ();
				[Description (blurb = "Obtiene CPBW soportado por el modem", nick = "CPBW Support")]
				public edwinspire.GSM.MODEM.CPBWS CPBW_Support ();
				[Description (blurb = "Obtiene el estado de registro en la red", nick = "CREG")]
				public edwinspire.GSM.MODEM.NetworkRegistration CREG ();
				[Description (blurb = "Set de caracteres actual", nick = "CSCS")]
				public edwinspire.GSM.MODEM.CharSet CSCS ();
				public bool CSCS_Set (edwinspire.GSM.MODEM.CharSet cs);
				[Description (blurb = "Configura el set de caracteres del modem, ingresa como parametro texto", nick = "CSCS Set")]
				public bool CSCS_Set_from_text (string cs);
				[Description (blurb = "Obtiene set de caracteres soportado por el modem", nick = "CSCS Support")]
				public Gee.HashSet<edwinspire.GSM.MODEM.CharSet> CSCS_Support ();
				[Description (blurb = "Obtiene la calidad de la señal", nick = "CSQ")]
				public edwinspire.GSM.MODEM.SignalQuality CSQ ();
				[Description (blurb = "Activa o desactiva el identificador de llamadas", nick = "Calling Line Identification Presentation")]
				public bool CallingLineIdentificationPresentation (bool active);
				[Description (blurb = "Obtiene set de caracteres soportado por el modem", nick = "CharSet Support")]
				public Gee.HashSet<edwinspire.GSM.MODEM.CharSet> CharSet_Support ();
				public static string ConvertTextFromModemCharSet (string text, edwinspire.GSM.MODEM.CharSet cs);
				[Description (blurb = "Elimina un mensaje de texto.", nick = "Delete Message")]
				public bool DeleteMessage (uint msg_reference);
				[Description (blurb = "Configura el mensaje de error", nick = "Set Expanded Error Message")]
				public bool ExpandedErrorMessage_Set (edwinspire.GSM.MODEM.ExpandedErrorMessage messageerror);
				[Description (blurb = "Obtiene las caracteristicas del modem, necesario para utilizar adecuadamente los comando AT especificos", nick = "Features")]
				public void GetFeatures ();
				public edwinspire.GSM.MODEM.ModemModel GetModel ();
				[Description (blurb = "Obtiene el Product Serial Number Identification (IMEI)", nick = "IMEI")]
				public string IMEI ();
				[Description (blurb = "Obtiene el International Mobile Subscriber Identity", nick = "International Mobile Subscriber Identity")]
				public string InternationalMobileSubscriberIdentity ();
				[Description (blurb = "Obtiene la lista de todos los comandos AT soportados por el modem", nick = "List All Available ATCommands")]
				public Gee.HashSet<string> ListAllAvailableATCommands ();
				[Description (blurb = "Lista de mensajes segun el estado ingresado como parametro", nick = "List Messages")]
				public Gee.ArrayList<edwinspire.GSM.MODEM.iSMS> ListMessages (edwinspire.GSM.MODEM.SMS_Status Status);
				[Description (blurb = "Lista de mensajes segun el estado ingresado como parametro. Devuelve solo los indices", nick = "List Messages Index")]
				public Gee.HashSet<uint> ListMessagesIndex (edwinspire.GSM.MODEM.SMS_Status Status);
				[Description (blurb = "Lista de estados de sms soportado por el modem", nick = "List Messages Support")]
				public Gee.HashSet<edwinspire.GSM.MODEM.SMS_Status> ListMessagesSupport ();
				[Description (blurb = "Lista de todos los mensajes", nick = "List Messages All")]
				public Gee.ArrayList<edwinspire.GSM.MODEM.iSMS> ListMessages_All ();
				[Description (blurb = "Para cambiar el modo en telefonos motorola", nick = "Motorola Mode")]
				public bool MODE (int mode);
				[Description (blurb = "Obtiene el modo de mensaje", nick = "Message Format")]
				public edwinspire.GSM.MODEM.Mode MessageFormat ();
				[Description (blurb = "Configura el modo de formato de sms", nick = "Set Message Format")]
				public bool MessageFormat_Set (edwinspire.GSM.MODEM.Mode mode);
				[Description (blurb = "Obtiene el formato de sms soportado por el modem", nick = "Message Format Support")]
				public edwinspire.GSM.MODEM.Mode MessageFormat_Support ();
				public static edwinspire.GSM.MODEM.CharSet ModemCharSetToEnum (string cset);
				[Description (blurb = "Estado de la actividad del modem", nick = "Phone Activity Status")]
				public edwinspire.GSM.MODEM.PhoneActivityStatus PhoneActivityStatus ();
				[Description (blurb = "Obtiene el Product Serial Number Identification (IMEI)", nick = "CGSN")]
				public string ProductSerialNumberIdentification ();
				[Description (blurb = "Obtiene el manufaturador del modem ", nick = "Request Manufaturer Identification")]
				public string RequestManufaturerIdentification ();
				[Description (blurb = "Obtiene el modelo del modem ", nick = "Request Model Identification")]
				public string RequestModelIdentification ();
				[Description (blurb = "Obtiene el numero de revision del modem ", nick = "Request Revision Identification")]
				public string RequestRevisionIdentification ();
				public int SMS_SEND (string phone, string Message = "", bool statusreport = false, bool enableMessageClass = false, edwinspire.PDU.DCS_MESSAGE_CLASS msgclass = edwinspire.PDU.DCS_MESSAGE_CLASS.TE_SPECIFIC);
				public Gee.ArrayList<int> SMS_SEND_ON_SLICES (string phone, string Message = "", bool statusreport = false, bool enableMessageClass = false, edwinspire.PDU.DCS_MESSAGE_CLASS msgclass = edwinspire.PDU.DCS_MESSAGE_CLASS.TE_SPECIFIC, int maxPortions = 2);
				public int SMS_SEND_PDU (string phone, string Message = "", bool statusreport = false, edwinspire.PDU.DCS_MESSAGE_CLASS msgclass = edwinspire.PDU.DCS_MESSAGE_CLASS.TE_SPECIFIC);
				public int SMS_SEND_TXT (string Phone, string Message);
				public int SMS_WRITE_PDU (string phone, string Message = "", bool statusreport = false, edwinspire.PDU.DCS_MESSAGE_CLASS msgclass = edwinspire.PDU.DCS_MESSAGE_CLASS.TE_SPECIFIC);
				[Description (blurb = "Obtiene la calidad de la señal", nick = "Signal Quality")]
				public edwinspire.GSM.MODEM.SignalQuality SignalQuality ();
				[Description (blurb = "Cadena de inicializacion del modem", nick = "StringInit")]
				public bool StringInit (string initat = "");
				[Description (blurb = "Finaliza una llamada en curso o rechaza una entrante", nick = "Terminate Call")]
				public bool TerminateCall ();
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public class Submit : edwinspire.PDU.SUBMIT, edwinspire.GSM.MODEM.iSMS {
				public Submit ();
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public interface iSMS : GLib.Object {
				public abstract edwinspire.PDU.Datetime DateTime { get; set; }
				public abstract uint Index { get; set; }
				public abstract string Phone { get; set; }
				public abstract edwinspire.GSM.MODEM.SMS_Status Status { get; set; }
				public abstract string Text { get; set; }
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			[Description (blurb = "Carga de la bateria", nick = "Battery Charge")]
			public struct BatteryCharge {
				[Description (blurb = "0 Battery is exhausted, or ME does not have a battery connected. 1...100battery has 1-100 percent of capacity remaining", nick = "Level")]
				public int Level;
				[Description (blurb = "Status de la bateria", nick = "Battery Connection Status")]
				public edwinspire.GSM.MODEM.BatteryConnectionStatus Status;
				public BatteryCharge (edwinspire.GSM.MODEM.BatteryConnectionStatus BatteryConnectionStatus, int BatteryChargeLevel);
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public struct CPBWS {
				public Gee.ArrayList<int> Index;
				public int Number;
				public Gee.ArrayList<int> Type;
				public int Text;
				public int nLength;
				public int tLength;
				public CPBWS ();
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public struct NetworkRegistration {
				public edwinspire.GSM.MODEM.NetworkRegistrationUnsolicitedResultCode UnsolicitedResultCode;
				public edwinspire.GSM.MODEM.NetworkRegistrationStatus Status;
				public NetworkRegistration ();
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public struct PBMS {
				public edwinspire.GSM.MODEM.PhoneBookMemoryStorage Storage;
				public int Used;
				public int Total;
				public PBMS ();
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public struct SignalQuality {
				public int ReceivedSignalStrengthIndication;
				public int ChannelBitErrorRate;
				public SignalQuality (int rssi = 99, int cber = 99);
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public enum BatteryConnectionStatus {
				ME_Powered_By_Battery,
				ME_Battery_Connected_But_Isnt_Powered_By_It,
				ME_Battery_Not_Connect,
				Recognized_Power_Fault
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			[Description (blurb = "Set de caracteres", nick = "Modem Charset")]
			public enum CharSet {
				[Description (blurb = "Charset desconocido", nick = "Unknow")]
				Unknown,
				[Description (blurb = "", nick = "GSM")]
				GSM,
				[Description (blurb = "", nick = "HEX")]
				HEX,
				[Description (blurb = "", nick = "IRA")]
				IRA,
				[Description (blurb = "", nick = "PCDN")]
				PCDN,
				[Description (blurb = "", nick = "ASCII")]
				ASCII,
				[Description (blurb = "", nick = "8859_1")]
				@8859_1,
				[Description (blurb = "", nick = "8859_C")]
				@8859_C,
				[Description (blurb = "", nick = "8859_A")]
				@8859_A,
				[Description (blurb = "", nick = "8859_G")]
				@8859_G,
				[Description (blurb = "", nick = "8859_H")]
				@8859_H,
				[Description (blurb = "", nick = "UCS2")]
				UCS2,
				[Description (blurb = "", nick = "UTF8")]
				UTF8;
				public string ToString ();
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			[Description (blurb = "Mensajes de error expandido", nick = "Expanded Error Message")]
			public enum ExpandedErrorMessage {
				[Description (blurb = "Suprime los mensajes", nick = "Suppresses")]
				Suppresses,
				[Description (blurb = "Numero", nick = "Number")]
				Number,
				[Description (blurb = "Texto", nick = "Text")]
				Text
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			[Description (blurb = "", nick = "Modo")]
			public enum Mode {
				[Description (blurb = "Modo PDU", nick = "PDU")]
				PDU,
				[Description (blurb = "Modo Texto", nick = "TXT")]
				TXT,
				[Description (blurb = "PDU y Texto", nick = "BOTH")]
				BOTH,
				[Description (blurb = "Desconocido", nick = "UNKNOW")]
				UNKNOWN
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			[Description (blurb = "Modelo de modem", nick = "Modem Model")]
			public enum ModemModel {
				[Description (blurb = "Unknow", nick = "Unknown")]
				Unknown,
				[Description (blurb = "General", nick = "General")]
				Generic,
				[Description (blurb = "Motorola", nick = "Motorola")]
				Motorola,
				[Description (blurb = "TV Mobile", nick = "TV Mobile")]
				TVMobile,
				[Description (blurb = "SIMCOM SIM300", nick = "SIMCOM SIM300")]
				SIMCOM_SIM300
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public enum NetworkRegistrationStatus {
				NotRegistered_NoSearchingANewOperator,
				Registered,
				NotRegistered_SearchingANewOperator,
				Denied,
				Unknown,
				RegisteredRoaming
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public enum NetworkRegistrationUnsolicitedResultCode {
				Disable,
				Enable,
				EnableWithLocationInformation,
				Unknown
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			[Description (blurb = "Actividad del modem GSM", nick = "Phone Activity Status")]
			public enum PhoneActivityStatus {
				[Description (blurb = "ME allows commands from TA/TE", nick = "Ready")]
				Ready,
				[Description (blurb = "ME does not allow commands from TA/TE", nick = "Unavailable")]
				Unavailable,
				[Description (blurb = "ME is not guaranteed to respond to instructions", nick = "Unknown")]
				Unknown,
				[Description (blurb = "ME is ready for commands from TA/TE, but the ringer is active", nick = "Ringing")]
				Ringing,
				[Description (blurb = "in progress (ME is ready for commands from TA/TE, but a call is in progress)", nick = "Call")]
				Call,
				[Description (blurb = "ME is unable to process commands from TA/TE because it is in a low functionality state", nick = "Asleep")]
				Asleep,
				[Description (blurb = "also all other values below 128 are reserved by this ETS", nick = "Reserved")]
				Reserved
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			public enum PhoneBookMemoryStorage {
				LD,
				ME,
				MT,
				SM,
				TA,
				DC,
				RC,
				MC,
				MV,
				GR,
				HP,
				BC,
				EN,
				CN,
				AP;
				public static edwinspire.GSM.MODEM.PhoneBookMemoryStorage FromString (string pbms);
				public string ToString ();
			}
			[CCode (cheader_filename = "libspire_gsm.h")]
			[Description (blurb = "Estado del mensaje de texto", nick = "SMS Status")]
			public enum SMS_Status {
				[Description (blurb = "Recibido sin leer", nick = "RECUNREAD")]
				RECUNREAD,
				[Description (blurb = "Recibido leido", nick = "RECREAD")]
				RECREAD,
				[Description (blurb = "Almacenado sin enviar", nick = "STOUNSENT")]
				STOUNSENT,
				[Description (blurb = "Almacenado enviado", nick = "STOSENT")]
				STOSENT,
				[Description (blurb = "Selecciona todos los estados", nick = "ALL")]
				ALL,
				[Description (blurb = "Desconocido", nick = "UNKNOWN")]
				UNKNOWN;
				public string ToString ();
			}
		}
	}
}
