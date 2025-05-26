unit Monolitofinanceiro.Utilitario;

interface

uses
  SysUtils, Vcl.DBGrids,Vcl.StdCtrls,System.Math;

type
  Tutilitario = class
    class function getId: string;
    class function likepesquisar(pesquisar: string; DBgrid: TDBGrid): string;
    class function fomatmoeda (aValue : Currency) : string;
    class function FormataValor(aValue :Currency; Decimais :integer = 2) :string;overload;
    class function FormataValor(aValue :string; Decimais :integer = 2) :string;overload;
    class procedure KeyPressvalor ( Sender : Tobject; var  key : char);
      class function TruncarValor(aValue :Currency; Decimais :integer = 2) : Currency;
  end;

implementation

{ Tutilitario }

class function Tutilitario.fomatmoeda(aValue: Currency): string;
begin
result := format('%m',[aValue]);
end;

class function Tutilitario.FormataValor(aValue: Currency; Decimais: integer): string;
begin
 aValue := TruncarValor(aValue, Decimais) ;
 result := Formatcurr('0.' + StringOfChar('0' , Decimais), aValue);
end;

class function Tutilitario.FormataValor(aValue: string; Decimais: integer): string;
var
Lvalor : Currency;
begin
 lvalor := 0;
 trystrtocurr(aValue, Lvalor);
 result := FormataValor(lvalor, Decimais);
end;

class function Tutilitario.getId: string;
begin
  result := tguid.newguid.tostring;
  result := stringreplace(result, '{', '', [rfreplaceall]);
  result := stringreplace(result, '}', '', [rfreplaceall]);
end;

class procedure Tutilitario.KeyPressvalor(Sender: Tobject; var key: char);
begin
 if key = FormatSettings.ThousandSeparator then
  key := FormatSettings.DecimalSeparator;

  if not  (CharInSet(key, ['0'..'9',chr(8), FormatSettings.DecimalSeparator] )) then
   key := #0;

   if (key = FormatSettings.DecimalSeparator) and (pos(key, TEdit(Sender).Text)> 0) then
   key := #0;
end;

class function Tutilitario.likepesquisar(pesquisar: string; DBgrid: TDBGrid): string;
var
  Lcontador: integer;
begin
  result := '';
  if pesquisar.trim.IsEmpty then
    exit;
  for Lcontador := 0 to Pred(DBgrid.Columns.Count) do

    result := result + DBgrid.Columns.Items[Lcontador].FieldName + ' LIKE ' +
      QuotedStr('%' + trim(pesquisar) + '%') + ' OR ';
  Result := ' AND ( ' + Copy(result, 1, length(result) - 4)+ ' ) ';

end;

class function Tutilitario.TruncarValor(aValue: Currency; Decimais: integer): Currency;
var
Lfator : Double;
begin
   Lfator := Power(10, decimais);
   result := trunc(aValue * Lfator )/ Lfator;
end;

end.
