unit Libretro;

{ Just enough of the libretro API ported to make this game work. }

interface

type
  TRetroEnvironment = function(cmd: UInt32; Data: Pointer): boolean; cdecl;
  TRetroVideoRefresh = procedure(Data: Pointer; Width: UInt32;
    Height: UInt32; pitch: SizeUInt); cdecl;
  TRetroAudioSample = procedure(left: Int16; right: Int16); cdecl;
  TRetroAudioSampleBatch = function(Data: PInt16;
    frames: SizeUInt): Int16; cdecl;
  TRetroInputPoll = procedure; cdecl;
  TRetroInputState = function(port: UInt32; device: UInt32;
    index: UInt32; id: UInt32): Int16; cdecl;

  PRetroSystemInfo = ^TRetroSystemInfo;

  TRetroSystemInfo = record
    LibraryName: PAnsiChar;
    LibraryVersion: PAnsiChar;
    ValidExtensions: PAnsiChar;
    NeedFullpath: boolean;
    BlockExtract: boolean;
  end;

  TRetroGameGeometry = record
    BaseWidth: UInt32;
    BaseHeight: UInt32;
    MaxWidth: UInt32;
    MaxHeight: UInt32;
    AspectRatio: single;
  end;

  TRetroSystemTiming = record
    FPS: double;
    SampleRate: double;
  end;

  PRetroSystemAvInfo = ^TRetroSystemAvInfo;

  TRetroSystemAvInfo = record
    Geometry: TRetroGameGeometry;
    Timing: TRetroSystemTiming;
  end;

  PRetroGameInfo = ^TRetroGameInfo;

  TRetroGameInfo = record
    Path: PAnsiChar;
    Data: Pointer;
    Size: SizeUInt;
    Meta: PAnsiChar;
  end;

const
  RETRO_ENVIRONMENT_EXPERIMENTAL = $10000;
  RETRO_ENVIRONMENT_GET_INPUT_BITMASKS = 51 or RETRO_ENVIRONMENT_EXPERIMENTAL;
  RETRO_DEVICE_ID_JOYPAD_R3 = 15;
  RETRO_DEVICE_ID_JOYPAD_MASK = 256;

implementation

end.
