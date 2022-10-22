from visidata import Sheet, BaseSheet, Canvas, TableSheet, vd

import curses

def waitForKey(timeout=200):
    scr = vd.scrFull
    scr.timeout(timeout)

    try:
        return scr.get_wch()
    except curses.error:
        return None
    finally:
        scr.timeout(vd.curses_timeout)



def unbindKeys():
    #
    # Yank and Paste
    #

    TableSheet.unbindkey('zy')
    TableSheet.unbindkey('gzy')
    TableSheet.unbindkey('y')
    TableSheet.unbindkey('gy')

    TableSheet.unbindkey('zx')
    TableSheet.unbindkey('gzx')
    TableSheet.unbindkey('x')
    TableSheet.unbindkey('gx')

    TableSheet.unbindkey('zd')
    TableSheet.unbindkey('gzd')
    TableSheet.unbindkey('d')
    TableSheet.unbindkey('gd')

    TableSheet.unbindkey('p')
    TableSheet.unbindkey('P')
    TableSheet.unbindkey('zp')

    TableSheet.unbindkey('zY')
    TableSheet.unbindkey('gzY')
    TableSheet.unbindkey('Y')
    TableSheet.unbindkey('gY')
    TableSheet.unbindkey('BUTTON2_RELEASED')
    TableSheet.unbindkey('gzP')

    TableSheet.unbindkey('zP')

    TableSheet.unbindkey('Del')
    TableSheet.unbindkey('gDel')

def bindKeys():
    #@Sheet.command('v', 'select-smart', 'smart select')
    #def select_smart(sheet):
    #    sheet.selectRow(sheet.cursorRow)
    #
    #    TableSheet.bindkey('j', 'down');
    #    # if not in visual mode, activate visual mode and select current row
    #    # while in visual mode, motions (hjkl) will trigger row selection
    #    #sheet.selectRow

    # Perhaps we need new bindings that work in both vim and vd?
    # ^Y to yank to system clipboard
    # Tab is not mapped to anything
    # g prefix in vim is for goto, :g is global
    #
    # y
    # Y
    # ^Y

    # FIXME These bindings doesn't work because they ask for type
    # 
    #TableSheet.bindkey('y', 'syscopy-cell')             # yank (copy) current cell to system clipboard (using options.clipboard_copy_cmd)                                                                            ║
    #TableSheet.bindkey('^Y', 'syscopy-cells')            # yank (copy) contents of current column from selected rows to system clipboard (using options.clipboard_copy_cmd                                            ║
    #TableSheet.bindkey('yy', 'syscopy-row')              # yank (copy) current row to system clipboard (using options.clipboard_copy_cmd)                                                                             ║
    #TableSheet.bindkey('y', 'syscopy-selected')        # yank (copy) selected rows to system clipboard (using options.clipboard_copy_cmd)                                                                           ║
    #TableSheet.bindkey('p', 'syspaste-cells')           # paste from system clipboard to region starting at cursor                                                                                                   ║
    #TableSheet.bindkey('^P', 'syspaste-cells-selected')  # paste from system clipboard to selected cells

    # Actions
    # y - yank
    # p - paste
    # d - delete/cut

    # Prefixes
    # yy - yank cell
    # yr - row
    # yc - column
    # g - goto

    #TableSheet.bindkey('v', 'stoggle-row')
    #TableSheet.bindkey('ry', 'copy-row')
    #TableSheet.bindkey('cy', 'copy-row')

    # y - copy cell, if rows selected, copy selected rows
    # ^Y - like y, but system clipboard
    # y - copy selected if there are rows selected, else copy cursorRow
    # y - copy cell
    # Y - smart row copy

    # copyCells(cursorCol, [cursorRow]); # copyCell

    @Sheet.command('y', 'copy-smart', 'smart copy')
    def copy_smart(sheet):
        k = waitForKey()

        # TODO delete vd.memory.clipval
        # TODO delete vd.memory.cliprows
        # TODO delete vd.memory.clipcols
        #

        if k == 'y': # double tap
            Sheet.copyRows(sheet, [ sheet.cursorRow ])
            vd.memory.cliptype = 'row'
        elif sheet.nSelectedRows:
            Sheet.copyRows(sheet, sheet.onlySelectedRows)
            vd.memory.cliptype = 'rows'
        else: # single tap
            Sheet.copyCells(sheet, sheet.cursorCol, [ sheet.cursorRow ])
            vd.memo("clipval", sheet.cursorCol, sheet.cursorRow)
            vd.memory.cliptype = 'cell'

    @Sheet.command('^Y', 'copy-smart-sys', 'smart copy')
    def copy_smart_sys(sheet):
        if sheet.nSelectedRows:
            Sheet.syscopyCells(sheet, sheet.visibleCols, sheet.onlySelectedRows)
        else: # single tap
            Sheet.syscopyValue(sheet, sheet.cursorDisplay)
        vd.status('sys copy')

    @Sheet.command('d', 'delete-smart', 'smart delete')
    def delete_smart(sheet):
        k = waitForKey()

        if k == 'd': # double tap
            Sheet.copyRows(sheet, [ sheet.delete_row(sheet.cursorRowIndex) ])
            sheet.defer
        elif sheet.nSelectedRows:
            Sheet.copyRows(sheet, sheet.onlySelectedRows)
            Sheet.deleteSelected(sheet)
        else: # single tap
            Sheet.copyCells(sheet, sheet.cursorCol, [ sheet.cursorRow ])
            vd.memo("clipval", sheet.cursorCol, sheet.cursorRow)
            sheet.cursorCol.setValues([ sheet.cursorRow ], None)


    # p - paste row after
    # P - paste row before
    # detect pasting row or cell?
    @Sheet.command('p', 'paste-smart', 'smart paste')
    def paste_smart(sheet):
        if vd.memory.cliptype == 'cell':
          sheet.cursorCol.setValuesTyped([sheet.cursorRow], vd.memory.clipval)
        elif vd.memory.cliptype == 'row':
          Sheet.paste_after(sheet, sheet.cursorRowIndex)
    #    k = waitForKey()
    #    vd.paste_before
    #    vd.paste_after
    #
    #    if k == 'd': # double tap
    #        Sheet.copyRows(sheet, [ sheet.delete_row(sheet.cursorRowIndex) ])
    #        sheet.defer
    #    elif sheet.nSelectedRows:
    #        Sheet.copyRows(sheet, sheet.onlySelectedRows)
    #        Sheet.deleteSelected()
    #    else: # single tap
    #        Sheet.copyCells(sheet, sheet.cursorCol, [ sheet.cursorRow ])
    #        sheet.cursorCol.setValues([ sheet.cursorRow ], None)

    #@Sheet.command('^Y', 'copy-smart-system', 'smart copy')
    #def copy_smart_system(sheet):
    #    if sheet.nSelectedRows:
    #        Sheet.syscopyRows(sheet, sheet.onlySelectedRows)
    #    else:
    #        Sheet.syscopyCells(sheet, sheet.cursorCol, [ sheet.cursorRow ])

