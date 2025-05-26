object dmconexao: Tdmconexao
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object SQlconexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\SRP2\Documents\JoseProjects\JoseMonilitoFinanc' +
        'eiro\db\Sistemafinanceiro.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 288
    Top = 208
  end
end
