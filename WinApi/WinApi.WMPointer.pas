{******************************************************************************}
{                                                                              }
{ Windows IteractionContext API interface Unit for Object Pascal               }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) Microsoft Corporation.       }
{ All Rights Reserved.                                                         }
{                                                                              }
{ The original file is: WinUser.h, released July 2012. The original Pascal     }
{ code is: WinApi.WMPointer.pas, released August 2013. The initial developer   }
{ of the Pascal code is Andreas Hausladen.                                     }
{                                                                              }
{ Portions created by Andreas Hausladen are Copyright (C) 2013 Andreas         }
{ Hausladen. All Rights Reserved.                                              }
{                                                                              }
{ The contents of this file are used with permission, subject to the Mozilla   }
{ Public License Version 2.0 (the "License"); you may not use this file except }
{ in compliance with the License. You may obtain a copy of the License at      }
{ http://www.mozilla.org/MPL/2.0                                               }
{                                                                              }
{ Software distributed under the License is distributed on an "AS IS" basis,   }
{ WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for }
{ the specific language governing rights and limitations under the License.    }
{                                                                              }
{ Alternatively, the contents of this file may be used under the terms of the  }
{ GNU Lesser General Public License (the  "LGPL License"), in which case the   }
{ provisions of the LGPL License are applicable instead of those above.        }
{ If you wish to allow use of your version of this file only under the terms   }
{ of the LGPL License and not to allow others to use your version of this file }
{ under the MPL, indicate your decision by deleting  the provisions above and  }
{ replace  them with the notice and other provisions required by the LGPL      }
{ License.  If you do not delete the provisions above, a recipient may use     }
{ your version of this file under either the MPL or the LGPL License.          }
{                                                                              }
{ For more information about the LGPL: http://www.gnu.org/copyleft/lesser.html }
{                                                                              }
{******************************************************************************}

unit WinApi.WMPointer;

{ WinUser.h }

interface

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}

{$IF CompilerVersion >= 24.0} // Delphi XE3+
  {$LEGACYIFEND ON} // work around Error Insight
{$IFEND}

{$IF CompilerVersion >= 21.0} // Delphi 2010+
  {$DEFINE SUPPORTS_DELAYED}
  {$WARN SYMBOL_PLATFORM OFF}
{$IFEND}

uses
  {$IF CompilerVersion >= 23.0}
  WinApi.Windows, WinApi.Messages, WinApi.MultiMon;
  {$ELSE}
  Windows, Messages, MultiMon;
  {$IFEND}

//(*$HPPEMIT '  #include <WinUser.h>' *)

// missing types and macros (WinApi.Windows, XE4)
type
  {$IF not declared(PUINT32)}
  PUINT32 = ^UINT32;
  {$IFEND}
  {$IF not declared(PLONG)}
  PLONG = ^LONG;
  {$IFEND}

function GET_X_LPARAM(lParam: LPARAM): Integer; inline;
{$EXTERNALSYM GET_X_LPARAM}
function GET_Y_LPARAM(lParam: LPARAM): Integer; inline;
{$EXTERNALSYM GET_Y_LPARAM}
function GET_WHEEL_DELTA_WPARAM(wParam: WPARAM): SmallInt; inline;
{$EXTERNALSYM GET_WHEEL_DELTA_WPARAM}


// WINVER >= 0x0602
const
  {$EXTERNALSYM WM_POINTERDEVICECHANGE}
  WM_POINTERDEVICECHANGE         = $238;
  {$EXTERNALSYM WM_POINTERDEVICEINRANGE}
  WM_POINTERDEVICEINRANGE        = $239;
  {$EXTERNALSYM WM_POINTERDEVICEOUTOFRANGE}
  WM_POINTERDEVICEOUTOFRANGE     = $23A;

  {$EXTERNALSYM WM_NCPOINTERUPDATE}
  WM_NCPOINTERUPDATE             = $0241;
  {$EXTERNALSYM WM_NCPOINTERDOWN}
  WM_NCPOINTERDOWN               = $0242;
  {$EXTERNALSYM WM_NCPOINTERUP}
  WM_NCPOINTERUP                 = $0243;
  {$EXTERNALSYM WM_POINTERUPDATE}
  WM_POINTERUPDATE               = $0245;
  {$EXTERNALSYM WM_POINTERDOWN}
  WM_POINTERDOWN                 = $0246;
  {$EXTERNALSYM WM_POINTERUP}
  WM_POINTERUP                   = $0247;
  {$EXTERNALSYM WM_POINTERENTER}
  WM_POINTERENTER                = $0249;
  {$EXTERNALSYM WM_POINTERLEAVE}
  WM_POINTERLEAVE                = $024A;
  {$EXTERNALSYM WM_POINTERACTIVATE}
  WM_POINTERACTIVATE             = $024B;
  {$EXTERNALSYM WM_POINTERCAPTURECHANGED}
  WM_POINTERCAPTURECHANGED       = $024C;
  {$EXTERNALSYM WM_TOUCHHITTESTING}
  WM_TOUCHHITTESTING             = $024D;
  {$EXTERNALSYM WM_POINTERWHEEL}
  WM_POINTERWHEEL                = $024E;
  {$EXTERNALSYM WM_POINTERHWHEEL}
  WM_POINTERHWHEEL               = $024F;

const
  {$EXTERNALSYM PT_POINTER}
  PT_POINTER  = $00000001;   // Generic pointer
  {$EXTERNALSYM PT_TOUCH}
  PT_TOUCH    = $00000002;   // Touch
  {$EXTERNALSYM PT_PEN}
  PT_PEN      = $00000003;   // Pen
  {$EXTERNALSYM PT_MOUSE}
  PT_MOUSE    = $00000004;   // Mouse

type
  PPointerInputType = ^TPointerInputType;
  {$EXTERNALSYM POINTER_INPUT_TYPE}
  POINTER_INPUT_TYPE = type DWORD;
  TPointerInputType = POINTER_INPUT_TYPE;

  PPointerFlags = ^TPointerFlags;
  {$EXTERNALSYM POINTER_FLAGS}
  POINTER_FLAGS = type UINT32;
  TPointerFlags = POINTER_FLAGS;

const
  {$EXTERNALSYM POINTER_FLAG_NONE}
  POINTER_FLAG_NONE               = $00000000; // Default
  {$EXTERNALSYM POINTER_FLAG_NEW}
  POINTER_FLAG_NEW                = $00000001; // New pointer
  {$EXTERNALSYM POINTER_FLAG_INRANGE}
  POINTER_FLAG_INRANGE            = $00000002; // Pointer has not departed
  {$EXTERNALSYM POINTER_FLAG_INCONTACT}
  POINTER_FLAG_INCONTACT          = $00000004; // Pointer is in contact
  {$EXTERNALSYM POINTER_FLAG_FIRSTBUTTON}
  POINTER_FLAG_FIRSTBUTTON        = $00000010; // Primary action
  {$EXTERNALSYM POINTER_FLAG_SECONDBUTTON}
  POINTER_FLAG_SECONDBUTTON       = $00000020; // Secondary action
  {$EXTERNALSYM POINTER_FLAG_THIRDBUTTON}
  POINTER_FLAG_THIRDBUTTON        = $00000040; // Third button
  {$EXTERNALSYM POINTER_FLAG_FOURTHBUTTON}
  POINTER_FLAG_FOURTHBUTTON       = $00000080; // Fourth button
  {$EXTERNALSYM POINTER_FLAG_FIFTHBUTTON}
  POINTER_FLAG_FIFTHBUTTON        = $00000100; // Fifth button
  {$EXTERNALSYM POINTER_FLAG_PRIMARY}
  POINTER_FLAG_PRIMARY            = $00002000; // Pointer is primary
  {$EXTERNALSYM POINTER_FLAG_CONFIDENCE}
  POINTER_FLAG_CONFIDENCE         = $00004000; // Pointer is considered unlikely to be accidental
  {$EXTERNALSYM POINTER_FLAG_CANCELED}
  POINTER_FLAG_CANCELED           = $00008000; // Pointer is departing in an abnormal manner
  {$EXTERNALSYM POINTER_FLAG_DOWN}
  POINTER_FLAG_DOWN               = $00010000; // Pointer transitioned to down state (made contact)
  {$EXTERNALSYM POINTER_FLAG_UPDATE}
  POINTER_FLAG_UPDATE             = $00020000; // Pointer update
  {$EXTERNALSYM POINTER_FLAG_UP}
  POINTER_FLAG_UP                 = $00040000; // Pointer transitioned from down state (broke contact)
  {$EXTERNALSYM POINTER_FLAG_WHEEL}
  POINTER_FLAG_WHEEL              = $00080000; // Vertical wheel
  {$EXTERNALSYM POINTER_FLAG_HWHEEL}
  POINTER_FLAG_HWHEEL             = $00100000; // Horizontal wheel
  {$EXTERNALSYM POINTER_FLAG_CAPTURECHANGED}
  POINTER_FLAG_CAPTURECHANGED     = $00200000; // Lost capture

{*
 * Pointer info key states defintions.
 *}
  POINTER_MOD_SHIFT   = $0004;    // Shift key is held down.
  POINTER_MOD_CTRL    = $0008;    // Ctrl key is held down.

type
  {$EXTERNALSYM tagPOINTER_BUTTON_CHANGE_TYPE}
  tagPOINTER_BUTTON_CHANGE_TYPE = (
    POINTER_CHANGE_NONE,
    POINTER_CHANGE_FIRSTBUTTON_DOWN,
    POINTER_CHANGE_FIRSTBUTTON_UP,
    POINTER_CHANGE_SECONDBUTTON_DOWN,
    POINTER_CHANGE_SECONDBUTTON_UP,
    POINTER_CHANGE_THIRDBUTTON_DOWN,
    POINTER_CHANGE_THIRDBUTTON_UP,
    POINTER_CHANGE_FOURTHBUTTON_DOWN,
    POINTER_CHANGE_FOURTHBUTTON_UP,
    POINTER_CHANGE_FIFTHBUTTON_DOWN,
    POINTER_CHANGE_FIFTHBUTTON_UP
  );
  TPointerButtonChangeType = tagPOINTER_BUTTON_CHANGE_TYPE;
  {$EXTERNALSYM POINTER_BUTTON_CHANGE_TYPE}
  POINTER_BUTTON_CHANGE_TYPE = tagPOINTER_BUTTON_CHANGE_TYPE;

  PPointerInfo = ^TPointerInfo;
  {$EXTERNALSYM tagPOINTER_INFO}
  tagPOINTER_INFO = record
    pointerType: TPointerInputType;
    pointerId: UINT32;
    frameId: UINT32;
    pointerFlags: TPointerFlags;
    sourceDevice: THandle;
    hwndTarget: HWND;
    ptPixelLocation: TPoint;
    ptHimetricLocation: TPoint;
    ptPixelLocationRaw: TPoint;
    ptHimetricLocationRaw: TPoint;
    dwTime: DWORD;
    historyCount: UINT32;
    InputData: INT32;
    dwKeyStates: DWORD;
    PerformanceCount: UINT64;
    ButtonChangeType: TPointerButtonChangeType;
  end;
  TPointerInfo = tagPOINTER_INFO;
  {$EXTERNALSYM POINTER_INFO}
  POINTER_INFO = tagPOINTER_INFO;

  PTouchFlags = ^TTouchFlags;
  {$EXTERNALSYM TOUCH_FLAGS}
  TOUCH_FLAGS = type UINT32;
  TTouchFlags = TOUCH_FLAGS;

const
  {$EXTERNALSYM TOUCH_FLAG_NONE}
  TOUCH_FLAG_NONE                 = $00000000; // Default

type
  PTouchMask = ^TTouchMask;
  {$EXTERNALSYM TOUCH_MASK}
  TOUCH_MASK = type UINT32;
  TTouchMask = TOUCH_MASK;

const
  {$EXTERNALSYM TOUCH_MASK_NONE}
  TOUCH_MASK_NONE                 = $00000000; // Default - none of the optional fields are valid
  {$EXTERNALSYM TOUCH_MASK_CONTACTAREA}
  TOUCH_MASK_CONTACTAREA          = $00000001; // The rcContact field is valid
  {$EXTERNALSYM TOUCH_MASK_ORIENTATION}
  TOUCH_MASK_ORIENTATION          = $00000002; // The orientation field is valid
  {$EXTERNALSYM TOUCH_MASK_PRESSURE}
  TOUCH_MASK_PRESSURE             = $00000004; // The pressure field is valid

type
  PPointerTouchInfo = ^TPointerTouchInfo;
  {$EXTERNALSYM tagPOINTER_TOUCH_INFO}
  tagPOINTER_TOUCH_INFO = record
    pointerInfo: TPointerInfo;
    touchFlags: TTouchFlags;
    touchMask: TTouchMask;
    rcContact: TRect;
    rcContactRaw: TRect;
    orientation: UINT32;
    pressure: UINT32;
  end;
  TPointerTouchInfo = tagPOINTER_TOUCH_INFO;
  {$EXTERNALSYM POINTER_TOUCH_INFO}
  POINTER_TOUCH_INFO = tagPOINTER_TOUCH_INFO;

  PPenFlags = ^TPenFlags;
  {$EXTERNALSYM PEN_FLAGS}
  PEN_FLAGS = type UINT32;
  TPenFlags = PEN_FLAGS;

const
  {$EXTERNALSYM PEN_FLAG_NONE}
  PEN_FLAG_NONE                   = $00000000; // Default
  {$EXTERNALSYM PEN_FLAG_BARREL}
  PEN_FLAG_BARREL                 = $00000001; // The barrel button is pressed
  {$EXTERNALSYM PEN_FLAG_INVERTED}
  PEN_FLAG_INVERTED               = $00000002; // The pen is inverted
  {$EXTERNALSYM PEN_FLAG_ERASER}
  PEN_FLAG_ERASER                 = $00000004; // The eraser button is pressed

type
  PPenMask = ^TPenMask;
  {$EXTERNALSYM PEN_MASK}
  PEN_MASK = type UINT32;
  TPenMask = PEN_MASK;

const
  {$EXTERNALSYM PEN_MASK_NONE}
  PEN_MASK_NONE                   = $00000000; // Default - none of the optional fields are valid
  {$EXTERNALSYM PEN_MASK_PRESSURE}
  PEN_MASK_PRESSURE               = $00000001; // The pressure field is valid
  {$EXTERNALSYM PEN_MASK_ROTATION}
  PEN_MASK_ROTATION               = $00000002; // The rotation field is valid
  {$EXTERNALSYM PEN_MASK_TILT_X}
  PEN_MASK_TILT_X                 = $00000004; // The tiltX field is valid
  {$EXTERNALSYM PEN_MASK_TILT_Y}
  PEN_MASK_TILT_Y                 = $00000008; // The tiltY field is valid

type
  PPointerPenInfo = ^TPointerPenInfo;
  {$EXTERNALSYM tagPOINTER_PEN_INFO}
  tagPOINTER_PEN_INFO = record
    pointerInfo: TPointerInfo;
    penFlags: TPenFlags;
    penMask: TPenMask;
    pressure: UINT32;
    rotation: UINT32;
    tiltX: INT32;
    tiltY: INT32;
  end;
  TPointerPenInfo = tagPOINTER_PEN_INFO;
  {$EXTERNALSYM POINTER_PEN_INFO}
  POINTER_PEN_INFO = tagPOINTER_PEN_INFO;

const
{*
 * Flags that appear in pointer input message parameters
 *}
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_NEW}
  POINTER_MESSAGE_FLAG_NEW                = $00000001; // New pointer
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_INRANGE}
  POINTER_MESSAGE_FLAG_INRANGE            = $00000002; // Pointer has not departed
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_INCONTACT}
  POINTER_MESSAGE_FLAG_INCONTACT          = $00000004; // Pointer is in contact
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_FIRSTBUTTON}
  POINTER_MESSAGE_FLAG_FIRSTBUTTON        = $00000010; // Primary action
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_SECONDBUTTON}
  POINTER_MESSAGE_FLAG_SECONDBUTTON       = $00000020; // Secondary action
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_THIRDBUTTON}
  POINTER_MESSAGE_FLAG_THIRDBUTTON        = $00000040; // Third button
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_FOURTHBUTTON}
  POINTER_MESSAGE_FLAG_FOURTHBUTTON       = $00000080; // Fourth button
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_FIFTHBUTTON}
  POINTER_MESSAGE_FLAG_FIFTHBUTTON        = $00000100; // Fifth button
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_PRIMARY}
  POINTER_MESSAGE_FLAG_PRIMARY            = $00002000; // Pointer is primary
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_CONFIDENCE}
  POINTER_MESSAGE_FLAG_CONFIDENCE         = $00004000; // Pointer is considered unlikely to be accidental
  {$EXTERNALSYM POINTER_MESSAGE_FLAG_CANCELED}
  POINTER_MESSAGE_FLAG_CANCELED           = $00008000; // Pointer is departing in an abnormal manner

{*
 * Macros to retrieve information from pointer input message parameters
 *}
function GET_POINTERID_WPARAM(wParam: WPARAM): Word; inline;
{$EXTERNALSYM GET_POINTERID_WPARAM}
function IS_POINTER_FLAG_SET_WPARAM(wParam: WPARAM; flag: UINT32): BOOL; inline;
{$EXTERNALSYM IS_POINTER_FLAG_SET_WPARAM}
function IS_POINTER_NEW_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_NEW_WPARAM}
function IS_POINTER_INRANGE_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_INRANGE_WPARAM}
function IS_POINTER_INCONTACT_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_INCONTACT_WPARAM}
function IS_POINTER_FIRSTBUTTON_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_FIRSTBUTTON_WPARAM}
function IS_POINTER_SECONDBUTTON_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_SECONDBUTTON_WPARAM}
function IS_POINTER_THIRDBUTTON_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_THIRDBUTTON_WPARAM}
function IS_POINTER_FOURTHBUTTON_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_FOURTHBUTTON_WPARAM}
function IS_POINTER_FIFTHBUTTON_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_FIFTHBUTTON_WPARAM}
function IS_POINTER_PRIMARY_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_PRIMARY_WPARAM}
function HAS_POINTER_CONFIDENCE_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM HAS_POINTER_CONFIDENCE_WPARAM}
function IS_POINTER_CANCELED_WPARAM(wParam: WPARAM): BOOL; inline;
{$EXTERNALSYM IS_POINTER_CANCELED_WPARAM}

const
{*
 * WM_POINTERACTIVATE return codes
 *}
  {$EXTERNALSYM PA_ACTIVATE}
  PA_ACTIVATE                     = MA_ACTIVATE;
  {$EXTERNALSYM PA_NOACTIVATE}
  PA_NOACTIVATE                   = MA_NOACTIVATE;


  {$EXTERNALSYM MAX_TOUCH_COUNT}
  MAX_TOUCH_COUNT = 256;

  {$EXTERNALSYM TOUCH_FEEDBACK_DEFAULT}
  TOUCH_FEEDBACK_DEFAULT = $1;
  {$EXTERNALSYM TOUCH_FEEDBACK_INDIRECT}
  TOUCH_FEEDBACK_INDIRECT = $2;
  {$EXTERNALSYM TOUCH_FEEDBACK_NONE}
  TOUCH_FEEDBACK_NONE = $3;

function InitializeTouchInjection(
    {_In_} maxCount: UINT32;
    {_In_} dwMode: DWORD): BOOL; stdcall;
{$EXTERNALSYM InitializeTouchInjection}

function InjectTouchInput(
    {_In_} count: UINT32;
    {_In_reads_(count)} const contacts: PPointerTouchInfo): BOOL; stdcall;
{$EXTERNALSYM InjectTouchInput}

function GetPointerType(
    {_In_} pointerId: UINT32;
    {_Out_} pointerType: PPointerInputType): BOOL; stdcall;
{$EXTERNALSYM GetPointerType}

function GetPointerCursorId(
    {_In_} pointerId: UINT32;
    {_Out_} cursorId: PUINT32): BOOL; stdcall;
{$EXTERNALSYM GetPointerCursorId}

function GetPointerInfo(
    {_In_} pointerId: UINT32;
    {_Out_writes_(1)} pointerInfo: PPointerInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerInfo}

function GetPointerInfoHistory(
    {_In_} pointerId: UINT32;
    {_Inout_} entriesCount: PUINT32;
    {_Out_writes_opt_(*entriesCount)} pointerInfo: PPointerInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerInfoHistory}

function GetPointerFrameInfo(
    {_In_} pointerId: UINT32;
    {_Inout_} pointerCount: PUINT32;
    {_Out_writes_opt_(*pointerCount)} pointerInfo: PPointerInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerFrameInfo}

function GetPointerFrameInfoHistory(
    {_In_} pointerId: UINT32;
    {_Inout_} entriesCount: PUINT32;
    {_Inout_} pointerCount: PUINT32;
    {_Out_writes_opt_(*entriesCount * *pointerCount)} pointerInfo: PPointerInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerFrameInfoHistory}

function GetPointerTouchInfo(
    {_In_} pointerId: UINT32;
    {_Out_writes_(1)} touchInfo: PPointerTouchInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerTouchInfo}

function GetPointerTouchInfoHistory(
    {_In_} pointerId: UINT32;
    {_Inout_} entriesCount: PUINT32;
    {_Out_writes_opt_(*entriesCount)} touchInfo: PPointerTouchInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerTouchInfoHistory}

function GetPointerFrameTouchInfo(
    {_In_} pointerId: UINT32;
    {_Inout_} pointerCount: PUINT32;
    {_Out_writes_opt_(*pointerCount)} touchInfo: PPointerTouchInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerFrameTouchInfo}

function GetPointerFrameTouchInfoHistory(
    {_In_} pointerId: UINT32;
    {_Inout_} entriesCount: PUINT32;
    {_Inout_} pointerCount: PUINT32;
    {_Out_writes_opt_(*entriesCount * *pointerCount)} touchInfo: PPointerTouchInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerFrameTouchInfoHistory}

function GetPointerPenInfo(
    {_In_} pointerId: UINT32;
    {_Out_writes_(1)} penInfo: PPointerPenInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerPenInfo}

function GetPointerPenInfoHistory(
    {_In_} pointerId: UINT32;
    {_Inout_} entriesCount: PUINT32;
    {_Out_writes_opt_(*entriesCount)} penInfo: PPointerPenInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerPenInfoHistory}

function GetPointerFramePenInfo(
    {_In_} pointerId: UINT32;
    {_Inout_} pointerCount: PUINT32;
    {_Out_writes_opt_(*pointerCount)} penInfo: PPointerPenInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerFramePenInfo}

function GetPointerFramePenInfoHistory(
    {_In_} pointerId: UINT32;
    {_Inout_} entriesCount: PUINT32;
    {_Inout_} pointerCount: PUINT32;
    {_Out_writes_opt_(*entriesCount * *pointerCount)} penInfo: PPointerPenInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerFramePenInfoHistory}

function SkipPointerFrameMessages(
  {_In_} pointerId: UINT32): BOOL; stdcall;
{$EXTERNALSYM SkipPointerFrameMessages}

function RegisterPointerInputTarget(
    {_In_} hwnd: HWND;
    {_In_} pointerType: TPointerInputType): BOOL; stdcall;
{$EXTERNALSYM RegisterPointerInputTarget}

function UnregisterPointerInputTarget(
    {_In_} hwnd: HWND;
    {_In_} pointerType: TPointerInputType): BOOL; stdcall;
{$EXTERNALSYM UnregisterPointerInputTarget}


function EnableMouseInPointer(
    {_In_} fEnable: BOOL): BOOL; stdcall;
{$EXTERNALSYM EnableMouseInPointer}

function IsMouseInPointerEnabled: BOOL; stdcall;
{$EXTERNALSYM IsMouseInPointerEnabled}


{ *********************
  * Touch Hit Testing *
  ********************* }
const
  TOUCH_HIT_TESTING_DEFAULT = $0;
  TOUCH_HIT_TESTING_CLIENT  = $1;
  TOUCH_HIT_TESTING_NONE    = $2;

function RegisterTouchHitTestingWindow(
    {_In_} hwnd: HWND;
    {_In_} value: ULONG): BOOL; stdcall;
{$EXTERNALSYM RegisterTouchHitTestingWindow}

type
  PTouchHitTestingProximityEvaluation = ^TTouchHitTestingProximityEvaluation;
  {$EXTERNALSYM tagTOUCH_HIT_TESTING_PROXIMITY_EVALUATION}
  tagTOUCH_HIT_TESTING_PROXIMITY_EVALUATION = record
    score: UINT16;
    adjustedPoint: TPoint;
  end;
  TTouchHitTestingProximityEvaluation = tagTOUCH_HIT_TESTING_PROXIMITY_EVALUATION;
  {$EXTERNALSYM TOUCH_HIT_TESTING_PROXIMITY_EVALUATION}
  TOUCH_HIT_TESTING_PROXIMITY_EVALUATION = tagTOUCH_HIT_TESTING_PROXIMITY_EVALUATION;
  {$EXTERNALSYM PTOUCH_HIT_TESTING_PROXIMITY_EVALUATION}
  PTOUCH_HIT_TESTING_PROXIMITY_EVALUATION = ^TOUCH_HIT_TESTING_PROXIMITY_EVALUATION;

{*
 * WM_TOUCHHITTESTING structure
*}
  {$EXTERNALSYM tagTOUCH_HIT_TESTING_INPUT}
  tagTOUCH_HIT_TESTING_INPUT = record
    pointerId: UINT32;
    point: TPoint;
    boundingBox: TRect;
    nonOccludedBoundingBox: TRect;
    orientation: UINT32;
  end;
  {$EXTERNALSYM TOUCH_HIT_TESTING_INPUT}
  TOUCH_HIT_TESTING_INPUT = tagTOUCH_HIT_TESTING_INPUT;
  {$EXTERNALSYM PTOUCH_HIT_TESTING_INPUT}
  PTOUCH_HIT_TESTING_INPUT = ^TOUCH_HIT_TESTING_INPUT;
  TTouchHitTestingInput = tagTOUCH_HIT_TESTING_INPUT;
  PTouchHitTestingInput = PTOUCH_HIT_TESTING_INPUT;

const
  {$EXTERNALSYM TOUCH_HIT_TESTING_PROXIMITY_CLOSEST}
  TOUCH_HIT_TESTING_PROXIMITY_CLOSEST  = $0;
  {$EXTERNALSYM TOUCH_HIT_TESTING_PROXIMITY_FARTHEST}
  TOUCH_HIT_TESTING_PROXIMITY_FARTHEST = $FFF;

function EvaluateProximityToRect(
    {_In_} const controlBoundingBox: PRect;
    {_In_} const pHitTestingInput: PTouchHitTestingInput;
    {_Out_} pProximityEval: PTouchHitTestingProximityEvaluation): BOOL; stdcall;
{$EXTERNALSYM EvaluateProximityToRect}

function EvaluateProximityToPolygon(numVertices: UINT32;
    {_In_reads_(numVertices)} const controlPolygon: PPoint;
    {_In_} const pHitTestingInput: PTouchHitTestingInput;
    {_Out_} pProximityEval: PTouchHitTestingProximityEvaluation): BOOL; stdcall;
{$EXTERNALSYM EvaluateProximityToPolygon}

function PackTouchHitTestingProximityEvaluation(
    {_In_} const pHitTestingInput: PTouchHitTestingInput;
    {_In_} const pProximityEval: PTouchHitTestingProximityEvaluation): LRESULT; stdcall;
{$EXTERNALSYM PackTouchHitTestingProximityEvaluation}


{ ********************************
  * Input Feedback Configuration *
  ******************************** }
type
  PFeedbackType = ^TFeedbackType;
  {$EXTERNALSYM tagFEEDBACK_TYPE}
  tagFEEDBACK_TYPE = (
    FEEDBACK_TOUCH_CONTACTVISUALIZATION = 1,
    FEEDBACK_PEN_BARRELVISUALIZATION    = 2,
    FEEDBACK_PEN_TAP                    = 3,
    FEEDBACK_PEN_DOUBLETAP              = 4,
    FEEDBACK_PEN_PRESSANDHOLD           = 5,
    FEEDBACK_PEN_RIGHTTAP               = 6,
    FEEDBACK_TOUCH_TAP                  = 7,
    FEEDBACK_TOUCH_DOUBLETAP            = 8,
    FEEDBACK_TOUCH_PRESSANDHOLD         = 9,
    FEEDBACK_TOUCH_RIGHTTAP             = 10,
    FEEDBACK_GESTURE_PRESSANDTAP        = 11,
    FEEDBACK_MAX                        = Integer($FFFFFFFF)
  );
  TFeedbackType = tagFEEDBACK_TYPE;
  {$EXTERNALSYM FEEDBACK_TYPE}
  FEEDBACK_TYPE = tagFEEDBACK_TYPE;

const
  {$EXTERNALSYM GWFS_INCLUDE_ANCESTORS}
  GWFS_INCLUDE_ANCESTORS           = $00000001;

function GetWindowFeedbackSetting(
    {_In_} hwnd: HWND;
    {_In_} feedback: TFeedbackType;
    {_In_} dwFlags: DWORD;
    {_Inout_} pSize: PUINT32;
    {_Out_writes_bytes_opt_(*pSize)} config: PVOID): BOOL; stdcall;
{$EXTERNALSYM GetWindowFeedbackSetting}

function SetWindowFeedbackSetting(
    {_In_} hwnd: HWND;
    {_In_} feedback: TFeedbackType;
    {_In_} dwFlags: DWORD;
    {_In_} size: UINT32;
    {_In_reads_bytes_opt_(size)} const configuration: PVOID): BOOL; stdcall;
{$EXTERNALSYM SetWindowFeedbackSetting}


{ ******************************
  * Pointer Device Input Stack *
  ****************************** }
const
  {$EXTERNALSYM POINTER_DEVICE_PRODUCT_STRING_MAX}
  POINTER_DEVICE_PRODUCT_STRING_MAX = 520;
{*
 * wParam values for WM_POINTERDEVICECHANGE
 *}
  {$EXTERNALSYM PDC_ARRIVAL}
  PDC_ARRIVAL                   = $001;
  {$EXTERNALSYM PDC_REMOVAL}
  PDC_REMOVAL                   = $002;
  {$EXTERNALSYM PDC_ORIENTATION_0}
  PDC_ORIENTATION_0             = $004;
  {$EXTERNALSYM PDC_ORIENTATION_90}
  PDC_ORIENTATION_90            = $008;
  {$EXTERNALSYM PDC_ORIENTATION_180}
  PDC_ORIENTATION_180           = $010;
  {$EXTERNALSYM PDC_ORIENTATION_270}
  PDC_ORIENTATION_270           = $020;
  {$EXTERNALSYM PDC_MODE_DEFAULT}
  PDC_MODE_DEFAULT              = $040;
  {$EXTERNALSYM PDC_MODE_CENTERED}
  PDC_MODE_CENTERED             = $080;
  {$EXTERNALSYM PDC_MAPPING_CHANGE}
  PDC_MAPPING_CHANGE            = $100;
  {$EXTERNALSYM PDC_RESOLUTION}
  PDC_RESOLUTION                = $200;
  {$EXTERNALSYM PDC_ORIGIN}
  PDC_ORIGIN                    = $400;
  {$EXTERNALSYM PDC_MODE_ASPECTRATIOPRESERVED}
  PDC_MODE_ASPECTRATIOPRESERVED = $800;

type
  PPointerDeviceType = ^TPointerDeviceType;
  {$EXTERNALSYM tagPOINTER_DEVICE_TYPE}
  tagPOINTER_DEVICE_TYPE = (
    POINTER_DEVICE_TYPE_INTEGRATED_PEN = $00000001,
    POINTER_DEVICE_TYPE_EXTERNAL_PEN   = $00000002,
    POINTER_DEVICE_TYPE_TOUCH          = $00000003,
    POINTER_DEVICE_TYPE_MAX            = Integer($FFFFFFFF)
  );
  TPointerDeviceType = tagPOINTER_DEVICE_TYPE;
  {$EXTERNALSYM POINTER_DEVICE_TYPE}
  POINTER_DEVICE_TYPE = tagPOINTER_DEVICE_TYPE;

  PPointerDeviceInfo = ^TPointerDeviceInfo;
  {$EXTERNALSYM tagPOINTER_DEVICE_INFO}
  tagPOINTER_DEVICE_INFO = record
    displayOrientation: DWORD;
    device: THandle;
    pointerDeviceType: TPointerDeviceType;
    monitor: HMONITOR;
    startingCursorId: ULONG;
    maxActiveContacts: USHORT;
    productString: array[0..POINTER_DEVICE_PRODUCT_STRING_MAX - 1] of WCHAR;
  end;
  TPointerDeviceInfo = tagPOINTER_DEVICE_INFO;
  {$EXTERNALSYM POINTER_DEVICE_INFO}
  POINTER_DEVICE_INFO = tagPOINTER_DEVICE_INFO;

  PPointerDeviceProperty = ^TPointerDeviceProperty;
  {$EXTERNALSYM tagPOINTER_DEVICE_PROPERTY}
  tagPOINTER_DEVICE_PROPERTY = record
    logicalMin: INT32;
    logicalMax: INT32;
    physicalMin: INT32;
    physicalMax: INT32;
    unit_: UINT32;
    unitExponent: UINT32;
    usagePageId: USHORT;
    usageId: USHORT;
  end;
  TPointerDeviceProperty = tagPOINTER_DEVICE_PROPERTY;
  {$EXTERNALSYM POINTER_DEVICE_PROPERTY}
  POINTER_DEVICE_PROPERTY = tagPOINTER_DEVICE_PROPERTY;

  PPointerDeviceCursorType = ^TPointerDeviceCursorType;
  {$EXTERNALSYM tagPOINTER_DEVICE_CURSOR_TYPE}
  tagPOINTER_DEVICE_CURSOR_TYPE = (
    POINTER_DEVICE_CURSOR_TYPE_UNKNOWN   = $00000000,
    POINTER_DEVICE_CURSOR_TYPE_TIP       = $00000001,
    POINTER_DEVICE_CURSOR_TYPE_ERASER    = $00000002,
    POINTER_DEVICE_CURSOR_TYPE_MAX       = Integer($FFFFFFFF)
  );
  TPointerDeviceCursorType = tagPOINTER_DEVICE_CURSOR_TYPE;
  {$EXTERNALSYM POINTER_DEVICE_CURSOR_TYPE}
  POINTER_DEVICE_CURSOR_TYPE = tagPOINTER_DEVICE_CURSOR_TYPE;

type
  PPointerDeviceCursorInfo = ^TPointerDeviceCursorInfo;
  {$EXTERNALSYM tagPOINTER_DEVICE_CURSOR_INFO}
  tagPOINTER_DEVICE_CURSOR_INFO = record
    cursorId: UINT32;
    cursor: TPointerDeviceCursorType;
  end;
  TPointerDeviceCursorInfo = tagPOINTER_DEVICE_CURSOR_INFO;
  {$EXTERNALSYM POINTER_DEVICE_CURSOR_INFO}
  POINTER_DEVICE_CURSOR_INFO = tagPOINTER_DEVICE_CURSOR_INFO;

function GetPointerDevices(
    {_Inout_} deviceCount: PUINT32;
    {_Out_writes_opt_(*deviceCount)} pointerDevices: PPointerDeviceInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerDevices}

function GetPointerDevice(
    {_In_} device: THandle;
    {_Out_writes_(1)} pointerDevice: PPointerDeviceInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerDevice}

function GetPointerDeviceProperties(
    {_In_} device: THandle;
    {_Inout_} propertyCount: PUINT32;
    {_Out_writes_opt_(*propertyCount)} pointerProperties: PPointerDeviceProperty): BOOL; stdcall;
{$EXTERNALSYM GetPointerDeviceProperties}

function RegisterPointerDeviceNotifications(
    {_In_} window: HWND;
    {_In_} notifyRange: BOOL): BOOL; stdcall;
{$EXTERNALSYM RegisterPointerDeviceNotifications}

function GetPointerDeviceRects(
    {_In_} device: THandle;
    {_Out_writes_(1)} pointerDeviceRect: PRect;
    {_Out_writes_(1)} displayRect: PRect): BOOL; stdcall;
{$EXTERNALSYM GetPointerDeviceRects}

function GetPointerDeviceCursors(
    {_In_} device: THandle;
    {_Inout_} cursorCount: PUINT32;
    {_Out_writes_opt_(*cursorCount)} deviceCursors: PPointerDeviceCursorInfo): BOOL; stdcall;
{$EXTERNALSYM GetPointerDeviceCursors}

function GetRawPointerDeviceData(
    {_In_} pointerId: UINT32;
    {_In_} historyCount: UINT32;
    {_In_} propertiesCount: UINT32;
    {_In_reads_(propertiesCount)} pProperties: PPointerDeviceProperty;
    {_Out_writes_(historyCount * propertiesCount)} pValues: PLONG): BOOL; stdcall;
{$EXTERNALSYM GetRawPointerDeviceData}

{ *******************************
  * Input Source Identification *
  ******************************* }

// WINVER >= 0x0601

{*
 * Identifiers for message input source device type.
 *}
type
  PInputMessageDeviceType = ^TInputMessageDeviceType;
  {$EXTERNALSYM tagINPUT_MESSAGE_DEVICE_TYPE}
  tagINPUT_MESSAGE_DEVICE_TYPE = (
     IMDT_UNAVAILABLE = $00000000,      // not specified
     IMDT_KEYBOARD    = $00000001,      // from keyboard
     IMDT_MOUSE       = $00000002,      // from mouse
     IMDT_TOUCH       = $00000004,      // from touch
     IMDT_PEN         = $00000008       // from pen
  );
  TInputMessageDeviceType = tagINPUT_MESSAGE_DEVICE_TYPE;
  {$EXTERNALSYM INPUT_MESSAGE_DEVICE_TYPE}
  INPUT_MESSAGE_DEVICE_TYPE = tagINPUT_MESSAGE_DEVICE_TYPE;

  PInputMessageOriginID = ^InputMessageOriginID;
  {$EXTERNALSYM tagINPUT_MESSAGE_ORIGIN_ID}
  tagINPUT_MESSAGE_ORIGIN_ID = (
     IMO_UNAVAILABLE = $00000000,  // not specified
     IMO_HARDWARE    = $00000001,  // from a hardware device or injected by a UIAccess app
     IMO_INJECTED    = $00000002,  // injected via SendInput() by a non-UIAccess app
     IMO_SYSTEM      = $00000004   // injected by the system
  );
  InputMessageOriginID = tagINPUT_MESSAGE_ORIGIN_ID;
  {$EXTERNALSYM INPUT_MESSAGE_ORIGIN_ID}
  INPUT_MESSAGE_ORIGIN_ID = tagINPUT_MESSAGE_ORIGIN_ID;

{*
 * Input source structure.
 *}
  PInputMessageSource = ^TInputMessageSource;
  {$EXTERNALSYM tagINPUT_MESSAGE_SOURCE}
  tagINPUT_MESSAGE_SOURCE = record
    deviceType: TInputMessageDeviceType;
    originId: InputMessageOriginID;
  end;
  TInputMessageSource = tagINPUT_MESSAGE_SOURCE;
  {$EXTERNALSYM INPUT_MESSAGE_SOURCE}
  INPUT_MESSAGE_SOURCE = tagINPUT_MESSAGE_SOURCE;

{*
 * API to determine the input source of the current messsage.
 *}
function GetCurrentInputMessageSource(
    {_Out_} inputMessageSource: PInputMessageSource): BOOL; stdcall;
{$EXTERNALSYM GetCurrentInputMessageSource}

function GetCIMSSM(
  {_Out_} inputMessageSource: PInputMessageSource): BOOL; stdcall;
{$EXTERNALSYM GetCIMSSM}



{ ************************
  * VCL Message Crackers *
  ************************
}
type
  TWMPointerDeviceChange = record
    Msg: Cardinal;
    {$IFDEF CPUX64}
    MsgFiller: TDWordFiller;
    {$ENDIF CPUX64}
    PDC: WPARAM;
    LParam: LPARAM;
    Result: LRESULT;
  end;

  TWMPointerDeviceInRange = record
    Msg: Cardinal;
    {$IFDEF CPUX64}
    MsgFiller: TDWordFiller;
    {$ENDIF CPUX64}
    WParam: WPARAM;
    LParam: LPARAM;
    Result: LRESULT;
  end;

  TWMPointerDeviceOutOfRange = record
    Msg: Cardinal;
    {$IFDEF CPUX64}
    MsgFiller: TDWordFiller;
    {$ENDIF CPUX64}
    WParam: WPARAM;
    LParam: LPARAM;
    Result: LRESULT;
  end;

  TWMNCPointer = record
    Msg: Cardinal;
    {$IFDEF CPUX64}
    MsgFiller: TDWordFiller;
    {$ENDIF CPUX64}
    PointerID: Word;
    HitTest: SmallInt;
    {$IFDEF CPUX64}
    WParamFiller: TDWordFiller;
    {$ENDIF CPUX64}
    case Integer of
      0: (
        XPos: Smallint;
        YPos: Smallint;
        {$IFDEF CPUX64}
        XYPosFiller: TDWordFiller;
        {$ENDIF CPUX64}
        );
      1: (
        Pos: TSmallPoint;
        {$IFDEF CPUX64}
        PosFiller: TDWordFiller;
        {$ENDIF CPUX64}
        Result: LRESULT);
  end;

  TWMNCPointerUpdate = TWMNCPointer;
  TWMNCPointerDown = TWMNCPointer;
  TWMNCPointerUp = TWMNCPointer;

  TWMPointer = record
    Msg: Cardinal;
    {$IFDEF CPUX64}
    MsgFiller: TDWordFiller;
    {$ENDIF CPUX64}
    PointerID: Word;
    Flag: Word;
    {$IFDEF CPUX64}
    WParamFiller: TDWordFiller;
    {$ENDIF CPUX64}
    case Integer of
      0: (
        XPos: Smallint;
        YPos: Smallint;
        {$IFDEF CPUX64}
        XYPosFiller: TDWordFiller;
        {$ENDIF CPUX64}
        );
      1: (
        Pos: TSmallPoint;
        {$IFDEF CPUX64}
        PosFiller: TDWordFiller;
        {$ENDIF CPUX64}
        Result: LRESULT);
  end;

  TWMPointerUpdate = TWMPointer;
  TWMPointerDown = TWMPointer;
  TWMPointerUp = TWMPointer;
  TWMPointerEnter = TWMPointer;
  TWMPointerLeave = TWMPointer;

  TWMPointerActivate = record
    Msg: Cardinal;
    {$IFDEF CPUX64}
    MsgFiller: TDWordFiller;
    {$ENDIF CPUX64}
    PointerID: Word;
    HitTest: SmallInt;
    {$IFDEF CPUX64}
    WParamFiller: TDWordFiller;
    {$ENDIF CPUX64}
    ActiveWindow: HWND;
    Result: LRESULT;
  end;

  TWMPointerCaptureChanged = record
    Msg: Cardinal;
    {$IFDEF CPUX64}
    MsgFiller: TDWordFiller;
    {$ENDIF CPUX64}
    PointerID: Word;
    Unused: Word;
    {$IFDEF CPUX64}
    WParamFiller: TDWordFiller;
    {$ENDIF CPUX64}
    CaptureWindow: HWND;
    Result: LRESULT;
  end;

  TWMTouchHitTesting = record
    Msg: Cardinal;
    {$IFDEF CPUX64}
    MsgFiller: TDWordFiller;
    {$ENDIF CPUX64}
    Ununsed: WPARAM;
    TouchHitTestingInput: PTouchHitTestingInput;
    Result: LRESULT;
  end;

  TWMPointerWheel = record
    Msg: Cardinal;
    {$IFDEF CPUX64}
    MsgFiller: TDWordFiller;
    {$ENDIF CPUX64}
    PointerID: Word;
    WheelDelta: SmallInt;
    {$IFDEF CPUX64}
    WParamFiller: TDWordFiller;
    {$ENDIF CPUX64}
    case Integer of
      0: (
        XPos: Smallint;
        YPos: Smallint;
        {$IFDEF CPUX64}
        XYPosFiller: TDWordFiller;
        {$ENDIF CPUX64}
        );
      1: (
        Pos: TSmallPoint;
        {$IFDEF CPUX64}
        PosFiller: TDWordFiller;
        {$ENDIF CPUX64}
        Result: LRESULT);
  end;

  TWMPointerHWheel = TWMPointerWheel;

implementation

function GET_X_LPARAM(lParam: LPARAM): Integer;
begin
  Result := Smallint(LoWord(lParam));
end;

function GET_Y_LPARAM(lParam: LPARAM): Integer;
begin
  Result := Smallint(HiWord(lParam));
end;

function GET_WHEEL_DELTA_WPARAM(wParam: WPARAM): SmallInt;
begin
  Result := SmallInt(HiWord(wParam));
end;


function GET_POINTERID_WPARAM(wParam: WPARAM): Word;
begin
  Result := LoWord(wParam);
end;

function IS_POINTER_FLAG_SET_WPARAM(wParam: WPARAM; flag: UINT32): BOOL;
begin
  Result := DWORD(HiWord(wParam) and flag) = flag;
end;

function IS_POINTER_NEW_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_NEW);
end;

function IS_POINTER_INRANGE_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_INRANGE);
end;

function IS_POINTER_INCONTACT_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_INCONTACT);
end;

function IS_POINTER_FIRSTBUTTON_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_FIRSTBUTTON);
end;

function IS_POINTER_SECONDBUTTON_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_SECONDBUTTON);
end;

function IS_POINTER_THIRDBUTTON_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_THIRDBUTTON);
end;

function IS_POINTER_FOURTHBUTTON_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_FOURTHBUTTON);
end;

function IS_POINTER_FIFTHBUTTON_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_FIFTHBUTTON);
end;

function IS_POINTER_PRIMARY_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_PRIMARY);
end;

function HAS_POINTER_CONFIDENCE_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_CONFIDENCE);
end;

function IS_POINTER_CANCELED_WPARAM(wParam: WPARAM): BOOL;
begin
  Result := IS_POINTER_FLAG_SET_WPARAM(wParam, POINTER_MESSAGE_FLAG_CANCELED);
end;

function InitializeTouchInjection; external user32 name 'InitializeTouchInjection' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function InjectTouchInput; external user32 name 'InjectTouchInput' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerType; external user32 name 'GetPointerType' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerCursorId; external user32 name 'GetPointerCursorId' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerInfo; external user32 name 'GetPointerInfo' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerInfoHistory; external user32 name 'GetPointerInfoHistory' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerFrameInfo; external user32 name 'GetPointerFrameInfo' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerFrameInfoHistory; external user32 name 'GetPointerFrameInfoHistory' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerTouchInfo; external user32 name 'GetPointerTouchInfo' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerTouchInfoHistory; external user32 name 'GetPointerTouchInfoHistory' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerFrameTouchInfo; external user32 name 'GetPointerFrameTouchInfo' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerFrameTouchInfoHistory; external user32 name 'GetPointerFrameTouchInfoHistory' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerPenInfo; external user32 name 'GetPointerPenInfo' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerPenInfoHistory; external user32 name 'GetPointerPenInfoHistory' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerFramePenInfo; external user32 name 'GetPointerFramePenInfo' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerFramePenInfoHistory; external user32 name 'GetPointerFramePenInfoHistory' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function SkipPointerFrameMessages; external user32 name 'SkipPointerFrameMessages' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function RegisterPointerInputTarget; external user32 name 'RegisterPointerInputTarget' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function UnregisterPointerInputTarget; external user32 name 'UnregisterPointerInputTarget' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};

function EnableMouseInPointer; external user32 name 'EnableMouseInPointer' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function IsMouseInPointerEnabled; external user32 name 'IsMouseInPointerEnabled' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};

function RegisterTouchHitTestingWindow; external user32 name 'RegisterTouchHitTestingWindow' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};

function EvaluateProximityToRect; external user32 name 'EvaluateProximityToRect' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function EvaluateProximityToPolygon; external user32 name 'EvaluateProximityToPolygon' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function PackTouchHitTestingProximityEvaluation; external user32 name 'PackTouchHitTestingProximityEvaluation' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};

function GetWindowFeedbackSetting; external user32 name 'GetWindowFeedbackSetting' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function SetWindowFeedbackSetting; external user32 name 'SetWindowFeedbackSetting' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};

function GetPointerDevices; external user32 name 'GetPointerDevices' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerDevice; external user32 name 'GetPointerDevice' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerDeviceProperties; external user32 name 'GetPointerDeviceProperties' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function RegisterPointerDeviceNotifications; external user32 name 'RegisterPointerDeviceNotifications' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerDeviceRects; external user32 name 'GetPointerDeviceRects' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPointerDeviceCursors; external user32 name 'GetPointerDeviceCursors' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetRawPointerDeviceData; external user32 name 'GetRawPointerDeviceData' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};

function GetCurrentInputMessageSource; external user32 name 'GetCurrentInputMessageSource' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetCIMSSM; external user32 name 'GetCIMSSM' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};

end.

