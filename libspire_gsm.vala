
using GLib;
using edwinspire.PDU;
using Gee;
using edwinspire.Ports;

namespace edwinspire.GSM.MODEM{

[Description(nick = "Exp. Reg. para obtener respuesta a +CMGW", blurb = "Expresion regular para obtener la respuesta al guardar un sms")]
const string[] expregCMGWr = {
"\\+CMGW: (?<Id>[0-9]+)",
"""\+CMGW:[\s]+(?<Id>[0-9]+)"""
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CMGS", blurb = "Expresion regular para obtener la respuesta al enviar un sms")]
const string[] expregCMGSr = {
"\\+CMGS: (?<Id>[0-9]+)",
"""\+CMGS:[\s]+(?<Id>[0-9]+)"""
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CPAS", blurb = "Expresion regular para obtener el estado del dipsositivo")]
const string[] expregCPASr = {
"\\+CPAS: (?<pas>[0-9]+)"
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CBC", blurb = "Expresion regular para obtener en Baterry Charge Connexion")]
const string[] expregCBCr = {
"\\+CBC: (?<bcs>[0-9]+),(?<bcl>[0-9]+)",
"(?<bcs>[0-9]+),(?<bcl>[0-9]+),(?<voltaje>[0-9]+)",
"(?<bcs>[0-9]+),(?<bcl>[0-9]+)"
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CSQ", blurb = "Expresion regular para obtener en la calidad de la señal")]
const string[] expregCSQr = {
"\\+CSQ: (?<rssi>[0-9]+),(?<ber>[0-9]+)",
"\\+CSQ: (?<rssi>[0-9]+), (?<ber>[0-9]+)"
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CREG", blurb = "Expresion regular para obtener el registro en la red GSM")]
const string[] expregCREGr = {
"\\+CREG: (?<n>[0-9]),(?<stat>[0-9])",
"\\+CREG: (?<n>[0-9]), (?<stat>[0-9])"
}; 
//<lac>: string type; two byte location area code in hexadecimal format (e.g. "00C3" equals 195 in decimal)
//<ci>: string type; two byte cell ID in hexadecimal format




[Description(nick = "Exp. Reg. para obtener respuesta a +CMGF", blurb = "Para obtener CMGF actual")]
const string[] expregCSCSSupport = {
"""\+CSCS: \((?<List>[\w|"|,|-]+)\)""",
"""\+CSCS:\((?<List>[\w|"|,|-]+)\)"""
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CMGF", blurb = "Para obtener CMGF actual")]
const string[] expregCMGFr = {
"\\+CMGF: (?<Mode>[0-9])"
}; 


[Description(nick = "Exp. Reg. para obtener respuesta a +CMGF", blurb = "Para obtener CMGF actual")]
const string[] expregCMGFs = {
"\\+CMGF: \\((?<Mode>[\\w||,]+)\\)"
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CGSN", blurb = "Para obtener el CMGF soportado por el modem")]
const string[] expregCGSNr = {
"\\+CGSN: (?<IMEI>[0-9]+)",
"\\+CGSN: IMEI(?<IMEI>[0-9]+)",
"(?<IMEI>[0-9]+)"
}; 


[Description(nick = "Exp. Reg. para obtener respuesta a +CGMI", blurb = "Obtiene el manufaturador del modem")]
const string[] expregCGMIr = {
"\\+CGMI:[\\s]+\"(?<CGMI>[0-9\\w|,|.|\"|-|_| ]+)\"",
"""\+CGMI:[\s]+(?<CGMI>[0-9\w|,|.|"|-|_| ]+)""",
"(?<CGMI>[0-9\\w|,|.|\"|-|=|_| ]+)"
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CGMM", blurb = "Obtiene el Modelo del modem (Request model identification)")]
const string[] expregCGMMr = {
"\\+CGMM:[\\s]+(?<CGMM>[0-9\\w|,|.|\"|-|=|_| ]+)",
"(?<CGMM>[0-9\\w|,|.|\"|-|=|_| ]+)"
//"""\+CGMM:[\s]+(?<CGMM>[0-9\w|,|.|"|-|=|_| ]+)"""
}; 

//\+CGMR: "(?<CGMR>[0-9\w|,|.|"|-|_| ]+)"
[Description(nick = "Exp. Reg. para obtener respuesta a +CGMR", blurb = "Obtiene el numero de revision del modem")]
const string[] expregCGMRr = {
"\\+CGMR:[\\s]+\"(?<CGMR>[0-9\\w|,|.|\"|-|_| ]+)\"",
"""\+CGMR:[\s]+(?<CGMR>[0-9\w|,|.|"|-|_| ]+)""",
"(?<CGMR>[0-9\\w|,|.|\"|-|=|_| ]+)"
}; 


[Description(nick = "Exp. Reg. para obtener respuesta a +CIMI", blurb = "Para obtener el ID del Chip SIM")]
const string[] expregCIMIr = {
"\\+CIMI: (?<CIMI>[0-9]+)",
"\\+CIMI: CIMI(?<CIMI>[0-9]+)",
"\\+CIMI:(?<CIMI>[0-9]+)",
"(?<CIMI>[0-9]+)"
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CLIP", blurb = "Para obtener el numero telefonico de una llamada entrante")]
const string[] expregCLIPr = {
"\\+CLIP: (?<CLIP>[0-9]+)"
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CMGL=? en pdu", blurb = "Para obtener el CMGL soportado por el modem, lectura cuando esta en modo PDU")]
const string[] expregCMGLspdu = {
"\\+CMGL: \\((\"(?<Status1>[a-zA-Z| ]+)\")?(, \"(?<Status2>[a-zA-Z| ]+)\")?(, \"(?<Status3>[a-zA-Z| ]+)\")?(, \"(?<Status4>[a-zA-Z| ]+)\")?(, \"(?<Status5>[a-zA-Z| ]+)\")?\\)"
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CMGL=? en texto", blurb = "Para obtener el CMGL soportado por el modem, lectura cuando esta en modo Texto")]
const string[] expregCMGLstxt = {
"\\+CMGL: \\(\"(?<Status1>[0-9]+)\", \"(?<Status2>[0-9]+)\", \"(?<Status3>[0-9]+)\", \"(?<Status4>[0-9]+)\", \"(?<Status5>[0-9]+)\"\\)"
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CMGL en texto", blurb = "Para obtener la lista de mensajes cuando esta en modo Texto")]
const string[] expregCMGLtxt = {
"""\+CMGL:[\s]+(?<Index>[0-9]+),"(?<Status>[a-zA-Z| ]+)","(?<Number>[0-9|*|+]+)?"""
//"""\+CMGL:[\s]+(?<Index>[0-9]+),(?<Status>[a-zA-Z| ]+),(?<Number>[0-9|*|+]+)?\r(?<Text>[\w|\n|\r]+)"""
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CMGL en texto", blurb = "Para obtener la lista de mensajes cuando esta en modo Texto")]
const string[] expregCMGLpdu = {
"""\+CMGL:[\s]+(?<Index>[0-9]+),(?<Status>[0-9]+),(?<Alpha>[0-9]+)?(,(?<Length>[0-9]+))?\r(?<Pdu>[\w|\n|\r]+)"""
//"""\+CMGL: (?<Index>[0-9]+),(?<Status>[0-9]+),(?<Alpha>[0-9]+)?,(?<Length>[0-9]+)""",
//"""\+CMGL:  (?<Index>[0-9]+),(?<Status>[0-9]+),(?<Alpha>[0-9]+)?(,(?<Length>[0-9]+))?"""
}; 


[Description(nick = "Exp. Reg. para obtener respuesta a +CMGR en texto", blurb = "Para obtener el mensajes cuando esta en modo Texto")]
const string[] expregCMGRtxt = {
"""\+CMGR:[\s]"(?<Status>[A-Za-z| ]+)","(?<Phone>[0-9+*#]+)?","(?<Date>[0-9,:/]+)?""", // Para mensajes con status RECREAD - RECUNREAD
"""\+CMGR:[\s]"(?<Status>[A-Za-z| ]+)","(?<Phone>[0-9+*#]+)?" """ // Para mensajes con status STOSENT - STOUNSENT
}; 


[Description(nick = "Exp. Reg. para obtener respuesta a +CMGR en pdu", blurb = "Para obtener el mensajes cuando esta en modo pdu")]
const string[] expregCMGRpdu = {
"""\+CMGR:[\s]+(?<Status>[0-9]+)?(,(?<Alpha>[0-9]+)?)?(,(?<Length>[0-9]+))?\r(?<Pdu>[\w|\n|\r]+)"""
//"""\+CMGR: (?<Status>[0-9]+),(?<Alpha>[0-9]+)?,(?<Length>[0-9]+)"""
}; 


[Description(nick = "Exp. Reg. para obtener respuesta a +CSCS actual", blurb = "Obtiene el set de caracteres actual del modem")]
const string[] expregCSCS = {
"""\+CSCS: "(?<CSCS>[a-zA-Z| 0-9]+)""",
"""\+CSCS:"(?<CSCS>[a-zA-Z| 0-9]+)"""
}; 


[Description(nick = "Exp. Reg. para obtener los Phone Book Memory Storage soportados", blurb = "Para obtener CMGF actual")]
const string[] expregCPBSSupport = {
"""\+CPBS: \((?<List>[\w|"|,|-]+)\)""",
"""\+CPBS:\((?<List>[\w|"|,|-]+)\)"""
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CPBS", blurb = "Para obtener CPBS actual")]
const string[] expregCPBS = {
"\\+CPBS:[\\s]+\"(?<Storage>[A-Za-z]+)\"", //Siemens / Sony-Ericsson
"""\+CPBS:[\s]+"(?<Storage>[A-Za-z]+)",(?<Used>[0-9]+),(?<Total>[0-9]+)""" // ETSI - Siemens - Sony-Ericsson
}; 



[Description(nick = "Exp. Reg. para obtener CPBW soportados", blurb = "Para obtener CPBW actual")]
const string[] expregCPBWSupport = {
"""\+CPBW:[\\s]\((?<List>[0-9|,|-]+)\),(?<nLength>[0-9]+),\(?<ListType>[0-9|,]\),(?<tLength>[0-9]+)""" // ETSI - Siemens - Sony-Ericsson
}; 


[Description(nick = "Exp. Reg. para obtener Read Phone Book Entry soportados", blurb = "Read Phone Book Entry soportado")]
const string[] expregCPBRSupport = {
"""\+CPBR:[\s]\((?<from>[0-9]+)-(?<to[0-9]+>)\),(?<nLength>[0-9]+),(?<tLength>[0-9]+)"""
}; 

[Description(nick = "Exp. Reg. para obtener respuesta a +CPBR", blurb = "Read Phone Book Entry")]
const string[] expregCPBR = {
"\\+CPBR:[\\s]+(?<Index>[0-9]+),\"(?<Number>[0-9]+)\",(?<Type>[0-9]+),\"(?<Name>[\\w|*|\\-|_|@|0-9]+)\"", //Siemens / Sony-Ericsson
"\\+CPBR:[\\s]+(?<Index>[0-9]+),\"(?<Number>[0-9]+)\",(?<Type>[0-9]+),(?<Name>[0-9|\\w]+)"
};

[Description(nick = "Exp. Reg. para obtener respuesta a +CPBF", blurb = "Read Phone Book Entry")]
const string[] expregCPBF = {
"\\+CPBF:[\\s]+(?<Index>[0-9]+),\"(?<Number>[0-9]+)\",(?<Type>[0-9]+),\"(?<Name>[\\w|*|\\-|_|@|0-9]+)\"", //Siemens / Sony-Ericsson
"\\+CPBF:[\\s]+(?<Index>[0-9]+),\"(?<Number>[0-9]+)\",(?<Type>[0-9]+),(?<Name>[0-9|\\w]+)"
};  


public class TextUtils:TextConvert{

public static string EncodetoCharSet(string text, CharSet cs){
string Retorno = text;
switch(cs){

case CharSet.UCS2:
Retorno = ConvertASCIIToUCS2(text);
break;
default:
Retorno = text;
break;
}

return Retorno;
}

public static string DecodeFromCharSet(string text, CharSet cs){

string Retorno = "";
switch(cs){
case CharSet.UCS2:
//stdout.printf("UCS2 => %s\n", text);
Retorno = ConvertUCS2ToASCII(text);
break;

default:
Retorno = text;
break;
}

return Retorno;

}


}

public struct CPBRS{

public int from;
public int to;
public int nLength;
public int tLength;

public CPBRS(){
this.from = 0;
this.to = 0;
this.nLength = 0;
this.tLength = 0;

}

}

public struct PhoneBook_Entry{

public int Index;
public string Number;
public int Type;
public string Name;

public PhoneBook_Entry(){
this.Index = 0;
this.Number = "";
this.Type = 0;
this.Name = "";

}

}




[Description(nick = "Phone Activity Status", blurb = "Actividad del modem GSM")]
public enum PhoneActivityStatus{
[Description(nick = "Ready", blurb = "ME allows commands from TA/TE")]
Ready = 0, 
[Description(nick = "Unavailable", blurb = "ME does not allow commands from TA/TE")]
Unavailable = 1, 
[Description(nick = "Unknown", blurb = "ME is not guaranteed to respond to instructions")]
Unknown = 2, 
[Description(nick = "Ringing", blurb = "ME is ready for commands from TA/TE, but the ringer is active")]
Ringing = 3, 
[Description(nick = "Call", blurb = "in progress (ME is ready for commands from TA/TE, but a call is in progress)")]
Call = 4, 
[Description(nick = "Asleep", blurb = "ME is unable to process commands from TA/TE because it is in a low functionality state")]
Asleep = 5, 
[Description(nick = "Reserved", blurb = "also all other values below 128 are reserved by this ETS")]
Reserved
}


[Description(nick = "Expanded Error Message", blurb = "Mensajes de error expandido")]
public enum ExpandedErrorMessage{
[Description(nick = "Suppresses", blurb = "Suprime los mensajes")]
Suppresses = 0,
[Description(nick = "Number", blurb = "Numero")]
Number = 1,
[Description(nick = "Text", blurb = "Texto")]
Text = 2
}

[Description(nick = "Modem Model", blurb = "Modelo de modem")]
public enum ModemModel{
[Description(nick = "Unknown", blurb = "Unknow")]
Unknown,
[Description(nick = "General", blurb = "General")]
Generic,
[Description(nick = "Motorola", blurb = "Motorola")]
Motorola,
[Description(nick = "TV Mobile", blurb = "TV Mobile")]
TVMobile,
[Description(nick = "SIMCOM SIM300", blurb = "SIMCOM SIM300")]
SIMCOM_SIM300
}


public enum PhoneBookMemoryStorage{
LD,// SIM last-dialling-phonebook
ME,// ME phonebook
MT,// Combined ME and SIM phonebook. 
SM,// SIM phonebook
TA,// TA phonebook
DC,// ME dialled calls list
RC,// ME received calls list
MC,// ME missed calls list
MV,// ME voice activated dialling list
GR,// Group list. Ericsson specific, not supported
HP,// Hierarchical phonebook. Ericsson specific
BC,// Own business card. Protected by phone lock code.
//Ericsson specific
//SM SIM/UICC phonebook. If a SIM card is present or if
//a UICC with an active GSM application is present,
//the EFADN under DFTelecom is selected. If a UICC
//with an active USIM application is present, the global
//phonebook, DFPHONEBOOK under DFTelecom is
//selected.
EN,// Emergency number. Not supported
CN,// SIM (or ME) own numbers (MSISDNs) list (reading
//of this storage may be available through +CNUM
//also). When storing information in the SIM/UICC, if
//a SIM card is present or if a UICC with an active
//GSM application is present, the information in
//EFMSISDN under DFTelecom is selected. If a UICC
//with an active USIM application is present, the
//information in EFMSISDN under ADFUSIM is selected.

AP; //Selected application phonebook. If a UICC with an
//active USIM application is present, the application
//phonebook, DFPHONEBOOK under ADFUSIM is
//selected.
public static PhoneBookMemoryStorage FromString(string pbms){
PhoneBookMemoryStorage Retorno = PhoneBookMemoryStorage.MT;
switch(pbms){
case "LD":
Retorno = PhoneBookMemoryStorage.LD;
break;
case "ME":
Retorno = PhoneBookMemoryStorage.ME;
break;
case "SM":
Retorno = PhoneBookMemoryStorage.SM;
break;
case "TA":
Retorno = PhoneBookMemoryStorage.TA;
break;
case "DC":
Retorno = PhoneBookMemoryStorage.DC;
break;
case "RC":
Retorno = PhoneBookMemoryStorage.RC;
break;
case "MC":
Retorno = PhoneBookMemoryStorage.MC;
break;
case "MV":
Retorno = PhoneBookMemoryStorage.MV;
break;
case "GR":
Retorno = PhoneBookMemoryStorage.GR;
break;
case "HP":
Retorno = PhoneBookMemoryStorage.HP;
break;
case "BC":
Retorno = PhoneBookMemoryStorage.BC;
break;
case "EN":
Retorno = PhoneBookMemoryStorage.EN;
break;
case "CN":
Retorno = PhoneBookMemoryStorage.CN;
break;
case "AP":
Retorno = PhoneBookMemoryStorage.AP;
break;
default:
Retorno = PhoneBookMemoryStorage.MT;
break;
}

return Retorno;
}

public string ToString(){
string Retorno = "";
switch(this){
case PhoneBookMemoryStorage.LD:
Retorno = "LD";
break;
case PhoneBookMemoryStorage.ME:
Retorno = "ME";
break;
case PhoneBookMemoryStorage.MT:
Retorno = "MT";
break;
case PhoneBookMemoryStorage.SM:
Retorno = "SM";
break;
case PhoneBookMemoryStorage.TA:
Retorno = "TA";
break;
case PhoneBookMemoryStorage.DC:
Retorno = "DC";
break;
case PhoneBookMemoryStorage.RC:
Retorno = "RC";
break;
case PhoneBookMemoryStorage.MC:
Retorno = "MC";
break;
case PhoneBookMemoryStorage.MV:
Retorno = "MV";
break;
case PhoneBookMemoryStorage.GR:
Retorno = "GR";
break;
case PhoneBookMemoryStorage.HP:
Retorno = "HP";
break;
case PhoneBookMemoryStorage.BC:
Retorno = "BC";
break;
case PhoneBookMemoryStorage.EN:
Retorno = "EN";
break;
case PhoneBookMemoryStorage.CN:
Retorno = "CN";
break;
case PhoneBookMemoryStorage.AP:
Retorno = "AP";
break;
}
return Retorno;
}

}

public struct PBMS{
public PhoneBookMemoryStorage Storage;
public int Used;
public int Total;

public PBMS(){
this.Storage = PhoneBookMemoryStorage.MT;
this.Used = 0;
this.Total = 0;
}

}

public struct CPBWS{
public ArrayList<int>Index;
public int Number;
public ArrayList<int> Type;
public int Text;
public int nLength;
public int tLength;

public CPBWS(){
this.Index = new ArrayList<int>();
this.Number = 0;
this.Type = new ArrayList<int>();
this.Text = 0;
this.nLength = 0;
this.tLength = 0;

}

}

public interface iSMS:GLib.Object{

public abstract string Phone{get; set;}
public abstract string Text{get; set;}
public abstract uint Index{get; set; default = 0;}
public abstract SMS_Status Status{get; set; default = SMS_Status.UNKNOWN;}
public abstract Datetime DateTime{set; get;}

}

public class Submit:SUBMIT, iSMS{

public uint Index{get; set; default = 0;}
public SMS_Status Status{get; set; default = SMS_Status.UNKNOWN;}
private Datetime dti = new Datetime.from_values(1990, 1, 1); 
//public edwinspire.PDU.DCS_MESSAGE_CLASS MessageClass{get; set; default = edwinspire.PDU.DCS_MESSAGE_CLASS.TE_SPECIFIC;}
//public bool enableMessageClass{get; set; default = false;}
//public bool StatusReport{get; set; default = false;}

public Datetime DateTime{
set{
dti = value;
} get{
return dti;
}
}

public string Phone{
get{
return this.PHONE.TXT;
}
set{
this.PHONE.TXT = value;
}
}

public string Text{
get{
return this.Message.TXT;
}
set{
//print("Setea text = %s\n", value);
this.Message.TXT = value;
}
}

}

public class Deliver:DELIVER, iSMS{

public uint Index{get; set; default = 0;}
public SMS_Status Status{get; set; default = SMS_Status.UNKNOWN;}

public Datetime DateTime{
set{
this.SCTS.set_values(value.year, value.month, value.day_of_month, value.hour, value.minute, value.seconds, value.Gmt);
}
get{
return (Datetime)this.SCTS;
}

}


public string Phone{
get{
return this.Sender.TXT;
}
set{
this.Sender.TXT = value;
}
}

public string Text{
get{
return this.Message;
}
set{
this.Message = value;
}
}

}


[Description(nick = "Modem Charset", blurb = "Set de caracteres")]
public enum CharSet{
[Description(nick = "Unknow", blurb = "Charset desconocido")]
Unknown,
[Description(nick = "GSM", blurb = "")]
GSM,
[Description(nick = "HEX", blurb = "")]
HEX,
[Description(nick = "IRA", blurb = "")]
IRA,
[Description(nick = "PCDN", blurb = "")]
PCDN,
[Description(nick = "ASCII", blurb = "")]
ASCII,
[Description(nick = "8859_1", blurb = "")]
@8859_1,
[Description(nick = "8859_C", blurb = "")]
@8859_C,
[Description(nick = "8859_A", blurb = "")]
@8859_A,
[Description(nick = "8859_G", blurb = "")]
@8859_G,
[Description(nick = "8859_H", blurb = "")]
@8859_H,
[Description(nick = "UCS2", blurb = "")]
UCS2,
[Description(nick = "UTF8", blurb = "")]
UTF8;


public static CharSet FromString(string cset){

var Retorno = CharSet.Unknown;

switch(cset){
						case "GSM":
							  Retorno = CharSet.GSM;
							break;
						case "HEX":
							  Retorno = CharSet.HEX;
							break;
						case "IRA":
							  Retorno = CharSet.IRA;
							break;
						case "PCDN":
							  Retorno = CharSet.PCDN;
							break;
						case "ASCII":
							  Retorno = CharSet.ASCII;
							break;

						case "8859-1":
							  Retorno = CharSet.8859_1;
							break;

						case "8859-C":
							  Retorno = CharSet.8859_C;
							break;

						case "8859-A":
							  Retorno = CharSet.8859_A;
							break;

						case "8859-G":
							  Retorno = CharSet.8859_G;
							break;
						case "8859-H":
							  Retorno = CharSet.8859_H;
							break;

						case "UTF8":
							  Retorno = CharSet.UTF8;
							break;

						case "UCS2":
							  Retorno = CharSet.UCS2;
							break;

						default:
							  Retorno = CharSet.Unknown;
							break;

						}

return Retorno;
}

public string ToString(){
var Retorno = new StringBuilder();

switch(this){
						case CharSet.GSM:
							  Retorno.append("GSM");
							break;
						case CharSet.HEX:
							   Retorno.append("HEX");
							break;
						case CharSet.IRA:
							   Retorno.append("IRA");
							break;
						case CharSet.PCDN:
							  Retorno.append("PCDN");
							break;
						case CharSet.ASCII:
							   Retorno.append("ASCII");
							break;

						case CharSet.8859_1:
							  Retorno.append("8859-1");
							break;

						case CharSet.8859_C:
							  Retorno.append("8859-C");
							break;

						case CharSet.8859_A:
							  Retorno.append("8859-A");
							break;

						case CharSet.8859_G:
							  Retorno.append("8859-G");
							break;
						case CharSet.8859_H:
							 Retorno.append("8859-H");
							break;

						case CharSet.UTF8:
							  Retorno.append("UTF8");
							break;

						case CharSet.UCS2:
							   Retorno.append("UCS2");
							break;

						default:
							   Retorno.append("ASCII");
							break;

						}
//Retorno.append("\"");
return Retorno.str;
}

}

[Description(nick = "Battery Charge", blurb = "Carga de la bateria")]
public struct BatteryCharge {

[Description(nick = "Level", blurb = "0 Battery is exhausted, or ME does not have a battery connected. 1...100battery has 1-100 percent of capacity remaining")]
public int Level;
		
[Description(nick = "Battery Connection Status", blurb = "Status de la bateria")]
		public BatteryConnectionStatus Status;
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="BatteryConnectionStatus">
		/// A <see cref="BatteryConnectionStatus"/>
		/// Estado de la conexion de la bateria
		/// 0 Battery is exhausted, or ME does not have a battery connected
		/// 1...100battery has 1-100 percent of capacity remaining
		/// </param>
		/// <param name="BatteryChargeLevel">
		/// Carga de la bateria en %
		/// A <see cref="System.Int32"/>
		/// </param>
public BatteryCharge(BatteryConnectionStatus BatteryConnectionStatus, int BatteryChargeLevel){

  this.Status = BatteryConnectionStatus;
  this.Level = BatteryChargeLevel;
  //this.ResultModem = ResultModem;
		}
	}

	/// <summary>
	/// Modo
	/// </summary>
[Description(nick = "Modo", blurb = "")]
public enum Mode{
		/// <summary>
		/// PDU
		/// </summary>
[Description(nick = "PDU", blurb = "Modo PDU")]
		PDU,
		/// <summary>
		/// Texto
		/// </summary>
[Description(nick = "TXT", blurb = "Modo Texto")]
		TXT,
		/// <summary>
		/// PDU y Texto
		/// </summary>
[Description(nick = "BOTH", blurb = "PDU y Texto")]
		BOTH,
		/// <summary>
		/// Desconocido
		/// </summary>
[Description(nick = "UNKNOW", blurb = "Desconocido")]
		UNKNOWN
	}
	/// <summary>
	/// Estado del SMS
	/// </summary>
[Description(nick = "SMS Status", blurb = "Estado del mensaje de texto")]
		public enum SMS_Status {
		/// <summary>
		/// Recibido sin leer
		/// </summary>
[Description(nick = "RECUNREAD", blurb = "Recibido sin leer")]
		RECUNREAD,
		/// <summary>
		/// Recibido y leido
		/// </summary>
[Description(nick = "RECREAD", blurb = "Recibido leido")]
	RECREAD,
		/// <summary>
		/// Almacenado sin enviar
		/// </summary>
[Description(nick = "STOUNSENT", blurb = "Almacenado sin enviar")]
STOUNSENT,
		/// <summary>
		/// Almacenado y enviado
		/// </summary>
[Description(nick = "STOSENT", blurb = "Almacenado enviado")]
STOSENT,
		/// <summary>
		/// Todos
		/// </summary>
[Description(nick = "ALL", blurb = "Selecciona todos los estados")]
ALL,
		/// <summary>
		/// Desconocido
		/// </summary>
[Description(nick = "UNKNOWN", blurb = "Desconocido")]
UNKNOWN;

public string ToString(){
var Retorno = "";
	switch(this){
case SMS_Status.RECUNREAD:
	Retorno = "REC UNREAD";
break;
case SMS_Status.RECREAD:
	Retorno = "REC READ";
break;
case SMS_Status.STOUNSENT:
	Retorno = "STO UNSENT";
			break;
case SMS_Status.STOSENT:
	Retorno = "STO SENT";
break;
case SMS_Status.ALL:
	Retorno = "ALL";
break;
default:
	Retorno = "UNKNOWN";
break;
}
return Retorno;
}

	}



public struct SignalQuality{
public int ReceivedSignalStrengthIndication;
public int ChannelBitErrorRate;
public SignalQuality(int rssi = 99, int cber = 99){
this.ReceivedSignalStrengthIndication = rssi;
this.ChannelBitErrorRate = cber;
}
}


public enum NetworkRegistrationUnsolicitedResultCode{
Disable = 0,
Enable = 1,
EnableWithLocationInformation = 2,
Unknown = 99
}

public enum NetworkRegistrationStatus{
NotRegistered_NoSearchingANewOperator = 0, // not registered, ME is not currently searching a new operator to register to
Registered = 1, // registered, home network
NotRegistered_SearchingANewOperator = 2, // not registered, but ME is currently searching a new operator to register to
Denied = 3, // registration denied
Unknown = 4, // unknown
RegisteredRoaming = 5 // registered, roaming
}

public struct NetworkRegistration{
public NetworkRegistrationUnsolicitedResultCode UnsolicitedResultCode;
public NetworkRegistrationStatus Status; 
public NetworkRegistration(){
UnsolicitedResultCode = NetworkRegistrationUnsolicitedResultCode.Unknown;
Status = NetworkRegistrationStatus.Unknown;
}

}

	/// <summary>
	/// Estado de la conexion de la bateria
	/// </summary>
			public enum BatteryConnectionStatus{
		/// <summary>
		/// ME is powered by the battery
		/// </summary>
	ME_Powered_By_Battery,
		/// <summary>
		/// ME has a battery connected, but is not powered by it
		/// </summary>
	ME_Battery_Connected_But_Isnt_Powered_By_It,
		/// <summary>
		/// ME does not have a battery connected
		/// </summary>
    ME_Battery_Not_Connect,
		/// <summary>
		/// Recognized power fault, calls inhibited
		/// </summary>
			Recognized_Power_Fault,
			}
/*
// Modelo de Modem detectado
public enum ModemModel{
NoGSM,
Generic,
Motorola_L6i
}
*/

public class FeaturesModem:GLib.Object{

public HashSet<CharSet> CSCS = new HashSet<CharSet>();
public Mode CMGF = Mode.UNKNOWN;
public string CIMI = "0000000000";
public string CGSN = "0123456789";

public string CGMI = "unknown";
public string CGMR = "unknown";
public string CGMM = "unknown";

public HashSet<SMS_Status> CMGL = new HashSet<SMS_Status>();
public ModemModel Model  = ModemModel.Unknown;


public FeaturesModem(){

}

public string ChecksumModel(){
var Cadena = new StringBuilder();
Cadena.append(this.CGMI);
Cadena.append(this.CGMR);
Cadena.append(this.CGMM);
return Checksum.compute_for_string (ChecksumType.MD5, Cadena.str);
}

public string ToString(){

var Cadena = new StringBuilder();
Cadena.append_printf("Modem model: %s\n", Model.to_string());
Cadena.append("CSCS Support:\n");
foreach(var c in this.CSCS){
Cadena.append_printf("%s\n", c.to_string());
}

Cadena.append("CMGL Support:\n");
foreach(var cm in this.CMGL){
Cadena.append_printf("%s\n", cm.to_string());
}
Cadena.append_printf("CMGF Support: %s\n", this.CMGF.to_string());
Cadena.append_printf("CIMI: %s\n", this.CIMI);
Cadena.append_printf("CGSN / IMEI: %s\n", this.CGSN);

return Cadena.str;
}

}


	/// <summary>
	/// Clase para comunicacion con Modems GSM
	/// </summary>
[Description(nick = "ModemGSM para manejo de modem GSM", blurb = "Conecta y maneja modems GSM")]
	public class ModemGSM:Modem{

//private ModemModel ModeloModem  = ModemModel.Unknow;
//private Mode ModeModem  = Mode.UNKNOW;
//private HashSet<CharSet> CSCSSoporte = new  HashSet<CharSet>();
public FeaturesModem Features = new FeaturesModem(); 
		public ModemGSM ()
		{
//			ModelDetect();
		}


[Description(nick = "Features", blurb = "Obtiene las caracteristicas del modem, necesario para utilizar adecuadamente los comando AT especificos")]
public void GetFeatures(){
Features.CMGF = this.CMGF_Support();
Features.CSCS = this.CSCS_Support();
Features.CMGL = this.CMGL_Support();
Features.CIMI = this.CIMI();
Features.CGSN = this.CGSN();
Features.CGMM = this.CGMM();
Features.CGMI = this.CGMI();
Features.CGMR = this.CGMR();

}

// TODO Tomar en cuenta que cuando se envia un sms flash un mensaje se sobrepone a otro lo que hara es mostrarse unicamente el ultimo mensaje.
public ArrayList<int> SMS_SEND_ON_SLICES(string phone, string Message = "", bool statusreport = false, bool enableMessageClass = false, edwinspire.PDU.DCS_MESSAGE_CLASS msgclass =  edwinspire.PDU.DCS_MESSAGE_CLASS.TE_SPECIFIC, int maxPortions = 2){
var Retorno = new ArrayList<int>();
var ParteMsg = new StringBuilder();

if(phone.length>1){

// dividimos el mensaje en palabras
var palabras = Message.split(" ");
foreach(var p in palabras){

if(ParteMsg.len == 160 || (ParteMsg.len + p.length)>160){
// enviamos el sms
Retorno.add(SMS_SEND(phone, ParteMsg.str, statusreport, enableMessageClass, msgclass));
ParteMsg.truncate(0);
ParteMsg.append_printf("%s ", p);

}else{
ParteMsg.append_printf("%s ", p);
}

if(Retorno.size == maxPortions){
break;
}

}

if(ParteMsg.len>0){
Retorno.add(SMS_SEND(phone, ParteMsg.str, statusreport, enableMessageClass, msgclass));
}

}else{
warning("El numero telefonico no puede ser una cadena vacia\n");
}

return Retorno;
}

public int SMS_SEND(string phone, string Message = "",  bool statusreport = false, bool enableMessageClass = false, edwinspire.PDU.DCS_MESSAGE_CLASS msgclass =  edwinspire.PDU.DCS_MESSAGE_CLASS.TE_SPECIFIC){
int Retorno = 0;
int intentos = 0;

if(phone.length>1){
while(this.Features.CMGF == Mode.UNKNOWN && intentos<2){
this.Features.CMGF == this.CMGF_Support();
intentos++;
}

if(enableMessageClass || statusreport){
// Obligatoriamente debemos usar modo PDU.
Retorno = SMS_SEND_PDU(phone, Message, statusreport, msgclass);

}else{
// Si el modem soporta modo PDU es preferible usarlo ya que PDU es el standar, sinembargo usando modo text se tiene menor carga de procesamiento.
switch(this.Features.CMGF){
case Mode.TXT:
Retorno = SMS_SEND_TXT(phone, Message);
break;
case Mode.BOTH:
Retorno = SMS_SEND_PDU(phone, Message, statusreport, msgclass);
break;
default:
Retorno = SMS_SEND_PDU(phone, Message, statusreport, msgclass);
break;
}
}
}else{
warning("El numero telefonico no puede ser una cadena vacia\n");
}

return Retorno;
}


public int SMS_SEND_PDU(string phone, string Message = "", bool statusreport = false, edwinspire.PDU.DCS_MESSAGE_CLASS msgclass =  edwinspire.PDU.DCS_MESSAGE_CLASS.TE_SPECIFIC){
// El tamaño maximo de un sms es de 160 caracteres
string message = Message;
int Retorno = 0;
if(phone.length>1){
if(Message.length>160){
message = Message.substring(0, 160);
}
var MensajePDUFormat = new SUBMITwithDCSGeneralDataCodingIndication(phone, message, statusreport, msgclass);
//MensajePDUFormat.print_values();

Retorno = this.CMGS_PDU(MensajePDUFormat.length, MensajePDUFormat.ENCODE());
}else{
warning("El numero telefonico no puede ser una cadena vacia\n");
}
return Retorno;
}

public int SMS_WRITE_PDU(string phone, string Message = "", bool statusreport = false, edwinspire.PDU.DCS_MESSAGE_CLASS msgclass =  edwinspire.PDU.DCS_MESSAGE_CLASS.TE_SPECIFIC){
// El tamaño maximo de un sms es de 160 caracteres
string message = Message;
int Retorno = 0;
if(phone.length>1){
if(Message.length>160){
message = Message.substring(0, 160);
}
var MensajePDUFormat = new SUBMITwithDCSGeneralDataCodingIndication(phone, message, statusreport, msgclass);
Retorno = this.CMGW_PDU(MensajePDUFormat.length, MensajePDUFormat.ENCODE());
}else{
warning("El numero telefonico no puede ser una cadena vacia\n");
}
return Retorno;
}


[Description(nick = "CMGW en PDU", blurb = "Escribe en memoria un mensaje en formato PDU, devuelve el numero de referencia del sms")]
public int CMGW_PDU(int LengthPDU, string PDU){
			return CMG_WS_PDU(true, LengthPDU, PDU);
		}

[Description(nick = "CMGS en PDU", blurb = "Envia un mensaje en formato PDU, devuelve el numero de referencia del sms")]
public int CMGS_PDU(int LengthPDU, string PDU){
			return CMG_WS_PDU(false, LengthPDU, PDU);
		}


private int CMG_WS_PDU(bool W, int LengthPDU, string PDU){

			int Retorno = 0;
			Response Respuesta =  new Response();
			StringBuilder ComandoAT = new StringBuilder();

if(LengthPDU>0 || PDU.length>0){

			if(this.CMGF_Set(Mode.PDU)){
if(W){
	ComandoAT.append("AT+CMGW=");
			}else{
			ComandoAT.append("AT+CMGS=");
			}

			ComandoAT.append(LengthPDU.to_string());
			ComandoAT.append("\r");
			ComandoAT.append(PDU);
			ComandoAT.append("\x1A");

 		this.DiscardBuffer();

			this.Send(ComandoAT.str);

			if(W){
//--------------------------------
// Escribe en memoria
			 Respuesta = this.Receive(1000);
		foreach(string Expresion in expregCMGWr){
			try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
Retorno = int.parse(match.fetch_named("Id"));
break;
}
			}
if(Retorno>0){
	break;
	}
	}
catch (RegexError err) {
                warning (err.message);
		}
		}
			}else{

//---------------------------
// Envia el sms
 Respuesta = this.Receive(20000);
		foreach(string Expresion in expregCMGSr){
			try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
Retorno = int.parse(match.fetch_named("Id"));
break;
}
			}
if(Retorno>0){
	break;
	}
	}
catch (RegexError err) {
                warning (err.message);
		}
		}
			}


		}
}else{
warning("Los datos PDU no pueden ser nulos\n");
}
			return Retorno;
		}


[Description(nick = "Message Format Support", blurb = "Obtiene el formato de sms soportado por el modem")]
public Mode MessageFormat_Support(){
return this.CMGF_Support();
}

/// <summary>
/// Obtiene el Modo o modos soportados por el Modem GSM
/// </summary>
/// <returns>
/// A <see cref="Mode"/>
/// </returns>
[Description(nick = "CMGF Support", blurb = "Obtiene el formato de sms soportado por el modem")]
public Mode CMGF_Support(){

			Mode Retorno = Mode.UNKNOWN;
		//	bool Finalizar = false;
			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CMGF=?\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCMGFs){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
//string Modo = match.fetch_named("Mode");
switch(match.fetch_named("Mode")){
						case "0":
							  Retorno = Mode.PDU;
							break;
						case "1":
						Retorno = Mode.TXT;
							break;
						case "1,0":
							 Retorno = Mode.BOTH;
							break;
						case "0,1":
						Retorno = Mode.BOTH;
							break;
						case "0-1":
						Retorno = Mode.BOTH;
							break;
						case "1-0":
						Retorno = Mode.BOTH;
							break;
						default:
							Retorno = Mode.PDU;
							break;

						}

break;
}
			}
if(Retorno!=Mode.UNKNOWN){
					break;
				}
			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}


[Description(nick = "CharSet Support", blurb = "Obtiene set de caracteres soportado por el modem")]
public HashSet<CharSet> CharSet_Support(){
return CSCS_Support();
}

[Description(nick = "CPBW simple", blurb = "Escribe los datos de un contacto, selecciona automaticamente el tipo de numero")]
public bool CPBW_simple(int index, string number, string name){

int type = 145;
if(number.has_prefix("+")){
type = 129;
}

return CPBW(index, number, type, name);
}

[Description(nick = "CPBW", blurb = "Ingresa un contacto en la agenda")]
public bool CPBW(int index, string number, int type, string name){

		StringBuilder ComandoAT = new StringBuilder("AT+CPBW=");

if(index>0){
ComandoAT.append_printf("%i,", index);
}else{
ComandoAT.append(",");
}

			ComandoAT.append_printf("\"%s\",", number);
			ComandoAT.append_printf("%i,", type);
			ComandoAT.append_printf("\"%s\"", name);
			ComandoAT.append("\r");

			return this.SendSimpleCommand(ComandoAT.str);
		}

[Description(nick = "CPBW Support", blurb = "Obtiene CPBW soportado por el modem")]
public CPBWS CPBW_Support(){

			CPBWS Retorno = CPBWS();
			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CPBW=?\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCPBWSupport){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

foreach(var l in match.fetch_named("List").split(",")){
Retorno.Index.add(int.parse(l));
}

Retorno.Number = int.parse(match.fetch_named("Number"));

foreach(var t in match.fetch_named("ListType").split(",")){
Retorno.Type.add(int.parse(t));
}

Retorno.Text = int.parse(match.fetch_named("Text"));
Retorno.nLength = int.parse(match.fetch_named("nLength"));
Retorno.tLength = int.parse(match.fetch_named("tLength"));

break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}



[Description(nick = "CPBR Support", blurb = "Obtiene CPBR soportado por el modem")]
public CPBRS CPBR_Support(){

			CPBRS Retorno = CPBRS();
			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CPBR=?\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCPBRSupport){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){


Retorno.from = int.parse(match.fetch_named("from"));
Retorno.to = int.parse(match.fetch_named("to"));
Retorno.nLength = int.parse(match.fetch_named("nLength"));
Retorno.tLength = int.parse(match.fetch_named("tLength"));

break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}



[Description(nick = "CPBR ", blurb = "Obtiene un contacto del directorio")]
public PhoneBook_Entry CPBR( int index){

			PhoneBook_Entry Retorno = PhoneBook_Entry();
var charset_ = this.CSCS();

			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CPBR="+index.to_string()+"\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCPBR){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){


Retorno.Index = int.parse(match.fetch_named("Index"));
Retorno.Number = match.fetch_named("Number");
Retorno.Type = int.parse(match.fetch_named("Type"));
Retorno.Name = TextUtils.DecodeFromCharSet(match.fetch_named("Name"), charset_);

break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}



[Description(nick = "CPBF ", blurb = "Obtiene un contacto del directorio")]
public ArrayList<PhoneBook_Entry?> CPBF(string name){

		ArrayList<PhoneBook_Entry?> Retorno = new ArrayList<PhoneBook_Entry?>();

var modemcharset = this.CSCS();

string name_ = TextUtils.EncodetoCharSet(name, modemcharset);

			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CPBF=\""+name_+"\"\r");

Response Respuesta = this.Receive(5000);

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCPBF){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

PhoneBook_Entry pbe = PhoneBook_Entry();

pbe.Index = int.parse(match.fetch_named("Index"));
pbe.Number = match.fetch_named("Number");
pbe.Type = int.parse(match.fetch_named("Type"));
pbe.Name =    TextUtils.DecodeFromCharSet(match.fetch_named("Name"), modemcharset); 

Retorno.add(pbe);

}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}

[Description(nick = "CSCS Support", blurb = "Obtiene set de caracteres soportado por el modem")]
public HashSet<CharSet> CSCS_Support(){

			HashSet<CharSet> Retorno = new HashSet<CharSet>();
		//	bool Finalizar = false;
			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CSCS=?\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCSCSSupport){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
var listastring = (match.fetch_named("List").replace("\"", "")).split(",");
foreach(var l in listastring){
Retorno.add(CharSet.FromString(l));
}

break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}


[Description(nick = "CPBS Set from text", blurb = "Setea en PhoneBookMemoryStorage, ingresa como parametro texto")]
public bool CPBS_Set_from_text(string pbms){

			StringBuilder ComandoAT = new StringBuilder("AT+CPBS=\"");
			ComandoAT.append(pbms);
			ComandoAT.append("\"\r");

			return this.SendSimpleCommand(ComandoAT.str);
		}

[Description(nick = "CPBS Set", blurb = "Setea en PhoneBookMemoryStorage")]
public bool CPBS_Set(PhoneBookMemoryStorage pbms){
return CPBS_Set_from_text(pbms.ToString());
}


[Description(nick = "CPBS  actual", blurb = "Get Phone Book Memory Storage actual")]
public PBMS CPBS(){

			PBMS Retorno = PBMS();
		//	bool Finalizar = false;
			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CPBS?\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCPBS){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
//print("linea %s\n", Linea);
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

Retorno.Storage = PhoneBookMemoryStorage.FromString(match.fetch_named("Storage"));
Retorno.Used = int.parse(match.fetch_named("Used"));
Retorno.Total = int.parse(match.fetch_named("Total"));
//print (Retorno.to_string());

break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}



[Description(nick = "CPBS Support", blurb = "Obtiene los Phone Book Memory Storage soportados por el modem")]
public HashSet<PhoneBookMemoryStorage> CPBS_Support(){

			HashSet<PhoneBookMemoryStorage> Retorno = new HashSet<PhoneBookMemoryStorage>();
		//	bool Finalizar = false;
			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CPBS=?\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCPBSSupport){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
var listastring = (match.fetch_named("List").replace("\"", "")).split(",");
foreach(var l in listastring){
Retorno.add(PhoneBookMemoryStorage.FromString(l));
}

break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}

[Description(nick = "Phone Activity Status", blurb = "Estado de la actividad del modem")]
public PhoneActivityStatus PhoneActivityStatus(){
return this.CPAS();
}


[Description(nick = "CPAS", blurb = "Estado de la actividad del modem")]
public PhoneActivityStatus CPAS(){

			var Retorno = edwinspire.GSM.MODEM.PhoneActivityStatus.Unknown;
		//	bool Finalizar = false;
			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CPAS\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCPASr){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
//print("linea %s\n", Linea);
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
//print("Match CPAS\n");
Retorno = (PhoneActivityStatus)(int.parse(match.fetch_named("pas")));

break;
}
			}
if(Retorno!=edwinspire.GSM.MODEM.PhoneActivityStatus.Unknown){
					break;
				}
			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}







[Description(nick = "CSCS", blurb = "Set de caracteres actual")]
public CharSet CSCS(){

			CharSet Retorno = CharSet.Unknown;
		//	bool Finalizar = false;
			this.DiscardBuffer();
			//	this.DiscardOutBuffer();
this.Send("AT+CSCS?\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCSCS){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
//print("linea %s\n", Linea);
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

//Retorno = (PhoneActivityStatus)(int.parse(match.fetch_named("CSCS")));
Retorno = CharSet.FromString(match.fetch_named("CSCS"));
//print (Retorno.to_string());

break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
	}

return Retorno;
		}



[Description(nick = "List Messages", blurb = "Lista de mensajes segun el estado ingresado como parametro")]
public ArrayList<iSMS> ListMessages(SMS_Status Status){
return this.CMGL(Status);
}

[Description(nick = "List Messages All", blurb = "Lista de todos los mensajes")]
public ArrayList<iSMS> ListMessages_All(){
return this.CMGL(SMS_Status.ALL);
}

[Description(nick = "CMGR", blurb = "Le el mensaje pasado como parametro")]
	public iSMS CMGR(uint index){

bool PreventFalseResponseDetect = false;

this.SetearDefaultToPDUMode();

			StringBuilder CommandAT = new StringBuilder();
CommandAT.append_printf("AT+CMGR=%s\r", index.to_string());

var Retorno = new iSMS[1];

Mode CMGFget = CMGF();

if (CMGFget == Mode.TXT) {
PreventFalseResponseDetect = true;
	}

this.Send(CommandAT.str);

			Response Respuesta = this.Receive(10000, PreventFalseResponseDetect);

if(Respuesta.Return == ResponseCode.OK){

switch(CMGFget){
		case Mode.PDU:
//Retorno[0].Index = index;
Retorno[0] = CMGRPduMode(Respuesta.Raw);			
					break;
case Mode.TXT:
Retorno[0] = CMGRTextMode(ref Respuesta.Lines);
					break;

				}

		}
Retorno[0].Index = index;
return Retorno[0];
			}


private static Datetime RegexDateTimeModeText(string? text){
var fechasms = new Datetime.from_values (1990, 1, 1, 0, 0, 0, 0);
if(text != null){
try{
Regex RegExpFecha = new Regex("(?<Year>[0-9]+)/(?<Month>[0-9]+)/(?<Day>[0-9]+),(?<Hour>[0-9]+)?:(?<Minutes>[0-9]+)?:(?<Seconds>[0-9]+)?");

MatchInfo match;
if(RegExpFecha.match(text, RegexMatchFlags.ANCHORED, out match)){

 fechasms = new Datetime.from_values(int.parse(match.fetch_named("Year")), int.parse(match.fetch_named("Month")), int.parse(match.fetch_named("Day")), int.parse(match.fetch_named("Hour")), int.parse(match.fetch_named("Minutes")), double.parse(match.fetch_named("Seconds")), 0);

}

}
			catch (RegexError err) {
                warning (err.message);
		}
}
return fechasms;
}


private iSMS CMGRTextMode(ref ArrayList<string> lines){
//expregCMGRtxt
var Retorno = new iSMS[1];
var modemcharset = CSCS();
var Texto = new StringBuilder(); 

		foreach(string Expresion in expregCMGRtxt){
bool initext = false;

Texto.truncate();
			try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in lines){

MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){


var stado = ConvertTextToSMSStatus(match.fetch_named("Status"));
//int indxtext = int.parse(match.fetch_named("Index"));
string telefonotxt = match.fetch_named("Phone");

//print("matchFchaa %s\n", match.fetch_named("Date")); 



if(stado == SMS_Status.RECUNREAD || stado == SMS_Status.RECREAD){

Deliver Mensajeh = new Deliver();

//(?<Year>[0-9]+)/(?<Month>[0-9]+)/(?<Day>[0-9]+),(?<Hour>[0-9]+)?:(?<Minutes>[0-9]+)?:(?<Seconds>[0-9]+)?


//Mensajeh.DateTime = RegexDateTimeModeText(match.fetch_named("Date"));
Mensajeh.Phone = telefonotxt;
Mensajeh.Status = stado;

Retorno[0] = Mensajeh;

}else if(stado == SMS_Status.STOUNSENT || stado == SMS_Status.STOSENT){

var Mensajeb = new Submit();

//Mensajeb.Index = indxtext;
Mensajeb.Phone = telefonotxt;
Mensajeb.Status = stado;

Retorno[0] = Mensajeb;

}
initext = true;
Retorno[0].DateTime = RegexDateTimeModeText(match.fetch_named("Date"));;
}else{
if(initext){
Texto.append_printf("%s\n", Linea);
}
}
			}


Retorno[0].Text = TextUtils.DecodeFromCharSet(Texto.str, modemcharset);
//print(Retorno[0].Text);

			}
				catch (RegexError err) {
                warning (err.message);
		}

		}

return Retorno[0];
}

private iSMS CMGRPduMode(string rawlines){
var Retorno = new iSMS[1];

var RawLines = Strip(rawlines.replace("OK\r\n", "").replace("ERROR\r\n", ""));

foreach(string Expresion in expregCMGRpdu){

			try{

Regex RegExp = new Regex(Expresion);

//print("<<<<CMGR>>>> %s\n", RawLines);
MatchInfo match;
if(RegExp.match(RawLines, RegexMatchFlags.NEWLINE_ANY, out match)){

var stado = (SMS_Status)int.parse(match.fetch_named("Status"));
string PduCode = Strip(match.fetch_named("Pdu").replace("\r", ""));

if(stado == SMS_Status.RECUNREAD || stado == SMS_Status.RECREAD){

 Deliver Mensajepdu  = new Deliver();

Mensajepdu.DECODE(PduCode);
//Mensajepdu.print_values();

Retorno[0] = Mensajepdu;
//print("estraado: %s\n‎", Mensajepdu.Status.to_string());
}else if(stado == SMS_Status.STOUNSENT || stado == SMS_Status.STOSENT){

 var Mensajepdux  = new Submit();
Mensajepdux.DECODE(PduCode);
//print("estraado2: %s\n‎", Mensajepdux.Status.to_string());
Retorno[0] = Mensajepdux;

}
Retorno[0].Status = stado;
// Sale del while 
break;

}



			}
				catch (RegexError err) {
                warning (err.message);
		}

/*
			try{
		int ipdu = 0;

Regex RegExp = new Regex(Expresion);
	foreach(string Linea in lines){
//print("%s ==> %s\n", Expresion, Linea);
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.NEWLINE_ANY, out match)){
//print("MATCH\n");

var stado = (SMS_Status)int.parse(match.fetch_named("Status"));
//print("stado %s\n", stado.to_string());

if(stado == SMS_Status.RECUNREAD || stado == SMS_Status.RECREAD){

 Deliver Mensajepdu  = new Deliver();

Mensajepdu.DECODE(lines[ipdu+1]);
//Mensajepdu.print_values();

Retorno[0] = Mensajepdu;
//print("estraado: %s\n‎", Mensajepdu.Status.to_string());
}else if(stado == SMS_Status.STOUNSENT || stado == SMS_Status.STOSENT){

 var Mensajepdux  = new Submit();
Mensajepdux.DECODE(lines[ipdu+1]);
//print("estraado2: %s\n‎", Mensajepdux.Status.to_string());
Retorno[0] = Mensajepdux;

}
Retorno[0].Status = stado;
break;
}
ipdu++;
}

			}
				catch (RegexError err) {
                warning (err.message);
		}
*/


			}
return Retorno[0];
}

// Usmos modo texto solo y unicamente si em modem no acepta modo PDU
private void SetearDefaultToPDUMode(){
if(this.Features.CMGF != Mode.TXT){
this.CMGF_Set(Mode.PDU);
}
}



[Description(nick = "CMGL", blurb = "Lista de mensajes segun el estado ingresado como parametro")]
	public ArrayList<iSMS> CMGL(SMS_Status Status = SMS_Status.ALL){

bool PreventFalseResponseDetect = false;

			StringBuilder CommandAT = new StringBuilder();

ArrayList<iSMS> Retorno = new ArrayList<iSMS>();

SetearDefaultToPDUMode();

Mode CMGFget = CMGF();

if (CMGFget == Mode.TXT) {

PreventFalseResponseDetect = true;

	CommandAT.append_printf("AT+CMGL=\"%s\"\r", Status.ToString());

	} else {
	CommandAT.append("AT+CMGL=");
CommandAT.append_printf("%i", Status);
CommandAT.append("\r");
				}

this.Send(CommandAT.str);

			Response Respuesta = this.Receive(10000, PreventFalseResponseDetect);

if(Respuesta.Return == ResponseCode.OK){

switch(CMGFget){
		case Mode.PDU:
Retorno = ReadCMGLPduMode(Respuesta.Raw);			
					break;
case Mode.TXT:
Retorno = ReadCMGLTextMode(ref Respuesta.Lines);
					break;

				}

		}else{
warning("CMGL no devuelve OK\n");
}
return Retorno;
			}





private ArrayList<iSMS> ReadCMGLPduMode(string  rawlines){

var Retorno = new ArrayList<iSMS>();

var RawLines = Strip(rawlines.replace("OK\r\n", "").replace("ERROR\r\n", ""));

foreach(string Expresion in expregCMGLpdu){

			try{

Regex RegExp = new Regex(Expresion);

MatchInfo match;
if(RegExp.match(RawLines, RegexMatchFlags.NEWLINE_ANY, out match)){

string PduCode = Strip(match.fetch_named("Pdu").replace("\r", ""));

var stado = (SMS_Status)int.parse(match.fetch_named("Status"));

if(stado == SMS_Status.RECUNREAD || stado == SMS_Status.RECREAD){

 Deliver Mensajepdu  = new Deliver();
 Mensajepdu.Index = int.parse(match.fetch_named("Index"));
 Mensajepdu.Status = stado;
Mensajepdu.DECODE(PduCode);
Retorno.add(Mensajepdu);

}else if(stado == SMS_Status.STOUNSENT || stado == SMS_Status.STOSENT){

 var Mensajepdux  = new Submit();
 Mensajepdux.Index = int.parse(match.fetch_named("Index"));
 Mensajepdux.Status = stado;
Mensajepdux.DECODE(PduCode);
Retorno.add(Mensajepdux);

}

while(match.next()){

PduCode = Strip(match.fetch_named("Pdu").replace("\r", ""));

var stadox = (SMS_Status)int.parse(match.fetch_named("Status"));

if(stadox == SMS_Status.RECUNREAD || stadox == SMS_Status.RECREAD){

 Deliver Mensajepdu  = new Deliver();
 Mensajepdu.Index = int.parse(match.fetch_named("Index"));
 Mensajepdu.Status = stadox;
Mensajepdu.DECODE(PduCode);
Retorno.add(Mensajepdu);

}else if(stadox == SMS_Status.STOUNSENT || stadox == SMS_Status.STOSENT){

 var Mensajepdux  = new Submit();
 Mensajepdux.Index = int.parse(match.fetch_named("Index"));
 Mensajepdux.Status = stadox;
Mensajepdux.DECODE(PduCode);
Retorno.add(Mensajepdux);

}

}

}

			}
				catch (RegexError err) {
                warning (err.message);
		}

			}

return Retorno;
}


/*
private ArrayList<iSMS> ReadCMGLPduMode(ref ArrayList<string> lines){

var Retorno = new ArrayList<iSMS>();

foreach(string Expresion in expregCMGLpdu){

			try{
		int ipdu = 0;

Regex RegExp = new Regex(Expresion);
	foreach(string Linea in lines){
print("<<<<CMGL>>>> %s\n", Linea);
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
print("CMGL PDU Match %s", match.fetch_named("Index"));
var stado = (SMS_Status)int.parse(match.fetch_named("Status"));

if(stado == SMS_Status.RECUNREAD || stado == SMS_Status.RECREAD){

 Deliver Mensajepdu  = new Deliver();
 Mensajepdu.Index = int.parse(match.fetch_named("Index"));
//Mensaje.Phone = match.fetch_named("Number");
 Mensajepdu.Status = stado;
Mensajepdu.DECODE(lines[ipdu+1]);
Retorno.add(Mensajepdu);

}else if(stado == SMS_Status.STOUNSENT || stado == SMS_Status.STOSENT){

 var Mensajepdux  = new Submit();
 Mensajepdux.Index = int.parse(match.fetch_named("Index"));
//Mensaje.Phone = match.fetch_named("Number");
 Mensajepdux.Status = stado;
Mensajepdux.DECODE(lines[ipdu+1]);
Retorno.add(Mensajepdux);

}

}
ipdu++;
}

			}
				catch (RegexError err) {
                warning (err.message);
		}

			}

return Retorno;
}
*/



private ArrayList<iSMS> ReadCMGLTextMode(ref ArrayList<string> lines){

var Retorno = new ArrayList<iSMS>();
var modemcharset = CSCS();
var Texto = new StringBuilder(); 

		foreach(string Expresion in expregCMGLtxt){
uint initext = 0;

Texto.truncate();
			try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in lines){
//print("%s\n", Linea);
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

// Adjuntamos el texto al mensaje anterior
if(initext>0){

foreach(var mensa in Retorno){
if(mensa.Index == initext){

//
mensa.Text = Texto.str;
Texto.truncate();
initext = 0;
break;
}
}

}


var stado = ConvertTextToSMSStatus(match.fetch_named("Status"));
initext = int.parse(match.fetch_named("Index"));
string telefonotxt = match.fetch_named("Number");


if(stado == SMS_Status.RECUNREAD || stado == SMS_Status.RECREAD){

Deliver Mensajeh = new Deliver();

Mensajeh.Index = initext;
Mensajeh.Phone = telefonotxt;
Mensajeh.Status = stado;

Retorno.add(Mensajeh);

}else if(stado == SMS_Status.STOUNSENT || stado == SMS_Status.STOSENT){

var Mensajeb = new Submit();

Mensajeb.Index = initext;
Mensajeb.Phone = telefonotxt;
Mensajeb.Status = stado;

Retorno.add(Mensajeb);

}

 
}else{
if(initext>0){
Texto.append_printf("%s\n", Linea);
}
}
			}

// el ultimo texto de mensaje
if(initext>0){

foreach(var mensa in Retorno){
if(mensa.Index == initext){
mensa.Text = Texto.str;
Texto.truncate();
initext = 0;
break;
}
}

}


			}
				catch (RegexError err) {
                warning (err.message);
		}
		}

// Decodificamos el texto del mensaje 
foreach(var mensaj in Retorno){
mensaj.Text = TextUtils.DecodeFromCharSet(mensaj.Text, modemcharset);
Texto.truncate();
}

return Retorno;
}



[Description(nick = "List Messages Index", blurb = "Lista de mensajes segun el estado ingresado como parametro. Devuelve solo los indices")]
public HashSet<uint> ListMessagesIndex(SMS_Status Status){
return this.CMGL_only_index(Status);
}



[Description(nick = "CMGL only index", blurb = "Lista de mensajes segun el estado ingresado como parametro. Devuelve solo los indices")]
	public HashSet<uint> CMGL_only_index(SMS_Status Status){
			StringBuilder CommandAT = new StringBuilder();
bool PreventFalseResponseDetect = false;
HashSet<uint> Retorno = new HashSet<int>();

this.SetearDefaultToPDUMode();

Mode CMGFget = CMGF();

if (CMGFget == Mode.TXT) {
PreventFalseResponseDetect = true;

	CommandAT.append_printf("AT+CMGL=\"%s\"\r", Status.ToString());

	} else {
	CommandAT.append("AT+CMGL=");
	CommandAT.append_printf("%i", Status);
	CommandAT.append("\r");
				}

this.Send(CommandAT.str);

Response Respuesta = this.Receive(10000, PreventFalseResponseDetect);

if(Respuesta.Lines.size>0){

if(CMGFget == Mode.TXT){
var itxt = this.ReadCMGLTextMode(ref Respuesta.Lines);
foreach(var sms in itxt){
Retorno.add(sms.Index);
}

}else{
var ipdu = this.ReadCMGLPduMode(Respuesta.Raw);
foreach(var sms in ipdu){
Retorno.add(sms.Index);
}

}


		}

return Retorno;
			}


internal static SMS_Status ConvertTextToSMSStatus(string StatusSMS){
SMS_Status Status = SMS_Status.UNKNOWN;
switch(StatusSMS){

case "REC UNREAD":
Status = SMS_Status.RECUNREAD;
break;
case "REC READ":
Status = SMS_Status.RECREAD;
break;

case "STO UNSENT":
Status = SMS_Status.STOUNSENT;
break;

case "STO SENT":
Status = SMS_Status.STOSENT;
break;

case "ALL":
Status = SMS_Status.ALL;
break;

}
return Status;
}

[Description(nick = "List Messages Support", blurb = "Lista de estados de sms soportado por el modem")]
public HashSet<SMS_Status> ListMessagesSupport(){
return this.CMGL_Support();
}



[Description(nick = "CMGL Support", blurb = "Lista de estados de sms soportado por el modem")]
public HashSet<SMS_Status> CMGL_Support(){
			HashSet<SMS_Status> Retorno = new HashSet<SMS_Status>();

			this.DiscardBuffer();

Mode ModoActual = this.CMGF();

this.Send("AT+CMGL=?\r");

Response Respuesta = this.Receive();
			if(Respuesta.Return == ResponseCode.OK){
		
switch(ModoActual){
case Mode.TXT:

		foreach(string Expresion in expregCMGLstxt){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

if(match.fetch_named("Status1") != null){
Retorno.add(ConvertTextToSMSStatus(match.fetch_named("Status1")));
}
if(match.fetch_named("Status2") != null){
Retorno.add(ConvertTextToSMSStatus(match.fetch_named("Status2")));
}
if(match.fetch_named("Status3") != null){
Retorno.add(ConvertTextToSMSStatus(match.fetch_named("Status3")));
}
if(match.fetch_named("Status4") != null){
Retorno.add(ConvertTextToSMSStatus(match.fetch_named("Status4")));
}
if(match.fetch_named("Status5") != null){
Retorno.add(ConvertTextToSMSStatus(match.fetch_named("Status5")));
}


break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
break;

case Mode.PDU:


		foreach(string Expresion in expregCMGLstxt){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

if(match.fetch_named("Status1") != null){
Retorno.add((SMS_Status)int.parse(match.fetch_named("Status1")));
}
if(match.fetch_named("Status2") != null){
Retorno.add((SMS_Status)int.parse(match.fetch_named("Status2")));
}
if(match.fetch_named("Status3") != null){
Retorno.add((SMS_Status)int.parse(match.fetch_named("Status3")));
}
if(match.fetch_named("Status4") != null){
Retorno.add((SMS_Status)int.parse(match.fetch_named("Status4")));
}
if(match.fetch_named("Status5") != null){
Retorno.add((SMS_Status)int.parse(match.fetch_named("Status5")));
}
break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}
break;
default:

break;

}







		}


return Retorno;
		}


[Description(nick = "Set Message Format", blurb = "Configura el modo de formato de sms")]
public bool MessageFormat_Set(Mode mode){
return this.CMGF_Set(mode);
}


[Description(nick = "CMGF Set", blurb = "Configura el modo de formato de sms")]
public bool CMGF_Set(Mode Mode_){

			StringBuilder ComandoAT = new StringBuilder("AT+CMGF=");
			ComandoAT.append_printf("%i", Mode_);
			ComandoAT.append("\r");

			return this.SendSimpleCommand(ComandoAT.str);
		}


[Description(nick = "CSCS Set", blurb = "Configura el set de caracteres del modem, ingresa como parametro texto")]
public bool CSCS_Set_from_text(string cs){

			StringBuilder ComandoAT = new StringBuilder("AT+CSCS=\"");
			ComandoAT.append(cs);
			ComandoAT.append("\"\r");

			return this.SendSimpleCommand(ComandoAT.str);
		}


public bool CSCS_Set(CharSet cs){
	return this.CSCS_Set_from_text(cs.ToString());
		}


/*
Set command disables or enables the use of result code +CME ERROR: as an indication of an error relating to the functionality of the ME. When enabled, ME related errors cause +CME ERROR: final result code instead of the regular ERROR final result code. ERROR is returned normally when error is related to syntax, invalid parameters, or TA functionality. Test command returns values supported by the TA as a compound value.
*/
[Description(nick = "Set Expanded Error Message", blurb = "Configura el mensaje de error")]
public bool ExpandedErrorMessage_Set(ExpandedErrorMessage messageerror){
return CMEE_Set(messageerror);
}


[Description(nick = "CMEE Set", blurb = "Configura el mensaje de error")]
public bool CMEE_Set(ExpandedErrorMessage messageerror){

			StringBuilder ComandoAT = new StringBuilder("AT+CMEE=");
			ComandoAT.append_printf("%i", messageerror);
			ComandoAT.append("\r");
//print("Co,mando AT = %s\n", ComandoAT.str);
			return this.SendSimpleCommand(ComandoAT.str);
		}



[Description(nick = "Terminate Call", blurb = "Finaliza una llamada en curso o rechaza una entrante")]
public bool TerminateCall(){
return this.CHUP();
}

[Description(nick = "CHUP", blurb = "Finaliza una llamada en curso o rechaza una entrante")]
public bool CHUP(){
		return this.SendSimpleCommand("AT+CHUP\r");
	}

//TODO: Reimplementar esto para que tome como datos las caracteristicas del modem y no el comando ati3
public ModemModel GetModel(){
if(Features.Model == ModemModel.Unknown){
			this.DiscardBuffer();
this.ATZ();
this.Send("ATI3\r");

Response Respuesta = this.Receive();

			if(Respuesta.Return == ResponseCode.OK){

	foreach(string Linea in Respuesta.Lines){
//print("(%s)\n", Linea);
if(Linea.contains("Motorola Mobile Phone")){
Features.Model = ModemModel.Motorola;
break;
}else if(Linea.contains("SIMCOM_SIM300")){
Features.Model = ModemModel.SIMCOM_SIM300;
break;
}
			}
			
	}
}
return Features.Model;
}

[Description(nick = "StringInit", blurb = "Cadena de inicializacion del modem")]
public bool StringInit(string initat = ""){
if(initat.length<1){

if(Features.Model == ModemModel.Unknown){
GetModel();
}

switch(this.Features.Model){
case ModemModel.SIMCOM_SIM300:
initat = "AT S7=45 S0=0 L1 V1 X4 &c1 E1 Q0\r";
break;
default:
initat = "AT S7=45 S0=0 L1 V1 X4 &c1 E1 Q0\r";
break;
}

}
		return this.SendSimpleCommand(initat);
	}

[Description(nick = "Battery Charge", blurb = "Obtiene la carga de la bateria")]
public BatteryCharge BatteryCharge(){
return this.CBC();
} 


[Description(nick = "CBC", blurb = "Obtiene la carga de la bateria")]
	public BatteryCharge CBC(){
	
edwinspire.GSM.MODEM.BatteryCharge Retorno =  edwinspire.GSM.MODEM.BatteryCharge(BatteryConnectionStatus.Recognized_Power_Fault, 0);

				this.DiscardBuffer();
			this.Send("AT+CBC\r");
			Response Respuesta = this.Receive();
if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCBCr){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

Retorno.Level = int.parse(match.fetch_named("bcl"));
Retorno.Status = (BatteryConnectionStatus)int.parse(match.fetch_named("bcs"));


break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}



		}

		return 	Retorno;
    }


[Description(nick = "List All Available ATCommands", blurb = "Obtiene la lista de todos los comandos AT soportados por el modem")]
public HashSet<string>ListAllAvailableATCommands(){
return this.CLAC();
}

[Description(nick = "CLAC", blurb = "Obtiene la lista de todos los comandos AT soportados por el modem")]
	public HashSet<string> CLAC(){

var Retorno = new HashSet<string>();
			
				this.DiscardBuffer();
			this.Send("AT+CLAC\r");
			Response Respuesta = this.Receive(2000);
if(Respuesta.Return == ResponseCode.OK){

	foreach(var l in Respuesta.Lines){
if(l.has_prefix("AT")){
Retorno.add(l);
}
}



		}

		return 	Retorno;
    }


[Description(nick = "Signal Quality", blurb = "Obtiene la calidad de la señal")]
public SignalQuality SignalQuality(){
return this.CSQ();
}

[Description(nick = "CSQ", blurb = "Obtiene la calidad de la señal")]
	public SignalQuality CSQ(){
	
edwinspire.GSM.MODEM.SignalQuality Retorno =  edwinspire.GSM.MODEM.SignalQuality();

				this.DiscardBuffer();
			this.Send("AT+CSQ\r");
			Response Respuesta = this.Receive();
if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCSQr){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

Retorno.ReceivedSignalStrengthIndication = int.parse(match.fetch_named("rssi"));
Retorno.ChannelBitErrorRate = int.parse(match.fetch_named("ber"));

break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}



		}

		return 	Retorno;
    }

[Description(nick = "CREG", blurb = "Obtiene el estado de registro en la red")]
	public NetworkRegistration CREG(){
	
edwinspire.GSM.MODEM.NetworkRegistration Retorno =  edwinspire.GSM.MODEM.NetworkRegistration();

				this.DiscardBuffer();
			this.Send("AT+CREG?\r");
			Response Respuesta = this.Receive();
if(Respuesta.Return == ResponseCode.OK){

		foreach(string Expresion in expregCREGr){
						try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

Retorno.UnsolicitedResultCode = (NetworkRegistrationUnsolicitedResultCode)int.parse(match.fetch_named("n"));
Retorno.Status = (NetworkRegistrationStatus)int.parse(match.fetch_named("stat"));
//GLib.print("MATCH >>>>>>>>>>>>>>< CREG >> %s\n", match.fetch_named("stat"));
break;
}
			}

			}
				catch (RegexError err) {
                warning (err.message);
		}
		}



		}

		return 	Retorno;
    }


//
[Description(nick = "Request Revision Identification", blurb = "Obtiene el numero de revision del modem ")]
public string RequestRevisionIdentification(){
return CGMR();
}


//
[Description(nick = "CGMR", blurb = "Obtiene el numero de revision del modem ")]
public string CGMR(){

			bool Finalizar = false;
			string Retorno = "";
			//this.DiscardInBuffer();
				this.DiscardBuffer();
		this.Send("AT+CGMR\r");

Response Respuesta = this.Receive();
			if(Respuesta.Return == ResponseCode.OK){
	foreach(string Expresion in expregCGMRr){
	try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
//print(">>>>>>>>>>#### (%s)\n", Linea);
if(!Linea.has_prefix("AT+")){
//print(">>>>>>>>>> ANALIZA #### (%s)\n", Linea);
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

Retorno = match.fetch_named("CGMR");

Finalizar = true;
break;
}
}
			}
if(Finalizar){
					break;
				}
			}
				catch (RegexError err) {
                warning (err.message);
		}
		}

		}


			
return Retorno;
		}


[Description(nick = "Request Manufaturer Identification", blurb = "Obtiene el manufaturador del modem ")]
public string RequestManufaturerIdentification(){
return CGMI();
}

[Description(nick = "Request Model Identification", blurb = "Obtiene el modelo del modem ")]
public string RequestModelIdentification(){
return CGMM();
}


//
[Description(nick = "CGMM", blurb = "Obtiene el modelo del modem ")]
public string CGMM(){

			bool Finalizar = false;
			string Retorno = "";
			//this.DiscardInBuffer();
				this.DiscardBuffer();
		this.Send("AT+CGMM\r");

Response Respuesta = this.Receive();
			if(Respuesta.Return == ResponseCode.OK){
	foreach(string Expresion in expregCGMMr){
	try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
if(!Linea.has_prefix("AT+")){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

Retorno = match.fetch_named("CGMM");

Finalizar = true;
break;
}
}
			}
if(Finalizar){
					break;
				}
			}
				catch (RegexError err) {
                warning (err.message);
		}

		}

		}


			
return Retorno;
		}



[Description(nick = "CGMI", blurb = "Obtiene el manufaturador del modem ")]
public string CGMI(){

			bool Finalizar = false;
			string Retorno = "";
			//this.DiscardInBuffer();
				this.DiscardBuffer();
		this.Send("AT+CGMI\r");

Response Respuesta = this.Receive();
			if(Respuesta.Return == ResponseCode.OK){
	foreach(string Expresion in expregCGMIr){

	try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
if(!Linea.has_prefix("AT+")){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

Retorno = match.fetch_named("CGMI");

Finalizar = true;
break;
}
}
			}
if(Finalizar){
					break;
				}
			}
				catch (RegexError err) {
                warning (err.message);
		}
		}

		}


			
return Retorno;
		}


[Description(nick = "CGSN", blurb = "Obtiene el Product Serial Number Identification (IMEI)")]
public string CGSN(){

			bool Finalizar = false;
			string Retorno = "";
			//this.DiscardInBuffer();
				this.DiscardBuffer();
		this.Send("AT+CGSN\r");

Response Respuesta = this.Receive();
			if(Respuesta.Return == ResponseCode.OK){
	foreach(string Expresion in expregCGSNr){
	try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

Retorno = match.fetch_named("IMEI");

Finalizar = true;
break;
}
			}
if(Finalizar){
					break;
				}
			}
				catch (RegexError err) {
                warning (err.message);
		}
		}

		}


			
return Retorno;
		}

[Description(nick = "CGSN", blurb = "Obtiene el Product Serial Number Identification (IMEI)")]
public string ProductSerialNumberIdentification(){
return this.CGSN();
}
[Description(nick = "IMEI", blurb = "Obtiene el Product Serial Number Identification (IMEI)")]
public string IMEI(){
return this.CGSN();
}

[Description(nick = "International Mobile Subscriber Identity", blurb = "Obtiene el International Mobile Subscriber Identity")]
public string InternationalMobileSubscriberIdentity(){
return this.CIMI();
}


[Description(nick = "CIMI", blurb = "Obtiene el International Mobile Subscriber Identity")]
public string CIMI(){


			bool Finalizar = false;
			string Retorno = "0000";
			//this.DiscardInBuffer();
				this.DiscardBuffer();
		this.Send("AT+CIMI\r");

Response Respuesta = this.Receive();
			if(Respuesta.Return == ResponseCode.OK){
	foreach(string Expresion in expregCIMIr){
	try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
//print("%s con %s\n", Linea, Expresion);
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){

Retorno = match.fetch_named("CIMI");

Finalizar = true;
break;
}
			}
if(Finalizar){
					break;
				}
			}
				catch (RegexError err) {
                warning (err.message);
		}
		}

		}


			
return Retorno;
		}

[Description(nick = "Motorola Mode", blurb = "Para cambiar el modo en telefonos motorola")]
public bool MODE(int mode){
return this.SendSimpleCommand("AT+MODE="+mode.to_string()+"\r", 5000);
}

[Description(nick = "Calling Line Identification Presentation", blurb = "Activa o desactiva el identificador de llamadas")]
public bool CallingLineIdentificationPresentation(bool active){
return CLIP(active);
}


[Description(nick = "CLIP", blurb = "Activa o desactiva el identificador de llamadas")]
public bool CLIP(bool Active){
//TODO// Implementar en caso de ser un Modem Motorola cambiar de modo a 2
bool Retorno = false;
var CadenaAt = new StringBuilder("AT+CLIP=");
if(Active){
CadenaAt.append("1\r");
}else{
CadenaAt.append("0\r");
}
switch(this.Features.Model){
case ModemModel.Motorola:
// Telefono motorola L6i requiere estar en modo 2 para poder habilitar el CLIP
this.MODE(2);
Retorno = this.SendSimpleCommand(CadenaAt.str);

break;
default:
Retorno = this.SendSimpleCommand(CadenaAt.str);
break;
}


return Retorno;
		}

[Description(nick = "Delete Message", blurb = "Elimina un mensaje de texto.")]
public bool DeleteMessage(uint msg_reference){
return this.CMGD(msg_reference);
}



[Description(nick = "CMGD", blurb = "Elimina un mensaje de texto.")]
public bool CMGD(uint MessageReference){
			StringBuilder ComandoAT = new StringBuilder("AT+CMGD=");
			ComandoAT.append_printf("%s", MessageReference.to_string());
			ComandoAT.append("\r");
return this.SendSimpleCommand(ComandoAT.str);
		}

[Description(nick = "Message Format", blurb = "Obtiene el modo de mensaje")]
public Mode MessageFormat(){
return this.CMGF();
}


[Description(nick = "CMGF", blurb = "Obtiene el modo de mensaje")]
public Mode CMGF(){


			Mode Retorno = Mode.UNKNOWN;
			//this.DiscardInBuffer();
				this.DiscardBuffer();
		this.Send("AT+CMGF?\r");

Response Respuesta = this.Receive();
			if(Respuesta.Return == ResponseCode.OK){

	foreach(string Expresion in expregCMGFr){
		try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){
MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
//string Modo = match.fetch_named("Mode");
Retorno = (Mode)(int.parse(match.fetch_named("Mode")));

break;
}
			}
if(Retorno != Mode.UNKNOWN){
					break;
				}
			}catch (RegexError err) {
                warning (err.message);
		}
		}

		}


			
return Retorno;
		}


public int SMS_SEND_TXT(string Phone, string Message){
int intentos = 0;
int Retorno = 0;

if(Phone.length>1){
while(this.Features.CMGF == Mode.UNKNOWN && intentos<2){
this.Features.CMGF = this.CMGF_Support();
intentos++;
}

if(this.Features.CMGF == Mode.TXT || this.Features.CMGF == Mode.BOTH){
Retorno = CMGS_TXT(Phone, Message);
}
}
return Retorno;
}

[Description(nick = "CMGW Modo texto", blurb = "Escribe un mensaje en formato texto en la memoria")]
public int CMGW_TXT(string Phone, string Message){
			return CMG_WS_TXT(Phone, Message, true);
		}


[Description(nick = "CMGS Modo texto", blurb = "Envia un mensaje en formato texto en la memoria")]
public int CMGS_TXT(string Phone, string Message){
			return CMG_WS_TXT(Phone, Message);
		}

internal int CMG_WS_TXT(string Phone, string Message, bool W = false){
// El tamaño maximo de un sms es de 160 caracteres
string message = Message;
int Retorno = 0;

if(Phone.length>1){

if(Message.length>160){
message = Message.substring(0, 160);
}

int intentos = 0;
while(this.Features.CSCS.size>0 && intentos < 2){
this.Features.CSCS = this.CSCS_Support();
intentos++;
}

if(this.Features.CSCS.contains(CharSet.UCS2)){
if(this.CSCS_Set(CharSet.UCS2)){
message = TextConvert.ConvertASCIIToUCS2(message);
}
}else if(this.Features.CSCS.contains(CharSet.UTF8)){
this.CSCS_Set(CharSet.UTF8);
}

			Response Respuesta =  new Response();
			StringBuilder ComandoAT = new StringBuilder();
if(this.CMGF_Set(Mode.TXT)){
if(W){
	ComandoAT.append("AT+CMGW=\"");
			}else{
			ComandoAT.append("AT+CMGS=\"");
			}

			ComandoAT.append(Phone);
			ComandoAT.append("\"\r");

ulong pausaExtraEntreLineas = (ulong)this.BaudRateTouseg()*100;

this.Send(ComandoAT.str);
Thread.usleep(pausaExtraEntreLineas);
//print(ComandoAT.str);
			ComandoAT.erase(0, ComandoAT.len);



foreach(string Linea in message.split("\n")){
Thread.usleep(pausaExtraEntreLineas);
this.Write(Linea);
//Thread.usleep(pausaExtraEntreLineas);
this.Write("\r");
//Thread.usleep(pausaExtraEntreLineas);
			}
Thread.usleep(pausaExtraEntreLineas);
this.Write("\x1A");
Thread.usleep(pausaExtraEntreLineas);
this.Write("\r");
Thread.usleep(pausaExtraEntreLineas);


			if(W){
//---------------------------------------
// Escribe el sms en memoria
			 Respuesta = this.Receive(1000);
	foreach(string Expresion in expregCMGWr){
	try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){

MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
//string Modo = match.fetch_named("Mode");
Retorno = int.parse(match.fetch_named("Id"));

break;
}
			}
if(Retorno>0){
					break;
				}
}
catch (RegexError err) {
                warning (err.message);
		}
		}

			}else{
//------------------------------------------
// Envia el sms en modo texto
 Respuesta = this.Receive(20000);
	foreach(string Expresion in expregCMGSr){
	try{
Regex RegExp = new Regex(Expresion);
	foreach(string Linea in Respuesta.Lines){

MatchInfo match;
if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)){
//string Modo = match.fetch_named("Mode");
Retorno = int.parse(match.fetch_named("Id"));

break;
}
			}
if(Retorno>0){
					break;
				}
}
catch (RegexError err) {
                warning (err.message);
		}
		}
			}



			
		}
}else{
warning("El numero telefonico no puede ser una cadena vacia\n");
}
			//this.ATZ();

			return Retorno;
		}



	}
}

















