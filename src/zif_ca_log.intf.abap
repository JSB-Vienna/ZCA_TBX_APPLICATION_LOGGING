"! <p class="shorttext synchronized" lang="en">CA-TBX: Business Application Logging (BAL)</p>
INTERFACE zif_ca_log PUBLIC.
* i n s t a n c e   a t t r i b u t e s
  DATA:
*   o b j e c t   r e f e r e n c e s
    "! <p class="shorttext synchronized" lang="en">Constants and value checks for application log</p>
    mo_log_options          TYPE REF TO zcl_ca_c_log READ-ONLY.

* i n s t a n c e   m e t h o d s
  METHODS:
    "! <p class="shorttext synchronized" lang="en">Add single message using message variables</p>
    "!
    "! @parameter iv_msgty     | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
    "! @parameter iv_msgid     | <p class="shorttext synchronized" lang="en">ABAP System Field: Message ID</p>
    "! @parameter iv_msgno     | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Number</p>
    "! @parameter iv_msgv1     | <p class="shorttext synchronized" lang="en">Message variable 1</p>
    "! @parameter iv_msgv2     | <p class="shorttext synchronized" lang="en">Message variable 2</p>
    "! @parameter iv_msgv3     | <p class="shorttext synchronized" lang="en">Message variable 3</p>
    "! @parameter iv_msgv4     | <p class="shorttext synchronized" lang="en">Message variable 4</p>
    "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
    "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
    "! @parameter is_srcpos    | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
    add_msg
      IMPORTING
        iv_msgty     TYPE syst_msgty DEFAULT zcl_ca_c_log=>msg_type-error
        iv_msgid     TYPE syst_msgid OPTIONAL
        iv_msgno     TYPE syst_msgno DEFAULT '000'
        iv_msgv1     TYPE csequence  OPTIONAL
        iv_msgv2     TYPE csequence  OPTIONAL
        iv_msgv3     TYPE csequence  OPTIONAL
        iv_msgv4     TYPE csequence  OPTIONAL
        iv_probclass TYPE balprobcl  OPTIONAL
        iv_detlevel  TYPE ballevel   OPTIONAL
        is_srcpos    TYPE zca_s_excep_srcpos OPTIONAL,

    "! <p class="shorttext synchronized" lang="en">Add message from structure BAL_S_MSG</p>
    "!
    "! @parameter is_msg    | <p class="shorttext synchronized" lang="en">Application Log: Message Data</p>
    "! @parameter is_srcpos | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
    add_msg_bal
      IMPORTING
        is_msg    TYPE bal_s_msg
        is_srcpos TYPE zca_s_excep_srcpos OPTIONAL,

    "! <p class="shorttext synchronized" lang="en">Add messages from tabletype ACO_TT_BAL_MSG</p>
    "!
    "! @parameter it_msg | <p class="shorttext synchronized" lang="en">Message Log</p>
    add_msg_bal_tab
      IMPORTING
        it_msg TYPE aco_tt_bal_msg,

    "! <p class="shorttext synchronized" lang="en">Add message from structure BAPIRET2</p>
    "!
    "! @parameter is_bapiret2  | <p class="shorttext synchronized" lang="en">Return Parameter</p>
    "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
    "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
    "! @parameter is_srcpos    | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
    add_msg_bapiret2
      IMPORTING
        is_bapiret2  TYPE bapiret2
        iv_probclass TYPE balprobcl OPTIONAL
        iv_detlevel  TYPE ballevel  OPTIONAL
        is_srcpos    TYPE zca_s_excep_srcpos OPTIONAL,

    "! <p class="shorttext synchronized" lang="en">Add messages from tabletype BAPIRET2_T</p>
    "!
    "! @parameter it_bapiret2  | <p class="shorttext synchronized" lang="en">Return table</p>
    "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
    "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
    "! @parameter is_srcpos    | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
    add_msg_bapiret2_tab
      IMPORTING
        it_bapiret2  TYPE bapiret2_t
        iv_probclass TYPE balprobcl OPTIONAL
        iv_detlevel  TYPE ballevel  OPTIONAL
        is_srcpos    TYPE zca_s_excep_srcpos OPTIONAL,

    "! <p class="shorttext synchronized" lang="en">Add message from exception class</p>
    "!
    "! @parameter ix_excep     | <p class="shorttext synchronized" lang="en">Catched exception</p>
    "! @parameter iv_all       | <p class="shorttext synchronized" lang="en">X = Append all previous messages</p>
    "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
    "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
    add_msg_exc
      IMPORTING
        ix_excep     TYPE REF TO cx_root
        iv_all       TYPE abap_bool DEFAULT abap_false
        iv_probclass TYPE balprobcl OPTIONAL
        iv_detlevel  TYPE ballevel  OPTIONAL,

    "! <p class="shorttext synchronized" lang="en">Add message from structure SYST</p>
    "!
    "! @parameter iv_probclass | <p class="shorttext synchronized" lang="en">Application log: Message problem class</p>
    "! @parameter iv_detlevel  | <p class="shorttext synchronized" lang="en">Application Log: Level of detail</p>
    "! @parameter is_srcpos    | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
    add_msg_syst
      IMPORTING
        iv_probclass TYPE balprobcl OPTIONAL
        iv_detlevel  TYPE ballevel  OPTIONAL
        is_srcpos    TYPE zca_s_excep_srcpos OPTIONAL,

    "! <p class="shorttext synchronized" lang="en">Close log</p>
    close,

    "! <p class="shorttext synchronized" lang="en">Display log</p>
    "!
    "! @parameter io_parent      | <p class="shorttext synchronized" lang="en">Parent container to display log in-place</p>
    "! @parameter iv_title       | <p class="shorttext synchronized" lang="en">Application Log: Dynpro Title</p>
    "! @parameter iv_use_grid    | <p class="shorttext synchronized" lang="en">X = Display as grid</p>
    "! @parameter iv_popup       | <p class="shorttext synchronized" lang="en">X = Display as popup</p>
    "! @parameter iv_disp_srcpos | <p class="shorttext synchronized" lang="en">X = Display source code position of exception</p>
    "! @parameter iv_opt_cwidth  | <p class="shorttext synchronized" lang="en">X = Optimize column width</p>
    "! @parameter iv_show_all    | <p class="shorttext synchronized" lang="en">X = Show all messages</p>
    "! @parameter is_profile     | <p class="shorttext synchronized" lang="en">Application Log: Log Output Format Profile</p>
    display
      IMPORTING
        io_parent      TYPE REF TO cl_gui_container OPTIONAL
        iv_title       TYPE baltitle   OPTIONAL
        iv_use_grid    TYPE abap_bool  DEFAULT abap_true
        iv_popup       TYPE abap_bool  DEFAULT abap_false
        iv_disp_srcpos TYPE abap_bool  DEFAULT abap_false
        iv_opt_cwidth  TYPE abap_bool  DEFAULT abap_true
        iv_show_all    TYPE abap_bool  DEFAULT abap_false
        is_profile     TYPE bal_s_prof OPTIONAL,

    "! <p class="shorttext synchronized" lang="en">Get current external number</p>
    "!
    "! @parameter rv_extnumber | <p class="shorttext synchronized" lang="en">Application Log: External ID</p>
    get_ext_number
      RETURNING
        VALUE(rv_extnumber) TYPE balnrext,

    "! <p class="shorttext synchronized" lang="en">Get number of all BAL messages depending on message type</p>
    "!
    "! @parameter iv_msgty  | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
    "! @parameter rv_result | <p class="shorttext synchronized" lang="en">Number of message found</p>
    get_msg_count
      IMPORTING
        iv_msgty         TYPE syst_msgty OPTIONAL
      RETURNING
        VALUE(rv_result) TYPE i,

    "! <p class="shorttext synchronized" lang="en">Get all messages from BAL (table type ACO_TT_BAL_MSG)</p>
    "!
    "! @parameter iv_msgty | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
    "! @parameter rt_data  | <p class="shorttext synchronized" lang="en">Message Log</p>
    get_msg_list_bal
      IMPORTING
        iv_msgty       TYPE symsgty OPTIONAL
      RETURNING
        VALUE(rt_data) TYPE aco_tt_bal_msg,

    "! <p class="shorttext synchronized" lang="en">Get messages from BAL and convert into BAPIRET2 format</p>
    "!
    "! @parameter iv_msgty | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
    "! @parameter rt_data  | <p class="shorttext synchronized" lang="en">Return table</p>
    get_msg_list_bapiret2
      IMPORTING
        iv_msgty       TYPE symsgty OPTIONAL
      RETURNING
        VALUE(rt_data) TYPE bapiret2_t,

    "! <p class="shorttext synchronized" lang="en">Get prepared display profile</p>
    "!
    "! @parameter iv_use_grid    | <p class="shorttext synchronized" lang="en">X = Display as grid</p>
    "! @parameter iv_title       | <p class="shorttext synchronized" lang="en">Application Log: Dynpro Title</p>
    "! @parameter iv_popup       | <p class="shorttext synchronized" lang="en">X = Display as popup</p>
    "! @parameter iv_disp_srcpos | <p class="shorttext synchronized" lang="en">X = Display source code position of exception</p>
    "! @parameter iv_opt_cwidth  | <p class="shorttext synchronized" lang="en">X = Optimize column width</p>
    "! @parameter iv_show_all    | <p class="shorttext synchronized" lang="en">X = Show all messages</p>
    "! @parameter result         | <p class="shorttext synchronized" lang="en">Application Log: Log Output Format Profile</p>
    get_profile
      IMPORTING
        iv_use_grid    TYPE abap_bool DEFAULT abap_true
        iv_title       TYPE baltitle  OPTIONAL
        iv_popup       TYPE abap_bool DEFAULT abap_false
        iv_disp_srcpos TYPE abap_bool DEFAULT abap_false
        iv_opt_cwidth  TYPE abap_bool DEFAULT abap_true
        iv_show_all    TYPE abap_bool DEFAULT abap_false
      RETURNING
        VALUE(result)  TYPE bal_s_prof,

    "! <p class="shorttext synchronized" lang="en">Delete instance from buffer (closes log)</p>
    "!
    "! @parameter iv_save        | <p class="shorttext synchronized" lang="en">X = Save log</p>
    "! @parameter iv_in_upd_task | <p class="shorttext synchronized" lang="en">X = Save log in update task</p>
    release
      IMPORTING
        iv_save        TYPE abap_bool DEFAULT abap_true
        iv_in_upd_task TYPE abap_bool DEFAULT abap_false,

    "! <p class="shorttext synchronized" lang="en">Save all messages (optional with CLOSE)</p>
    "!
    "! @parameter iv_close       | <p class="shorttext synchronized" lang="en">X = Close log</p>
    "! @parameter iv_commit      | <p class="shorttext synchronized" lang="en">X = Execute commit work</p>
    "! @parameter iv_in_upd_task | <p class="shorttext synchronized" lang="en">X = Save log in update task</p>
    "! @parameter iv_no_empty    | <p class="shorttext synchronized" lang="en">X = Do not save empty logs</p>
    "! @parameter rv_lognumber   | <p class="shorttext synchronized" lang="en">Application log: log number</p>
    save
      IMPORTING
        iv_close            TYPE abap_bool DEFAULT abap_true
        iv_commit           TYPE abap_bool DEFAULT abap_true
        iv_in_upd_task      TYPE abap_bool DEFAULT abap_false
        iv_no_empty         TYPE abap_bool DEFAULT abap_true
          PREFERRED PARAMETER iv_close
      RETURNING
        VALUE(rv_lognumber) TYPE balognr,

    "! <p class="shorttext synchronized" lang="en">Set new external number</p>
    "!
    "! @parameter iv_extnumber | <p class="shorttext synchronized" lang="en">Application Log: External ID</p>
    set_ext_number
      IMPORTING
        iv_extnumber TYPE balnrext,

    "! <p class="shorttext synchronized" lang="en">Set additional reference object id</p>
    "!
    "! <p>Provide another business object key (= LS_LPOR) to find log entries to different objects. E. g. the
    "! leading object is the FI document, but it is required to find log entries also to the corresponding
    "! logistic invoice document. By default the business object key for the instantiation is always set.</p>
    "! <p>Parameter IV_ADD_KEY is to enhance the business object key to find entries e. g. for a specific
    "! action or workitem or ... .</p>
    "!
    "! @parameter is_lpor    | <p class="shorttext synchronized" lang="en">Additional object key</p>
    "! @parameter iv_add_key | <p class="shorttext synchronized" lang="en">Additional key of e. g. a subobject</p>
    set_additional_ref_object_id
      IMPORTING
        is_lpor    TYPE sibflporb
        iv_add_key TYPE zca_d_log_add_key OPTIONAL,

    "! <p class="shorttext synchronized" lang="en">Set source code position to message</p>
    "!
    "! @parameter is_msgh   | <p class="shorttext synchronized" lang="en">Application Log: Message handle</p>
    "! @parameter is_srcpos | <p class="shorttext synchronized" lang="en">Common object: Exception position in source code</p>
    set_source_position
      IMPORTING
        is_msgh   TYPE balmsghndl
        is_srcpos TYPE zca_s_excep_srcpos,

    "! <p class="shorttext synchronized" lang="en">Write all messages (use of WRITE command)</p>
    "!
    "! @parameter iv_msgty | <p class="shorttext synchronized" lang="en">ABAP System Field: Message Type</p>
    write
      IMPORTING
        iv_msgty TYPE syst_msgty OPTIONAL.

ENDINTERFACE.
