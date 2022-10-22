from visidata import Sheet, TableSheet, Canvas, BaseSheet

#
# Page Down / Page Up
#

def unbindKeys():
    for sheet in [ BaseSheet, TableSheet, Canvas ]:
      sheet.unbindkey('Home')
      sheet.unbindkey('End')
      sheet.unbindkey('PgDn')
      sheet.unbindkey('PgUp')
      sheet.unbindkey('gUp')
      sheet.unbindkey('gDown')
      sheet.unbindkey('^D')
      sheet.unbindkey('^U')
      sheet.unbindkey('^F')
      sheet.unbindkey('^B')

def bindKeys():
    BaseSheet.bindkey('^D', 'go-pagedown')
    BaseSheet.bindkey('^U', 'go-pageup')
