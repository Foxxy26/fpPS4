unit ps4_libSceHmd;

{$mode ObjFPC}{$H+}

interface


uses
  ps4_program,
  Classes,
  SysUtils;

const
 SCE_HMD_ERROR_PARAMETER_NULL=Integer($81110008);

type
 pSceHmdOpenParam=^SceHmdOpenParam;
 SceHmdOpenParam=packed record
  reserve:array[0..7] of Byte;
 end;

 pSceHmdFieldOfView=^SceHmdFieldOfView;
 SceHmdFieldOfView=packed record
  tanOut   :Single;
  tanIn    :Single;
  tanTop   :Single;
  tanBottom:Single;
 end;

implementation

function ps4_sceHmdInitialize(param:Pointer):Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function ps4_sceHmdInitialize315(param:Pointer):Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function ps4_sceHmdReprojectionQueryOnionBuffSize():Integer; SysV_ABI_CDecl;
begin
 Result:=$810;
end;

function ps4_sceHmdReprojectionQueryOnionBuffAlign():Integer; SysV_ABI_CDecl;
begin
 Result:=$100;
end;

function ps4_sceHmdReprojectionQueryGarlicBuffSize():Integer; SysV_ABI_CDecl;
begin
 Result:=$100000;
end;

function ps4_sceHmdReprojectionQueryGarlicBuffAlign():Integer; SysV_ABI_CDecl;
begin
 Result:=$100;
end;

function ps4_sceHmdReprojectionSetUserEventStart(eq:Pointer;id:Integer):Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function ps4_sceHmdReprojectionSetUserEventEnd(eq:Pointer;id:Integer):Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function ps4_sceHmdGetDeviceInformation(info:Pointer):Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function ps4_sceHmdReprojectionStop():Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function ps4_sceHmdReprojectionUnsetDisplayBuffers():Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

procedure ps4_sceHmdReprojectionFinalize(); SysV_ABI_CDecl;
begin
 //
end;

function ps4_sceHmdReprojectionClearUserEventStart():Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function ps4_sceHmdReprojectionSetDisplayBuffers(videoOutHandle,index0,index1:Integer;option:Pointer):Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function ps4_sceHmdOpen(userId,_type,index:Integer;pParam:pSceHmdOpenParam):Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function ps4_sceHmdGetFieldOfView(handle:Integer;fieldOfView:pSceHmdFieldOfView):Integer; SysV_ABI_CDecl;
begin
 if (fieldOfView=nil) then Exit(SCE_HMD_ERROR_PARAMETER_NULL);

 fieldOfView^.tanOut   :=1.20743;
 fieldOfView^.tanIn    :=1.181346;
 fieldOfView^.tanTop   :=1.262872;
 fieldOfView^.tanBottom:=1.262872;

 Result:=0;
end;

function ps4_sceHmdTerminate():Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function Load_libSceHmd(Const name:RawByteString):TElf_node;
var
 lib:PLIBRARY;
begin
 Result:=TElf_node.Create;
 Result.pFileName:=name;
 lib:=Result._add_lib('libSceHmd');
 lib^.set_proc($2B82A71F44244F67,@ps4_sceHmdInitialize);
 lib^.set_proc($B3F27AE9AAFD839D,@ps4_sceHmdInitialize315);
 lib^.set_proc($90B50090DE9AD5EF,@ps4_sceHmdReprojectionQueryOnionBuffSize);
 lib^.set_proc($216C9B59B47FC6F0,@ps4_sceHmdReprojectionQueryOnionBuffAlign);
 lib^.set_proc($CF42AD375BEA1761,@ps4_sceHmdReprojectionQueryGarlicBuffSize);
 lib^.set_proc($4E470035C18CD2CF,@ps4_sceHmdReprojectionQueryGarlicBuffAlign);
 lib^.set_proc($EDAB340A35D6D41F,@ps4_sceHmdReprojectionSetUserEventStart);
 lib^.set_proc($927C888659292E01,@ps4_sceHmdReprojectionSetUserEventEnd);
 lib^.set_proc($B610EDF6EA59969F,@ps4_sceHmdGetDeviceInformation);
 lib^.set_proc($BF33049300507223,@ps4_sceHmdReprojectionStop);
 lib^.set_proc($88634DA430E3730A,@ps4_sceHmdReprojectionUnsetDisplayBuffers);
 lib^.set_proc($66B579608A83D3D2,@ps4_sceHmdReprojectionFinalize);
 lib^.set_proc($99DC856DA263EBA3,@ps4_sceHmdReprojectionClearUserEventStart);
 lib^.set_proc($13E74F7E37902C72,@ps4_sceHmdReprojectionSetDisplayBuffers);
 lib^.set_proc($776839223EC4533A,@ps4_sceHmdOpen);
 lib^.set_proc($34F430605AA2D1BB,@ps4_sceHmdGetFieldOfView);
 lib^.set_proc($CFF44C20BA8FEAD1,@ps4_sceHmdTerminate);
end;

initialization
 ps4_app.RegistredPreLoad('libSceHmd.prx',@Load_libSceHmd);

end.

