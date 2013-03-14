/* libspire_gsm.h generated by valac 0.16.1, the Vala compiler, do not modify */


#ifndef ___HOME_EDWINSPIRE_PROGRAMACION_PROYECTOSSOFTWARE_SOFTWARE_VALA_PROYECTOSVALA_PROYECTS_LIBSPIRE_GSM_BIN_LNX_LIBSPIRE_GSM_H__
#define ___HOME_EDWINSPIRE_PROGRAMACION_PROYECTOSSOFTWARE_SOFTWARE_VALA_PROYECTOSVALA_PROYECTS_LIBSPIRE_GSM_BIN_LNX_LIBSPIRE_GSM_H__

#include <glib.h>
#include <stdlib.h>
#include <string.h>
#include <gee.h>
#include <glib-object.h>
#include "libspire_pdu.h"
#include "libspire_serial.h"

G_BEGIN_DECLS


#define EDWINSPIRE_GSM_MODEM_TYPE_PHONE_ACTIVITY_STATUS (edwinspire_gsm_modem_phone_activity_status_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_EXPANDED_ERROR_MESSAGE (edwinspire_gsm_modem_expanded_error_message_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_MODEM_MODEL (edwinspire_gsm_modem_modem_model_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_PHONE_BOOK_MEMORY_STORAGE (edwinspire_gsm_modem_phone_book_memory_storage_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_PBMS (edwinspire_gsm_modem_pbms_get_type ())
typedef struct _edwinspireGSMMODEMPBMS edwinspireGSMMODEMPBMS;

#define EDWINSPIRE_GSM_MODEM_TYPE_CPBWS (edwinspire_gsm_modem_cpbws_get_type ())
typedef struct _edwinspireGSMMODEMCPBWS edwinspireGSMMODEMCPBWS;

#define EDWINSPIRE_GSM_MODEM_TYPE_ISMS (edwinspire_gsm_modem_isms_get_type ())
#define EDWINSPIRE_GSM_MODEM_ISMS(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_GSM_MODEM_TYPE_ISMS, edwinspireGSMMODEMiSMS))
#define EDWINSPIRE_GSM_MODEM_IS_ISMS(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_GSM_MODEM_TYPE_ISMS))
#define EDWINSPIRE_GSM_MODEM_ISMS_GET_INTERFACE(obj) (G_TYPE_INSTANCE_GET_INTERFACE ((obj), EDWINSPIRE_GSM_MODEM_TYPE_ISMS, edwinspireGSMMODEMiSMSIface))

typedef struct _edwinspireGSMMODEMiSMS edwinspireGSMMODEMiSMS;
typedef struct _edwinspireGSMMODEMiSMSIface edwinspireGSMMODEMiSMSIface;

#define EDWINSPIRE_GSM_MODEM_TYPE_SMS_STATUS (edwinspire_gsm_modem_sms_status_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_SUBMIT (edwinspire_gsm_modem_submit_get_type ())
#define EDWINSPIRE_GSM_MODEM_SUBMIT(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_GSM_MODEM_TYPE_SUBMIT, edwinspireGSMMODEMSubmit))
#define EDWINSPIRE_GSM_MODEM_SUBMIT_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), EDWINSPIRE_GSM_MODEM_TYPE_SUBMIT, edwinspireGSMMODEMSubmitClass))
#define EDWINSPIRE_GSM_MODEM_IS_SUBMIT(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_GSM_MODEM_TYPE_SUBMIT))
#define EDWINSPIRE_GSM_MODEM_IS_SUBMIT_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), EDWINSPIRE_GSM_MODEM_TYPE_SUBMIT))
#define EDWINSPIRE_GSM_MODEM_SUBMIT_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), EDWINSPIRE_GSM_MODEM_TYPE_SUBMIT, edwinspireGSMMODEMSubmitClass))

typedef struct _edwinspireGSMMODEMSubmit edwinspireGSMMODEMSubmit;
typedef struct _edwinspireGSMMODEMSubmitClass edwinspireGSMMODEMSubmitClass;
typedef struct _edwinspireGSMMODEMSubmitPrivate edwinspireGSMMODEMSubmitPrivate;

#define EDWINSPIRE_GSM_MODEM_TYPE_DELIVER (edwinspire_gsm_modem_deliver_get_type ())
#define EDWINSPIRE_GSM_MODEM_DELIVER(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_GSM_MODEM_TYPE_DELIVER, edwinspireGSMMODEMDeliver))
#define EDWINSPIRE_GSM_MODEM_DELIVER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), EDWINSPIRE_GSM_MODEM_TYPE_DELIVER, edwinspireGSMMODEMDeliverClass))
#define EDWINSPIRE_GSM_MODEM_IS_DELIVER(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_GSM_MODEM_TYPE_DELIVER))
#define EDWINSPIRE_GSM_MODEM_IS_DELIVER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), EDWINSPIRE_GSM_MODEM_TYPE_DELIVER))
#define EDWINSPIRE_GSM_MODEM_DELIVER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), EDWINSPIRE_GSM_MODEM_TYPE_DELIVER, edwinspireGSMMODEMDeliverClass))

typedef struct _edwinspireGSMMODEMDeliver edwinspireGSMMODEMDeliver;
typedef struct _edwinspireGSMMODEMDeliverClass edwinspireGSMMODEMDeliverClass;
typedef struct _edwinspireGSMMODEMDeliverPrivate edwinspireGSMMODEMDeliverPrivate;

#define EDWINSPIRE_GSM_MODEM_TYPE_CHAR_SET (edwinspire_gsm_modem_char_set_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_BATTERY_CHARGE (edwinspire_gsm_modem_battery_charge_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_BATTERY_CONNECTION_STATUS (edwinspire_gsm_modem_battery_connection_status_get_type ())
typedef struct _edwinspireGSMMODEMBatteryCharge edwinspireGSMMODEMBatteryCharge;

#define EDWINSPIRE_GSM_MODEM_TYPE_MODE (edwinspire_gsm_modem_mode_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_SIGNAL_QUALITY (edwinspire_gsm_modem_signal_quality_get_type ())
typedef struct _edwinspireGSMMODEMSignalQuality edwinspireGSMMODEMSignalQuality;

#define EDWINSPIRE_GSM_MODEM_TYPE_NETWORK_REGISTRATION_UNSOLICITED_RESULT_CODE (edwinspire_gsm_modem_network_registration_unsolicited_result_code_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_NETWORK_REGISTRATION_STATUS (edwinspire_gsm_modem_network_registration_status_get_type ())

#define EDWINSPIRE_GSM_MODEM_TYPE_NETWORK_REGISTRATION (edwinspire_gsm_modem_network_registration_get_type ())
typedef struct _edwinspireGSMMODEMNetworkRegistration edwinspireGSMMODEMNetworkRegistration;

#define EDWINSPIRE_GSM_MODEM_TYPE_FEATURES_MODEM (edwinspire_gsm_modem_features_modem_get_type ())
#define EDWINSPIRE_GSM_MODEM_FEATURES_MODEM(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_GSM_MODEM_TYPE_FEATURES_MODEM, edwinspireGSMMODEMFeaturesModem))
#define EDWINSPIRE_GSM_MODEM_FEATURES_MODEM_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), EDWINSPIRE_GSM_MODEM_TYPE_FEATURES_MODEM, edwinspireGSMMODEMFeaturesModemClass))
#define EDWINSPIRE_GSM_MODEM_IS_FEATURES_MODEM(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_GSM_MODEM_TYPE_FEATURES_MODEM))
#define EDWINSPIRE_GSM_MODEM_IS_FEATURES_MODEM_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), EDWINSPIRE_GSM_MODEM_TYPE_FEATURES_MODEM))
#define EDWINSPIRE_GSM_MODEM_FEATURES_MODEM_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), EDWINSPIRE_GSM_MODEM_TYPE_FEATURES_MODEM, edwinspireGSMMODEMFeaturesModemClass))

typedef struct _edwinspireGSMMODEMFeaturesModem edwinspireGSMMODEMFeaturesModem;
typedef struct _edwinspireGSMMODEMFeaturesModemClass edwinspireGSMMODEMFeaturesModemClass;
typedef struct _edwinspireGSMMODEMFeaturesModemPrivate edwinspireGSMMODEMFeaturesModemPrivate;

#define EDWINSPIRE_GSM_MODEM_TYPE_MODEM_GSM (edwinspire_gsm_modem_modem_gsm_get_type ())
#define EDWINSPIRE_GSM_MODEM_MODEM_GSM(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_GSM_MODEM_TYPE_MODEM_GSM, edwinspireGSMMODEMModemGSM))
#define EDWINSPIRE_GSM_MODEM_MODEM_GSM_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), EDWINSPIRE_GSM_MODEM_TYPE_MODEM_GSM, edwinspireGSMMODEMModemGSMClass))
#define EDWINSPIRE_GSM_MODEM_IS_MODEM_GSM(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_GSM_MODEM_TYPE_MODEM_GSM))
#define EDWINSPIRE_GSM_MODEM_IS_MODEM_GSM_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), EDWINSPIRE_GSM_MODEM_TYPE_MODEM_GSM))
#define EDWINSPIRE_GSM_MODEM_MODEM_GSM_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), EDWINSPIRE_GSM_MODEM_TYPE_MODEM_GSM, edwinspireGSMMODEMModemGSMClass))

typedef struct _edwinspireGSMMODEMModemGSM edwinspireGSMMODEMModemGSM;
typedef struct _edwinspireGSMMODEMModemGSMClass edwinspireGSMMODEMModemGSMClass;
typedef struct _edwinspireGSMMODEMModemGSMPrivate edwinspireGSMMODEMModemGSMPrivate;

typedef enum  {
	EDWINSPIRE_GSM_MODEM_PHONE_ACTIVITY_STATUS_Ready = 0,
	EDWINSPIRE_GSM_MODEM_PHONE_ACTIVITY_STATUS_Unavailable = 1,
	EDWINSPIRE_GSM_MODEM_PHONE_ACTIVITY_STATUS_Unknown = 2,
	EDWINSPIRE_GSM_MODEM_PHONE_ACTIVITY_STATUS_Ringing = 3,
	EDWINSPIRE_GSM_MODEM_PHONE_ACTIVITY_STATUS_Call = 4,
	EDWINSPIRE_GSM_MODEM_PHONE_ACTIVITY_STATUS_Asleep = 5,
	EDWINSPIRE_GSM_MODEM_PHONE_ACTIVITY_STATUS_Reserved
} edwinspireGSMMODEMPhoneActivityStatus;

typedef enum  {
	EDWINSPIRE_GSM_MODEM_EXPANDED_ERROR_MESSAGE_Suppresses = 0,
	EDWINSPIRE_GSM_MODEM_EXPANDED_ERROR_MESSAGE_Number = 1,
	EDWINSPIRE_GSM_MODEM_EXPANDED_ERROR_MESSAGE_Text = 2
} edwinspireGSMMODEMExpandedErrorMessage;

typedef enum  {
	EDWINSPIRE_GSM_MODEM_MODEM_MODEL_Unknown,
	EDWINSPIRE_GSM_MODEM_MODEM_MODEL_Generic,
	EDWINSPIRE_GSM_MODEM_MODEM_MODEL_Motorola,
	EDWINSPIRE_GSM_MODEM_MODEM_MODEL_TVMobile,
	EDWINSPIRE_GSM_MODEM_MODEM_MODEL_SIMCOM_SIM300
} edwinspireGSMMODEMModemModel;

typedef enum  {
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_LD,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_ME,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_MT,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_SM,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_TA,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_DC,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_RC,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_MC,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_MV,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_GR,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_HP,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_BC,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_EN,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_CN,
	EDWINSPIRE_GSM_MODEM_PHONE_BOOK_MEMORY_STORAGE_AP
} edwinspireGSMMODEMPhoneBookMemoryStorage;

struct _edwinspireGSMMODEMPBMS {
	edwinspireGSMMODEMPhoneBookMemoryStorage Storage;
	gint Used;
	gint Total;
};

struct _edwinspireGSMMODEMCPBWS {
	GeeArrayList* Index;
	gint Number;
	GeeArrayList* Type;
	gint Text;
	gint nLength;
	gint tLength;
};

typedef enum  {
	EDWINSPIRE_GSM_MODEM_SMS_STATUS_RECUNREAD,
	EDWINSPIRE_GSM_MODEM_SMS_STATUS_RECREAD,
	EDWINSPIRE_GSM_MODEM_SMS_STATUS_STOUNSENT,
	EDWINSPIRE_GSM_MODEM_SMS_STATUS_STOSENT,
	EDWINSPIRE_GSM_MODEM_SMS_STATUS_ALL,
	EDWINSPIRE_GSM_MODEM_SMS_STATUS_UNKNOWN
} edwinspireGSMMODEMSMS_Status;

struct _edwinspireGSMMODEMiSMSIface {
	GTypeInterface parent_iface;
	const gchar* (*get_Phone) (edwinspireGSMMODEMiSMS* self);
	void (*set_Phone) (edwinspireGSMMODEMiSMS* self, const gchar* value);
	const gchar* (*get_Text) (edwinspireGSMMODEMiSMS* self);
	void (*set_Text) (edwinspireGSMMODEMiSMS* self, const gchar* value);
	guint (*get_Index) (edwinspireGSMMODEMiSMS* self);
	void (*set_Index) (edwinspireGSMMODEMiSMS* self, guint value);
	edwinspireGSMMODEMSMS_Status (*get_Status) (edwinspireGSMMODEMiSMS* self);
	void (*set_Status) (edwinspireGSMMODEMiSMS* self, edwinspireGSMMODEMSMS_Status value);
	edwinspirePDUDatetime* (*get_DateTime) (edwinspireGSMMODEMiSMS* self);
	void (*set_DateTime) (edwinspireGSMMODEMiSMS* self, edwinspirePDUDatetime* value);
};

struct _edwinspireGSMMODEMSubmit {
	edwinspirePDUSUBMIT parent_instance;
	edwinspireGSMMODEMSubmitPrivate * priv;
};

struct _edwinspireGSMMODEMSubmitClass {
	edwinspirePDUSUBMITClass parent_class;
};

struct _edwinspireGSMMODEMDeliver {
	edwinspirePDUDELIVER parent_instance;
	edwinspireGSMMODEMDeliverPrivate * priv;
};

struct _edwinspireGSMMODEMDeliverClass {
	edwinspirePDUDELIVERClass parent_class;
};

typedef enum  {
	EDWINSPIRE_GSM_MODEM_CHAR_SET_Unknown,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_GSM,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_HEX,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_IRA,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_PCDN,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_ASCII,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_8859_1,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_8859_C,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_8859_A,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_8859_G,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_8859_H,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_UCS2,
	EDWINSPIRE_GSM_MODEM_CHAR_SET_UTF8
} edwinspireGSMMODEMCharSet;

typedef enum  {
	EDWINSPIRE_GSM_MODEM_BATTERY_CONNECTION_STATUS_ME_Powered_By_Battery,
	EDWINSPIRE_GSM_MODEM_BATTERY_CONNECTION_STATUS_ME_Battery_Connected_But_Isnt_Powered_By_It,
	EDWINSPIRE_GSM_MODEM_BATTERY_CONNECTION_STATUS_ME_Battery_Not_Connect,
	EDWINSPIRE_GSM_MODEM_BATTERY_CONNECTION_STATUS_Recognized_Power_Fault
} edwinspireGSMMODEMBatteryConnectionStatus;

struct _edwinspireGSMMODEMBatteryCharge {
	gint Level;
	edwinspireGSMMODEMBatteryConnectionStatus Status;
};

typedef enum  {
	EDWINSPIRE_GSM_MODEM_MODE_PDU,
	EDWINSPIRE_GSM_MODEM_MODE_TXT,
	EDWINSPIRE_GSM_MODEM_MODE_BOTH,
	EDWINSPIRE_GSM_MODEM_MODE_UNKNOWN
} edwinspireGSMMODEMMode;

struct _edwinspireGSMMODEMSignalQuality {
	gint ReceivedSignalStrengthIndication;
	gint ChannelBitErrorRate;
};

typedef enum  {
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_UNSOLICITED_RESULT_CODE_Disable = 0,
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_UNSOLICITED_RESULT_CODE_Enable = 1,
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_UNSOLICITED_RESULT_CODE_EnableWithLocationInformation = 2,
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_UNSOLICITED_RESULT_CODE_Unknown = 99
} edwinspireGSMMODEMNetworkRegistrationUnsolicitedResultCode;

typedef enum  {
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_STATUS_NotRegistered_NoSearchingANewOperator = 0,
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_STATUS_Registered = 1,
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_STATUS_NotRegistered_SearchingANewOperator = 2,
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_STATUS_Denied = 3,
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_STATUS_Unknown = 4,
	EDWINSPIRE_GSM_MODEM_NETWORK_REGISTRATION_STATUS_RegisteredRoaming = 5
} edwinspireGSMMODEMNetworkRegistrationStatus;

struct _edwinspireGSMMODEMNetworkRegistration {
	edwinspireGSMMODEMNetworkRegistrationUnsolicitedResultCode UnsolicitedResultCode;
	edwinspireGSMMODEMNetworkRegistrationStatus Status;
};

struct _edwinspireGSMMODEMFeaturesModem {
	GObject parent_instance;
	edwinspireGSMMODEMFeaturesModemPrivate * priv;
	GeeHashSet* CSCS;
	edwinspireGSMMODEMMode CMGF;
	gchar* CIMI;
	gchar* CGSN;
	gchar* CGMI;
	gchar* CGMR;
	gchar* CGMM;
	GeeHashSet* CMGL;
	edwinspireGSMMODEMModemModel Model;
};

struct _edwinspireGSMMODEMFeaturesModemClass {
	GObjectClass parent_class;
};

struct _edwinspireGSMMODEMModemGSM {
	edwinspirePortsModem parent_instance;
	edwinspireGSMMODEMModemGSMPrivate * priv;
	edwinspireGSMMODEMFeaturesModem* Features;
};

struct _edwinspireGSMMODEMModemGSMClass {
	edwinspirePortsModemClass parent_class;
};


GType edwinspire_gsm_modem_phone_activity_status_get_type (void) G_GNUC_CONST;
GType edwinspire_gsm_modem_expanded_error_message_get_type (void) G_GNUC_CONST;
GType edwinspire_gsm_modem_modem_model_get_type (void) G_GNUC_CONST;
GType edwinspire_gsm_modem_phone_book_memory_storage_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMPhoneBookMemoryStorage edwinspire_gsm_modem_phone_book_memory_storage_FromString (const gchar* pbms);
gchar* edwinspire_gsm_modem_phone_book_memory_storage_ToString (edwinspireGSMMODEMPhoneBookMemoryStorage self);
GType edwinspire_gsm_modem_pbms_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMPBMS* edwinspire_gsm_modem_pbms_dup (const edwinspireGSMMODEMPBMS* self);
void edwinspire_gsm_modem_pbms_free (edwinspireGSMMODEMPBMS* self);
void edwinspire_gsm_modem_pbms_init (edwinspireGSMMODEMPBMS *self);
GType edwinspire_gsm_modem_cpbws_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMCPBWS* edwinspire_gsm_modem_cpbws_dup (const edwinspireGSMMODEMCPBWS* self);
void edwinspire_gsm_modem_cpbws_free (edwinspireGSMMODEMCPBWS* self);
void edwinspire_gsm_modem_cpbws_copy (const edwinspireGSMMODEMCPBWS* self, edwinspireGSMMODEMCPBWS* dest);
void edwinspire_gsm_modem_cpbws_destroy (edwinspireGSMMODEMCPBWS* self);
void edwinspire_gsm_modem_cpbws_init (edwinspireGSMMODEMCPBWS *self);
GType edwinspire_gsm_modem_sms_status_get_type (void) G_GNUC_CONST;
GType edwinspire_gsm_modem_isms_get_type (void) G_GNUC_CONST;
const gchar* edwinspire_gsm_modem_isms_get_Phone (edwinspireGSMMODEMiSMS* self);
void edwinspire_gsm_modem_isms_set_Phone (edwinspireGSMMODEMiSMS* self, const gchar* value);
const gchar* edwinspire_gsm_modem_isms_get_Text (edwinspireGSMMODEMiSMS* self);
void edwinspire_gsm_modem_isms_set_Text (edwinspireGSMMODEMiSMS* self, const gchar* value);
guint edwinspire_gsm_modem_isms_get_Index (edwinspireGSMMODEMiSMS* self);
void edwinspire_gsm_modem_isms_set_Index (edwinspireGSMMODEMiSMS* self, guint value);
edwinspireGSMMODEMSMS_Status edwinspire_gsm_modem_isms_get_Status (edwinspireGSMMODEMiSMS* self);
void edwinspire_gsm_modem_isms_set_Status (edwinspireGSMMODEMiSMS* self, edwinspireGSMMODEMSMS_Status value);
edwinspirePDUDatetime* edwinspire_gsm_modem_isms_get_DateTime (edwinspireGSMMODEMiSMS* self);
void edwinspire_gsm_modem_isms_set_DateTime (edwinspireGSMMODEMiSMS* self, edwinspirePDUDatetime* value);
GType edwinspire_gsm_modem_submit_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMSubmit* edwinspire_gsm_modem_submit_new (void);
edwinspireGSMMODEMSubmit* edwinspire_gsm_modem_submit_construct (GType object_type);
GType edwinspire_gsm_modem_deliver_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMDeliver* edwinspire_gsm_modem_deliver_new (void);
edwinspireGSMMODEMDeliver* edwinspire_gsm_modem_deliver_construct (GType object_type);
GType edwinspire_gsm_modem_char_set_get_type (void) G_GNUC_CONST;
gchar* edwinspire_gsm_modem_char_set_ToString (edwinspireGSMMODEMCharSet self);
GType edwinspire_gsm_modem_battery_charge_get_type (void) G_GNUC_CONST;
GType edwinspire_gsm_modem_battery_connection_status_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMBatteryCharge* edwinspire_gsm_modem_battery_charge_dup (const edwinspireGSMMODEMBatteryCharge* self);
void edwinspire_gsm_modem_battery_charge_free (edwinspireGSMMODEMBatteryCharge* self);
void edwinspire_gsm_modem_battery_charge_init (edwinspireGSMMODEMBatteryCharge *self, edwinspireGSMMODEMBatteryConnectionStatus BatteryConnectionStatus, gint BatteryChargeLevel);
GType edwinspire_gsm_modem_mode_get_type (void) G_GNUC_CONST;
gchar* edwinspire_gsm_modem_sms_status_ToString (edwinspireGSMMODEMSMS_Status self);
GType edwinspire_gsm_modem_signal_quality_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMSignalQuality* edwinspire_gsm_modem_signal_quality_dup (const edwinspireGSMMODEMSignalQuality* self);
void edwinspire_gsm_modem_signal_quality_free (edwinspireGSMMODEMSignalQuality* self);
void edwinspire_gsm_modem_signal_quality_init (edwinspireGSMMODEMSignalQuality *self, gint rssi, gint cber);
GType edwinspire_gsm_modem_network_registration_unsolicited_result_code_get_type (void) G_GNUC_CONST;
GType edwinspire_gsm_modem_network_registration_status_get_type (void) G_GNUC_CONST;
GType edwinspire_gsm_modem_network_registration_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMNetworkRegistration* edwinspire_gsm_modem_network_registration_dup (const edwinspireGSMMODEMNetworkRegistration* self);
void edwinspire_gsm_modem_network_registration_free (edwinspireGSMMODEMNetworkRegistration* self);
void edwinspire_gsm_modem_network_registration_init (edwinspireGSMMODEMNetworkRegistration *self);
GType edwinspire_gsm_modem_features_modem_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMFeaturesModem* edwinspire_gsm_modem_features_modem_new (void);
edwinspireGSMMODEMFeaturesModem* edwinspire_gsm_modem_features_modem_construct (GType object_type);
gchar* edwinspire_gsm_modem_features_modem_ChecksumModel (edwinspireGSMMODEMFeaturesModem* self);
gchar* edwinspire_gsm_modem_features_modem_ToString (edwinspireGSMMODEMFeaturesModem* self);
GType edwinspire_gsm_modem_modem_gsm_get_type (void) G_GNUC_CONST;
edwinspireGSMMODEMModemGSM* edwinspire_gsm_modem_modem_gsm_new (void);
edwinspireGSMMODEMModemGSM* edwinspire_gsm_modem_modem_gsm_construct (GType object_type);
void edwinspire_gsm_modem_modem_gsm_GetFeatures (edwinspireGSMMODEMModemGSM* self);
GeeArrayList* edwinspire_gsm_modem_modem_gsm_SMS_SEND_ON_SLICES (edwinspireGSMMODEMModemGSM* self, const gchar* phone, const gchar* Message, gboolean statusreport, gboolean enableMessageClass, edwinspirePDUDCS_MESSAGE_CLASS msgclass, gint maxPortions);
gint edwinspire_gsm_modem_modem_gsm_SMS_SEND (edwinspireGSMMODEMModemGSM* self, const gchar* phone, const gchar* Message, gboolean statusreport, gboolean enableMessageClass, edwinspirePDUDCS_MESSAGE_CLASS msgclass);
gint edwinspire_gsm_modem_modem_gsm_SMS_SEND_PDU (edwinspireGSMMODEMModemGSM* self, const gchar* phone, const gchar* Message, gboolean statusreport, edwinspirePDUDCS_MESSAGE_CLASS msgclass);
gint edwinspire_gsm_modem_modem_gsm_SMS_WRITE_PDU (edwinspireGSMMODEMModemGSM* self, const gchar* phone, const gchar* Message, gboolean statusreport, edwinspirePDUDCS_MESSAGE_CLASS msgclass);
gint edwinspire_gsm_modem_modem_gsm_CMGW_PDU (edwinspireGSMMODEMModemGSM* self, gint LengthPDU, const gchar* PDU);
gint edwinspire_gsm_modem_modem_gsm_CMGS_PDU (edwinspireGSMMODEMModemGSM* self, gint LengthPDU, const gchar* PDU);
edwinspireGSMMODEMMode edwinspire_gsm_modem_modem_gsm_MessageFormat_Support (edwinspireGSMMODEMModemGSM* self);
edwinspireGSMMODEMMode edwinspire_gsm_modem_modem_gsm_CMGF_Support (edwinspireGSMMODEMModemGSM* self);
GeeHashSet* edwinspire_gsm_modem_modem_gsm_CharSet_Support (edwinspireGSMMODEMModemGSM* self);
gboolean edwinspire_gsm_modem_modem_gsm_CPBW (edwinspireGSMMODEMModemGSM* self, gint index, const gchar* number, gint type, const gchar* name);
void edwinspire_gsm_modem_modem_gsm_CPBW_Support (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMCPBWS* result);
GeeHashSet* edwinspire_gsm_modem_modem_gsm_CSCS_Support (edwinspireGSMMODEMModemGSM* self);
gboolean edwinspire_gsm_modem_modem_gsm_CPBS_Set_from_text (edwinspireGSMMODEMModemGSM* self, const gchar* cs);
gboolean edwinspire_gsm_modem_modem_gsm_CPBS_Set (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMPhoneBookMemoryStorage pbms);
void edwinspire_gsm_modem_modem_gsm_CPBS (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMPBMS* result);
GeeHashSet* edwinspire_gsm_modem_modem_gsm_CPBS_Support (edwinspireGSMMODEMModemGSM* self);
edwinspireGSMMODEMPhoneActivityStatus edwinspire_gsm_modem_modem_gsm_PhoneActivityStatus (edwinspireGSMMODEMModemGSM* self);
edwinspireGSMMODEMPhoneActivityStatus edwinspire_gsm_modem_modem_gsm_CPAS (edwinspireGSMMODEMModemGSM* self);
edwinspireGSMMODEMCharSet edwinspire_gsm_modem_modem_gsm_ModemCharSetToEnum (const gchar* cset);
edwinspireGSMMODEMCharSet edwinspire_gsm_modem_modem_gsm_CSCS (edwinspireGSMMODEMModemGSM* self);
GeeArrayList* edwinspire_gsm_modem_modem_gsm_ListMessages (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMSMS_Status Status);
GeeArrayList* edwinspire_gsm_modem_modem_gsm_ListMessages_All (edwinspireGSMMODEMModemGSM* self);
edwinspireGSMMODEMiSMS* edwinspire_gsm_modem_modem_gsm_CMGR (edwinspireGSMMODEMModemGSM* self, guint index);
GeeArrayList* edwinspire_gsm_modem_modem_gsm_CMGL (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMSMS_Status Status);
gchar* edwinspire_gsm_modem_modem_gsm_ConvertTextFromModemCharSet (const gchar* text, edwinspireGSMMODEMCharSet cs);
GeeHashSet* edwinspire_gsm_modem_modem_gsm_ListMessagesIndex (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMSMS_Status Status);
GeeHashSet* edwinspire_gsm_modem_modem_gsm_CMGL_only_index (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMSMS_Status Status);
GeeHashSet* edwinspire_gsm_modem_modem_gsm_ListMessagesSupport (edwinspireGSMMODEMModemGSM* self);
GeeHashSet* edwinspire_gsm_modem_modem_gsm_CMGL_Support (edwinspireGSMMODEMModemGSM* self);
gboolean edwinspire_gsm_modem_modem_gsm_MessageFormat_Set (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMMode mode);
gboolean edwinspire_gsm_modem_modem_gsm_CMGF_Set (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMMode Mode_);
gboolean edwinspire_gsm_modem_modem_gsm_CSCS_Set_from_text (edwinspireGSMMODEMModemGSM* self, const gchar* cs);
gboolean edwinspire_gsm_modem_modem_gsm_CSCS_Set (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMCharSet cs);
gboolean edwinspire_gsm_modem_modem_gsm_ExpandedErrorMessage_Set (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMExpandedErrorMessage messageerror);
gboolean edwinspire_gsm_modem_modem_gsm_CMEE_Set (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMExpandedErrorMessage messageerror);
gboolean edwinspire_gsm_modem_modem_gsm_TerminateCall (edwinspireGSMMODEMModemGSM* self);
gboolean edwinspire_gsm_modem_modem_gsm_CHUP (edwinspireGSMMODEMModemGSM* self);
edwinspireGSMMODEMModemModel edwinspire_gsm_modem_modem_gsm_GetModel (edwinspireGSMMODEMModemGSM* self);
gboolean edwinspire_gsm_modem_modem_gsm_StringInit (edwinspireGSMMODEMModemGSM* self, const gchar* initat);
void edwinspire_gsm_modem_modem_gsm_BatteryCharge (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMBatteryCharge* result);
void edwinspire_gsm_modem_modem_gsm_CBC (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMBatteryCharge* result);
GeeHashSet* edwinspire_gsm_modem_modem_gsm_ListAllAvailableATCommands (edwinspireGSMMODEMModemGSM* self);
GeeHashSet* edwinspire_gsm_modem_modem_gsm_CLAC (edwinspireGSMMODEMModemGSM* self);
void edwinspire_gsm_modem_modem_gsm_SignalQuality (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMSignalQuality* result);
void edwinspire_gsm_modem_modem_gsm_CSQ (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMSignalQuality* result);
void edwinspire_gsm_modem_modem_gsm_CREG (edwinspireGSMMODEMModemGSM* self, edwinspireGSMMODEMNetworkRegistration* result);
gchar* edwinspire_gsm_modem_modem_gsm_RequestRevisionIdentification (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_CGMR (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_RequestManufaturerIdentification (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_RequestModelIdentification (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_CGMM (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_CGMI (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_CGSN (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_ProductSerialNumberIdentification (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_IMEI (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_InternationalMobileSubscriberIdentity (edwinspireGSMMODEMModemGSM* self);
gchar* edwinspire_gsm_modem_modem_gsm_CIMI (edwinspireGSMMODEMModemGSM* self);
gboolean edwinspire_gsm_modem_modem_gsm_MODE (edwinspireGSMMODEMModemGSM* self, gint mode);
gboolean edwinspire_gsm_modem_modem_gsm_CallingLineIdentificationPresentation (edwinspireGSMMODEMModemGSM* self, gboolean active);
gboolean edwinspire_gsm_modem_modem_gsm_CLIP (edwinspireGSMMODEMModemGSM* self, gboolean Active);
gboolean edwinspire_gsm_modem_modem_gsm_DeleteMessage (edwinspireGSMMODEMModemGSM* self, guint msg_reference);
gboolean edwinspire_gsm_modem_modem_gsm_CMGD (edwinspireGSMMODEMModemGSM* self, guint MessageReference);
edwinspireGSMMODEMMode edwinspire_gsm_modem_modem_gsm_MessageFormat (edwinspireGSMMODEMModemGSM* self);
edwinspireGSMMODEMMode edwinspire_gsm_modem_modem_gsm_CMGF (edwinspireGSMMODEMModemGSM* self);
gint edwinspire_gsm_modem_modem_gsm_SMS_SEND_TXT (edwinspireGSMMODEMModemGSM* self, const gchar* Phone, const gchar* Message);
gint edwinspire_gsm_modem_modem_gsm_CMGW_TXT (edwinspireGSMMODEMModemGSM* self, const gchar* Phone, const gchar* Message);
gint edwinspire_gsm_modem_modem_gsm_CMGS_TXT (edwinspireGSMMODEMModemGSM* self, const gchar* Phone, const gchar* Message);


G_END_DECLS

#endif
