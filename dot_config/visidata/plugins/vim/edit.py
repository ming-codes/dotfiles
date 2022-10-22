from visidata import Sheet, TableSheet, Canvas, BaseSheet

def unbindKeys():
    TableSheet.unbindkey('U')
    TableSheet.unbindkey('R')

    TableSheet.unbindkey('u')
    TableSheet.unbindkey('^R')

    TableSheet.unbindkey('e')
    TableSheet.unbindkey('i')
    TableSheet.unbindkey('.')
    # Sheet.addCommand('e', 'edit-cell', 'cursorCol.setValues([cursorRow], editCell(cursorVisibleColIndex)) if not (cursorRow is None) else fail("no rows to edit")', 'edit contents of current cell')


def bindKeys():
    TableSheet.bindkey('i', 'edit-cell')

    #
    # Undo / Redo
    #

    TableSheet.bindkey('u', 'undo-last') # undo
    TableSheet.bindkey('^R', 'redo-last') # redo

