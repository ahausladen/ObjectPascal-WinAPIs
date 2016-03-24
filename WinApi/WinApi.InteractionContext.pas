{******************************************************************************}
{                                                                              }
{ Windows IteractionContext API interface Unit for Object Pascal               }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) Microsoft Corporation.       }
{ All Rights Reserved.                                                         }
{                                                                              }
{ The original file is: InteractionContext.h, released June 2012. The original }
{ Pascal code is: WinApi.InteractionContext.pas, released August 2013. The     }
{ initial developer of the Pascal code is Andreas Hausladen.                   }
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

unit WinApi.InteractionContext;

{ InteractionContext.h }

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
  WinApi.Windows, WinApi.WMPointer;
  {$ELSE}
  Windows, WinApi.WMPointer;
  {$IFEND}

//(*$HPPEMIT '  #include <InteractionContext.h>' *)

const
  {$EXTERNALSYM FLT_MAX}
  FLT_MAX = 3.402823466e+38; // float.h

type
  PInteractionID = ^TInteractionID;
  {$EXTERNALSYM INTERACTION_ID}
  INTERACTION_ID = (
    INTERACTION_ID_NONE           = $00000000,
    INTERACTION_ID_MANIPULATION   = $00000001,
    INTERACTION_ID_TAP            = $00000002,
    INTERACTION_ID_SECONDARY_TAP  = $00000003,
    INTERACTION_ID_HOLD           = $00000004,
    INTERACTION_ID_DRAG           = $00000005,
    INTERACTION_ID_CROSS_SLIDE    = $00000006,
    INTERACTION_ID_MAX            = Integer($ffffffff)
  );
  TInteractionID = INTERACTION_ID;


  PInteractionFlags = ^TInteractionFlags;
  {$EXTERNALSYM INTERACTION_FLAGS}
  INTERACTION_FLAGS = type UINT32;
  TInteractionFlags = INTERACTION_FLAGS;

//DEFINE_ENUM_FLAG_OPERATORS(INTERACTION_FLAGS);
const
  {$EXTERNALSYM INTERACTION_FLAG_NONE}
  INTERACTION_FLAG_NONE    = TInteractionFlags($00000000);
  {$EXTERNALSYM INTERACTION_FLAG_BEGIN}
  INTERACTION_FLAG_BEGIN   = TInteractionFlags($00000001);
  {$EXTERNALSYM INTERACTION_FLAG_END}
  INTERACTION_FLAG_END     = TInteractionFlags($00000002);
  {$EXTERNALSYM INTERACTION_FLAG_CANCEL}
  INTERACTION_FLAG_CANCEL  = TInteractionFlags($00000004);
  {$EXTERNALSYM INTERACTION_FLAG_INERTIA}
  INTERACTION_FLAG_INERTIA = TInteractionFlags($00000008);
  {$EXTERNALSYM INTERACTION_FLAG_MAX}
  INTERACTION_FLAG_MAX     = TInteractionFlags($ffffffff);


type
  PInteractionConfigurationFlags = ^TInteractionConfigurationFlags;
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAGS}
  INTERACTION_CONFIGURATION_FLAGS = type UINT32;
  TInteractionConfigurationFlags = INTERACTION_CONFIGURATION_FLAGS;

// DEFINE_ENUM_FLAG_OPERATORS(INTERACTION_CONFIGURATION_FLAGS);
const
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_NONE}
  INTERACTION_CONFIGURATION_FLAG_NONE                             = TInteractionConfigurationFlags($00000000);

  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION                     = TInteractionConfigurationFlags($00000001);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_X}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_X       = TInteractionConfigurationFlags($00000002);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_Y}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_Y       = TInteractionConfigurationFlags($00000004);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION            = TInteractionConfigurationFlags($00000008);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING             = TInteractionConfigurationFlags($00000010);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_INERTIA}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_INERTIA = TInteractionConfigurationFlags($00000020);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION_INERTIA}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION_INERTIA    = TInteractionConfigurationFlags($00000040);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING_INERTIA}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING_INERTIA     = TInteractionConfigurationFlags($00000080);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_X}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_X             = TInteractionConfigurationFlags($00000100);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_Y}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_RAILS_Y             = TInteractionConfigurationFlags($00000200);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MANIPULATION_EXACT}
  INTERACTION_CONFIGURATION_FLAG_MANIPULATION_EXACT               = TInteractionConfigurationFlags($00000400);

  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE}
  INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE                      = TInteractionConfigurationFlags($00000001);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_HORIZONTAL}
  INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_HORIZONTAL           = TInteractionConfigurationFlags($00000002);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SELECT}
  INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SELECT               = TInteractionConfigurationFlags($00000004);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SPEED_BUMP}
  INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_SPEED_BUMP           = TInteractionConfigurationFlags($00000008);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_REARRANGE}
  INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_REARRANGE            = TInteractionConfigurationFlags($00000010);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_EXACT}
  INTERACTION_CONFIGURATION_FLAG_CROSS_SLIDE_EXACT                = TInteractionConfigurationFlags($00000020);

  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_TAP}
  INTERACTION_CONFIGURATION_FLAG_TAP                              = TInteractionConfigurationFlags($00000001);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_TAP_DOUBLE}
  INTERACTION_CONFIGURATION_FLAG_TAP_DOUBLE                       = TInteractionConfigurationFlags($00000002);

  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_SECONDARY_TAP}
  INTERACTION_CONFIGURATION_FLAG_SECONDARY_TAP                    = TInteractionConfigurationFlags($00000001);

  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_HOLD}
  INTERACTION_CONFIGURATION_FLAG_HOLD                             = TInteractionConfigurationFlags($00000001);
  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_HOLD_MOUSE}
  INTERACTION_CONFIGURATION_FLAG_HOLD_MOUSE                       = TInteractionConfigurationFlags($00000002);

  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_DRAG}
  INTERACTION_CONFIGURATION_FLAG_DRAG                             = TInteractionConfigurationFlags($00000001);

  {$EXTERNALSYM INTERACTION_CONFIGURATION_FLAG_MAX}
  INTERACTION_CONFIGURATION_FLAG_MAX                              = TInteractionConfigurationFlags($ffffffff);


type
  PInertiaParameter = ^TInertiaParameter;
  {$EXTERNALSYM INERTIA_PARAMETER}
  INERTIA_PARAMETER = (
    INERTIA_PARAMETER_TRANSLATION_DECELERATION = $00000001,
    INERTIA_PARAMETER_TRANSLATION_DISPLACEMENT = $00000002,

    INERTIA_PARAMETER_ROTATION_DECELERATION    = $00000003,
    INERTIA_PARAMETER_ROTATION_ANGLE           = $00000004,

    INERTIA_PARAMETER_EXPANSION_DECELERATION   = $00000005,
    INERTIA_PARAMETER_EXPANSION_EXPANSION      = $00000006,

    INERTIA_PARAMETER_MAX                      = Integer($ffffffff)
  );
  TInertiaParameter = INERTIA_PARAMETER;

  PInteractionState = ^TInteractionState;
  {$EXTERNALSYM INTERACTION_STATE}
  INTERACTION_STATE = (
    INTERACTION_STATE_IDLE                = $00000000,
    INTERACTION_STATE_IN_INTERACTION      = $00000001,
    INTERACTION_STATE_POSSIBLE_DOUBLE_TAP = $00000002,
    INTERACTION_STATE_MAX                 = Integer($ffffffff)
  );
  TInteractionState = INTERACTION_STATE;

  PInteractionContextProperty = ^TInteractionContextProperty;
  {$EXTERNALSYM INTERACTION_CONTEXT_PROPERTY}
  INTERACTION_CONTEXT_PROPERTY = (
    INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS       = $00000001,
    INTERACTION_CONTEXT_PROPERTY_INTERACTION_UI_FEEDBACK = $00000002,
    INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS         = $00000003,

    INTERACTION_CONTEXT_PROPERTY_MAX                     = Integer($ffffffff)
  );
  TInteractionContextProperty = INTERACTION_CONTEXT_PROPERTY;

  PCrossSlideThreshold = ^TCrossSlideThreshold;
  {$EXTERNALSYM CROSS_SLIDE_THRESHOLD}
  CROSS_SLIDE_THRESHOLD = (
    CROSS_SLIDE_THRESHOLD_SELECT_START            = $00000000,
    CROSS_SLIDE_THRESHOLD_SPEED_BUMP_START        = $00000001,
    CROSS_SLIDE_THRESHOLD_SPEED_BUMP_END          = $00000002,
    CROSS_SLIDE_THRESHOLD_REARRANGE_START         = $00000003,

    CROSS_SLIDE_THRESHOLD_COUNT                   = $00000004,
    CROSS_SLIDE_THRESHOLD_MAX                     = Integer($ffffffff)
  );
  TCrossSlideThreshold = CROSS_SLIDE_THRESHOLD;

const
  {$EXTERNALSYM CROSS_SLIDE_THRESHOLD_INVALID_VALUE}
  CROSS_SLIDE_THRESHOLD_INVALID_VALUE = FLT_MAX;

type
  PCrossSlideFlags = ^TCrossSlideFlags;
  {$EXTERNALSYM CROSS_SLIDE_FLAGS}
  CROSS_SLIDE_FLAGS = type UINT32;
  TCrossSlideFlags = CROSS_SLIDE_FLAGS;

// DEFINE_ENUM_FLAG_OPERATORS(CROSS_SLIDE_FLAGS);
const
  {$EXTERNALSYM CROSS_SLIDE_FLAGS_NONE}
  CROSS_SLIDE_FLAGS_NONE              = TCrossSlideFlags($00000000);
  {$EXTERNALSYM CROSS_SLIDE_FLAGS_SELECT}
  CROSS_SLIDE_FLAGS_SELECT            = TCrossSlideFlags($00000001);
  {$EXTERNALSYM CROSS_SLIDE_FLAGS_SPEED_BUMP}
  CROSS_SLIDE_FLAGS_SPEED_BUMP        = TCrossSlideFlags($00000002);
  {$EXTERNALSYM CROSS_SLIDE_FLAGS_REARRANGE}
  CROSS_SLIDE_FLAGS_REARRANGE         = TCrossSlideFlags($00000004);
  {$EXTERNALSYM CROSS_SLIDE_FLAGS_MAX}
  CROSS_SLIDE_FLAGS_MAX               = TCrossSlideFlags($ffffffff);

type
  PMouseWheelParameter = ^TMouseWheelParameter;
  {$EXTERNALSYM MOUSE_WHEEL_PARAMETER}
  MOUSE_WHEEL_PARAMETER = (
    MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_X    = $00000001,
    MOUSE_WHEEL_PARAMETER_CHAR_TRANSLATION_Y    = $00000002,
    MOUSE_WHEEL_PARAMETER_DELTA_SCALE           = $00000003,
    MOUSE_WHEEL_PARAMETER_DELTA_ROTATION        = $00000004,
    MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_X    = $00000005,
    MOUSE_WHEEL_PARAMETER_PAGE_TRANSLATION_Y    = $00000006,
    MOUSE_WHEEL_PARAMETER_MAX                   = Integer($ffffffff)
  );
  TMouseWheelParameter = MOUSE_WHEEL_PARAMETER;

  PManipulationRailsState = ^TManipulationRailsState;
  {$EXTERNALSYM MANIPULATION_RAILS_STATE}
  MANIPULATION_RAILS_STATE = (
    MANIPULATION_RAILS_STATE_UNDECIDED = $00000000,
    MANIPULATION_RAILS_STATE_FREE      = $00000001,
    MANIPULATION_RAILS_STATE_RAILED    = $00000002,
    MANIPULATION_RAILS_STATE_MAX       = Integer($ffffffff)
  );
  TManipulationRailsState = MANIPULATION_RAILS_STATE;

  PManipulationTransform = ^TManipulationTransform;
  {$EXTERNALSYM MANIPULATION_TRANSFORM}
  MANIPULATION_TRANSFORM = record
    translationX: Single;
    translationY: Single;
    scale: Single;
    expansion: Single;
    rotation: Single;
  end;
  TManipulationTransform = MANIPULATION_TRANSFORM;

  PManipulationVelocity = ^TManipulationVelocity;
  {$EXTERNALSYM MANIPULATION_VELOCITY}
  MANIPULATION_VELOCITY = record
    velocityX: Single;
    velocityY: Single;
    velocityExpansion: Single;
    velocityAngular: Single;
  end;
  TManipulationVelocity = MANIPULATION_VELOCITY;

  PInteractionArgumentsManipulation = ^TInteractionArgumentsManipulation;
  {$EXTERNALSYM INTERACTION_ARGUMENTS_MANIPULATION}
  INTERACTION_ARGUMENTS_MANIPULATION = record
    delta: TManipulationTransform;
    cumulative: TManipulationTransform;
    velocity: TManipulationVelocity;
    railsState: TManipulationRailsState;
  end;
  TInteractionArgumentsManipulation = INTERACTION_ARGUMENTS_MANIPULATION;

  PInteractionArgumentsTap = ^TInteractionArgumentsTap;
  {$EXTERNALSYM INTERACTION_ARGUMENTS_TAP}
  INTERACTION_ARGUMENTS_TAP = record
    count: UINT32;
  end;
  TInteractionArgumentsTap = INTERACTION_ARGUMENTS_TAP;

  PInteractionArgumentsCrossSlide = ^TInteractionArgumentsCrossSlide;
  {$EXTERNALSYM INTERACTION_ARGUMENTS_CROSS_SLIDE}
  INTERACTION_ARGUMENTS_CROSS_SLIDE = record
    flags: TCrossSlideFlags;
  end;
  TInteractionArgumentsCrossSlide = INTERACTION_ARGUMENTS_CROSS_SLIDE;

  PInteractionContextOutput = ^TInteractionContextOutput;
  {$EXTERNALSYM INTERACTION_CONTEXT_OUTPUT}
  INTERACTION_CONTEXT_OUTPUT = record
    interactionId: TInteractionID;
    interactionFlags: TInteractionFlags;
    inputType: TPointerInputType;
    x: Single;
    y: Single;
    arguments: record
      case Integer of
        0: (manipulation: TInteractionArgumentsManipulation);
        1: (tap: TInteractionArgumentsTap);
        2: (crossSlide: TInteractionArgumentsCrossSlide);
    end;
  end;
  TInteractionContextOutput = INTERACTION_CONTEXT_OUTPUT;

  PInteractionContextConfiguration = ^TInteractionContextConfiguration;
  {$EXTERNALSYM INTERACTION_CONTEXT_CONFIGURATION}
  INTERACTION_CONTEXT_CONFIGURATION = record
    interactionId: TInteractionID;
    enable: TInteractionConfigurationFlags;
  end;
  TInteractionContextConfiguration = INTERACTION_CONTEXT_CONFIGURATION;

  PCrossSlideParameter = ^TCrossSlideParameter;
  {$EXTERNALSYM CROSS_SLIDE_PARAMETER}
  CROSS_SLIDE_PARAMETER = record
    threshold: TCrossSlideThreshold;
    distance: Single;
  end;
  TCrossSlideParameter = CROSS_SLIDE_PARAMETER;

  {$EXTERNALSYM INTERACTION_CONTEXT_OUTPUT_CALLBACK}
  INTERACTION_CONTEXT_OUTPUT_CALLBACK = procedure({_In_opt_} clientData: PVOID; {_In_reads_(1)} const output: PInteractionContextOutput); stdcall;
  TInteractionContextOutputCallback = INTERACTION_CONTEXT_OUTPUT_CALLBACK;

//DECLARE_HANDLE(HINTERACTIONCONTEXT);
  __HINTERACTIONCONTEXT = record end;
  {$EXTERNALSYM HINTERACTIONCONTEXT}
  HINTERACTIONCONTEXT = ^__HINTERACTIONCONTEXT;
  PHINTERACTIONCONTEXT = ^HINTERACTIONCONTEXT;

const
  {$EXTERNALSYM INTERACTION_CONTEXT_CONFIGURATION_DEFAULT}
  INTERACTION_CONTEXT_CONFIGURATION_DEFAULT: array[0..5] of TInteractionContextConfiguration = (
    (interactionId: INTERACTION_ID_MANIPULATION;
     enable:            INTERACTION_CONFIGURATION_FLAG_MANIPULATION or
                        INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_X or
                        INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_Y or
                        INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION or
                        INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING or
                        INTERACTION_CONFIGURATION_FLAG_MANIPULATION_TRANSLATION_INERTIA or
                        INTERACTION_CONFIGURATION_FLAG_MANIPULATION_ROTATION_INERTIA or
                        INTERACTION_CONFIGURATION_FLAG_MANIPULATION_SCALING_INERTIA),
    (interactionId: INTERACTION_ID_TAP;
     enable:            INTERACTION_CONFIGURATION_FLAG_TAP),
    (interactionId: INTERACTION_ID_SECONDARY_TAP;
     enable:            INTERACTION_CONFIGURATION_FLAG_SECONDARY_TAP),
    (interactionId: INTERACTION_ID_HOLD;
     enable:            INTERACTION_CONFIGURATION_FLAG_HOLD),
    (interactionId: INTERACTION_ID_DRAG;
     enable:            INTERACTION_CONFIGURATION_FLAG_NONE),
    (interactionId: INTERACTION_ID_CROSS_SLIDE;
     enable:            INTERACTION_CONFIGURATION_FLAG_NONE)
  );

  {$EXTERNALSYM INERTIA_PARAMETER_INVALID_VALUE}
  INERTIA_PARAMETER_INVALID_VALUE   = FLT_MAX;

function CreateInteractionContext(
    {_Out_writes_(1)} interactionContext: PHINTERACTIONCONTEXT): HRESULT; stdcall;
{$EXTERNALSYM CreateInteractionContext}

function DestroyInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT): HRESULT; stdcall;
{$EXTERNALSYM DestroyInteractionContext}

function RegisterOutputCallbackInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} outputCallback: TInteractionContextOutputCallback;
    {_In_opt_} clientData: Pointer): HRESULT; stdcall;
{$EXTERNALSYM RegisterOutputCallbackInteractionContext}

function SetInteractionConfigurationInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} configurationCount: UINT32;
    {_In_reads_(configurationCount)} const configuration: PInteractionContextConfiguration): HRESULT; stdcall;
{$EXTERNALSYM SetInteractionConfigurationInteractionContext}

function GetInteractionConfigurationInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} configurationCount: UINT32;
    {_Inout_updates_(configurationCount)} configuration: PInteractionContextConfiguration): HRESULT; stdcall;
{$EXTERNALSYM GetInteractionConfigurationInteractionContext}

function SetPropertyInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} contextProperty: TInteractionContextProperty;
    {_In_} value: UINT32): HRESULT; stdcall;
{$EXTERNALSYM SetPropertyInteractionContext}

function GetPropertyInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} contextProperty: TInteractionContextProperty;
    {_Out_writes_(1)} value: PUINT32): HRESULT; stdcall;
{$EXTERNALSYM GetPropertyInteractionContext}

function SetInertiaParameterInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} inertiaParameter: TInertiaParameter;
    {_In_} value: Single): HRESULT; stdcall;
{$EXTERNALSYM SetInertiaParameterInteractionContext}

function GetInertiaParameterInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} inertiaParameter: TInertiaParameter;
    {_Out_writes_(1)} value: PSingle): HRESULT; stdcall;
{$EXTERNALSYM GetInertiaParameterInteractionContext}

function SetCrossSlideParametersInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} parameterCount: UINT32;
    {_In_reads_(parameterCount)} crossSlideParameters: PCrossSlideParameter): HRESULT; stdcall;
{$EXTERNALSYM SetCrossSlideParametersInteractionContext}

function GetCrossSlideParameterInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} threshold: TCrossSlideThreshold;
    {_Out_writes_(1)} distance: PSingle): HRESULT; stdcall;
{$EXTERNALSYM GetCrossSlideParameterInteractionContext}

function SetMouseWheelParameterInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} parameter: TMouseWheelParameter;
    {_In_} value: Single): HRESULT; stdcall;
{$EXTERNALSYM SetMouseWheelParameterInteractionContext}

function GetMouseWheelParameterInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} parameter: TMouseWheelParameter;
    {_Out_writes_(1)} value: PSingle): HRESULT; stdcall;
{$EXTERNALSYM GetMouseWheelParameterInteractionContext}

function ResetInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT): HRESULT; stdcall;
{$EXTERNALSYM ResetInteractionContext}

function GetStateInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_opt_} const pointerInfo: PPointerInfo;
    {_Out_writes_(1)} state: PInteractionState): HRESULT; stdcall;
{$EXTERNALSYM GetStateInteractionContext}

function AddPointerInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} pointerId: UINT32): HRESULT; stdcall;
{$EXTERNALSYM AddPointerInteractionContext}

function RemovePointerInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} pointerId: UINT32): HRESULT; stdcall;
{$EXTERNALSYM RemovePointerInteractionContext}

function ProcessPointerFramesInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} entriesCount: UINT32;
    {_In_} pointerCount: UINT32;
    {_In_reads_(entriesCount * pointerCount)} const pointerInfo: PPointerInfo): HRESULT; stdcall;
{$EXTERNALSYM ProcessPointerFramesInteractionContext}

function BufferPointerPacketsInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} entriesCount: UINT32;
    {_In_reads_(entriesCount)} const pointerInfo: PPointerInfo): HRESULT; stdcall;
{$EXTERNALSYM BufferPointerPacketsInteractionContext}

function ProcessBufferedPacketsInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT): HRESULT; stdcall;
{$EXTERNALSYM ProcessBufferedPacketsInteractionContext}

function ProcessInertiaInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT): HRESULT; stdcall;
{$EXTERNALSYM ProcessInertiaInteractionContext}

function StopInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT): HRESULT; stdcall;
{$EXTERNALSYM StopInteractionContext}

function SetPivotInteractionContext(
    {_In_} interactionContext: HINTERACTIONCONTEXT;
    {_In_} x: Single;
    {_In_} y: Single;
    {_In_} radius: Single): HRESULT; stdcall;
{$EXTERNALSYM SetPivotInteractionContext}

implementation

const
  ninput = 'ninput.dll';

function CreateInteractionContext; external ninput name 'CreateInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function DestroyInteractionContext; external ninput name 'DestroyInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function RegisterOutputCallbackInteractionContext; external ninput name 'RegisterOutputCallbackInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function SetInteractionConfigurationInteractionContext; external ninput name 'SetInteractionConfigurationInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetInteractionConfigurationInteractionContext; external ninput name 'GetInteractionConfigurationInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function SetPropertyInteractionContext; external ninput name 'SetPropertyInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetPropertyInteractionContext; external ninput name 'GetPropertyInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function SetInertiaParameterInteractionContext; external ninput name 'SetInertiaParameterInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetInertiaParameterInteractionContext; external ninput name 'GetInertiaParameterInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function SetCrossSlideParametersInteractionContext; external ninput name 'SetCrossSlideParametersInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetCrossSlideParameterInteractionContext; external ninput name 'GetCrossSlideParameterInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function SetMouseWheelParameterInteractionContext; external ninput name 'SetMouseWheelParameterInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetMouseWheelParameterInteractionContext; external ninput name 'GetMouseWheelParameterInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function ResetInteractionContext; external ninput name 'ResetInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function GetStateInteractionContext; external ninput name 'GetStateInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function AddPointerInteractionContext; external ninput name 'AddPointerInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function RemovePointerInteractionContext; external ninput name 'RemovePointerInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function ProcessPointerFramesInteractionContext; external ninput name 'ProcessPointerFramesInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function BufferPointerPacketsInteractionContext; external ninput name 'BufferPointerPacketsInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function ProcessBufferedPacketsInteractionContext; external ninput name 'ProcessBufferedPacketsInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function ProcessInertiaInteractionContext; external ninput name 'ProcessInertiaInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function StopInteractionContext; external ninput name 'StopInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};
function SetPivotInteractionContext; external ninput name 'SetPivotInteractionContext' {$IFDEF SUPPORTS_DELAYED}delayed{$ENDIF};

end.
