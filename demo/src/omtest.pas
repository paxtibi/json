unit omtest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fgl;

type
  TDynIntegerArray = array of integer;

  { TMinimalObject }

  TMinimalObject = class(TObject)
  private
    FaProperty: integer;
    procedure SetaProperty(AValue: integer);
  published
    property aProperty: integer read FaProperty write SetaProperty;
  end;

  { TSimpleObject }

  TSimpleObject = class(TObject)
  private
    FlastUpdate: TDateTime;
    FPropertyFloat: single;
    FPropertyInteger: integer;
    FPropertyString: string;
    FreturnCodes: TStringArray;
    FreturnValues: TDynIntegerArray;
    function GetReturnCodes: TStringArray;
    procedure SetlastUpdate(AValue: TDateTime);
    procedure SetPropertyFloat(AValue: single);
    procedure SetPropertyInteger(AValue: integer);
    procedure SetPropertyString(AValue: string);
    procedure SetreturnCodes(AValue: TStringArray);
    procedure SetreturnValues(AValue: TDynIntegerArray);
  public
    constructor Create;
    function ToString: ansistring; override;
  published
    property PropertyString: string read FPropertyString write SetPropertyString;
    property PropertyInteger: integer read FPropertyInteger write SetPropertyInteger;
    property PropertyFloat: single read FPropertyFloat write SetPropertyFloat;
    property returnCodes: TStringArray read FReturnCodes write SetReturnCodes;
    property returnValues: TDynIntegerArray read FreturnValues write SetreturnValues;
    property lastUpdate: TDateTime read FlastUpdate write SetlastUpdate;
  end;

  TMinimalObjectList = specialize TFPGObjectList<TMinimalObject>;

  TEnumProperty = (enum1, enum2);

  { TComplexObject }

  TComplexObject = class(TObject)
  private
    FSimpleObject: TSimpleObject;
    FEnumProperty: TEnumProperty;
    procedure SetSimpleObject(AValue: TSimpleObject);
    procedure SetEnumProperty(AValue: TEnumProperty);
  public
    function ToString: ansistring; override;
  published
    property SimpleObject: TSimpleObject read FSimpleObject write SetSimpleObject;
    property EnumProperty: TEnumProperty read FEnumProperty write SetEnumProperty;
  end;

  { TACollectionItem }

  TACollectionItem = class(TCollectionItem)
  private
    FaProperty: integer;
    FAPropery: integer;
    procedure SetAProperty(AValue: integer);
    procedure SetAPropery(AValue: integer);
  public
    constructor Create(ACollection: TCollection); override;
  published
    property aProperty: integer read FAPropery write SetAPropery;
  end;

  { TACollection }

  TACollection = class(TCollection)
  public
    constructor Create; reintroduce;
    function Add: TCollectionItem;
  end;

implementation

uses
  paxjs, typinfo;

{ TMinimalObject }

procedure TMinimalObject.SetaProperty(AValue: integer);
begin
  if FaProperty = AValue then
    Exit;
  FaProperty := AValue;
end;

{ TACollectionItem }

procedure TACollectionItem.SetAProperty(AValue: integer);
begin
  if FAPropery = AValue then
    Exit;
  FAPropery := AValue;
end;

procedure TACollectionItem.SetAPropery(AValue: integer);
begin
  if FAPropery = AValue then
    Exit;
  FAPropery := AValue;
end;

constructor TACollectionItem.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FAPropery := ID;
end;

{ TACollection }

constructor TACollection.Create;
begin
  inherited Create(TACollectionItem);
end;

function TACollection.Add: TCollectionItem;
begin
  Result := inherited Add;
end;


{ TComplexObject }

procedure TComplexObject.SetSimpleObject(AValue: TSimpleObject);
begin
  if FSimpleObject = AValue then
    Exit;
  FSimpleObject := AValue;
end;

procedure TComplexObject.SetEnumProperty(AValue: TEnumProperty);
begin
  if FEnumProperty = AValue then
    Exit;
  FEnumProperty := AValue;
end;


function TComplexObject.ToString: ansistring;
begin
  result := JSON.stringify(Self);
end;

{ TSimpleObject }

procedure TSimpleObject.SetPropertyString(AValue: string);
begin
  if FPropertyString = AValue then
    Exit;
  FPropertyString := AValue;
end;

procedure TSimpleObject.SetreturnCodes(AValue: TStringArray);
begin
  if FreturnCodes = AValue then
    Exit;
  FreturnCodes := AValue;
end;

procedure TSimpleObject.SetreturnValues(AValue: TDynIntegerArray);
begin
  if FreturnValues = AValue then
    Exit;
  FreturnValues := AValue;
end;

constructor TSimpleObject.Create;
begin
  SetLength(FreturnCodes, 0);
  setlength(FreturnValues, 0);
  FlastUpdate := Now;
end;

function TSimpleObject.ToString: ansistring;
begin
  result := JSON.stringify(Self);
end;

procedure TSimpleObject.SetPropertyInteger(AValue: integer);
begin
  if FPropertyInteger = AValue then
    Exit;
  FPropertyInteger := AValue;
end;

procedure TSimpleObject.SetPropertyFloat(AValue: single);
begin
  if FpropertyFloat = AValue then
    Exit;
  FpropertyFloat := AValue;
end;

function TSimpleObject.GetReturnCodes: TStringArray;
begin
  result := FreturnCodes;
end;

procedure TSimpleObject.SetlastUpdate(AValue: TDateTime);
begin
  if FlastUpdate = AValue then
    Exit;
  FlastUpdate := AValue;
end;

initialization


end.
