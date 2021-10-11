unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, TeEngine, Series, ExtCtrls,
  TeeProcs, Chart, XPMan;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    StaticText1: TStaticText;
    UpDown1: TUpDown;
    Memo1: TMemo;
    Chart1: TChart;
    Series1: TLineSeries;
    BitBtn2: TBitBtn;
    XPManifest1: TXPManifest;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
const t='Введите значение';
var
    a,b,x,y: array [1..100] of real;
    n,i,j:integer;
    d:real;
    aA,bB,z:string;//для преобразования x[i] и y[i] в строки
begin {1}
n:=StrToInt(Edit1.Text);
for i:=1 to n do
begin {2}
 x[i]:=0;
 y[i]:=0;
end;  {2}//очистка массивов Х и У
memo1.Clear;series1.Clear;//очистка поля вывода и графич. области

for i:=1 to n do
begin {3}
x[i]:=StrToFloat(InputBox('Ввод Х'+IntToStr(i),t,'0'));
y[i]:=StrToFloat(InputBox('Ввод Y'+IntToStr(i),t,'0'));
 series1.AddXY(x[i],y[i]);//рисование графика
end;{3}//ввод табличных значений

j:=0;//решение
for i:=2 to n do
begin {4}
d:=x[i]-x[i-1];
if (d=0) then//если d=0
begin {5}
MessageBox(0,'Деление на 0!','Ошибка!',MB_OK+MB_ICONWarning);
exit;
end  {5}
else begin {6}
a[j]:=(y[i]-y[i-1])/d;
b[j]:=y[i-1]-a[j]*x[i-1];
if b[j]>=0 then z:='+' else z:='';
Str(a[j]:5:5,Aa);//Преобразование в строку
Str(b[j]:5:5,Bb);//Вывод результата
memo1.Lines.Add('Для интервала ('+FloatToStr(x[i-1])+';'+FloatToStr(x[i])+')');
memo1.Lines.Add(IntToStr(j)+')'+'F(x)='+Aa+'*x'+z+Bb);
memo1.Lines.Add('____________');
j:=j+1;
     end;{6}//конец
end; {4}
end; {1}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
case key of
#8,'0'..'9':;
#13:BitBtn1.Click;
else MessageBox(0,'Введите нормальные данные!','Ошибка!',MB_OK+MB_ICONWarning);
key:=#8;end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
MessageBox(0,'Copyright (C) 2008 БФ ГОУ ВПО СибГУТИ'+#13+'Бабушкин Алексей гр. ПОВТ-271.','Об авторе',MB_OK+MB_ICONINFORMATION);
end;

end.
