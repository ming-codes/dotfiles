from visidata import vd #, BaseSheet, Canvas, ChoiceSheet, ColumnsSheet, CommandLog, CommandLogJsonl, CrosswordSheet, CrosswordsSheet, DescribeSheet, DirSheet, EmailSheet, FreqTableSheet, GeoJSONMap, GeoJSONSheet, Hdf5ObjSheet, HelpSheet, IndexSheet, InvertedCanvas, MbtilesSheet, OptionsSheet, PNGSheet, PandasFreqTableSheet, PandasSheet, PbfSheet, PcapSheet, Plotter, PluginsSheet, ProfileSheet, ProfileStatsSheet, PyobjSheet, ShapeMap, ShapeSheet, SheetsSheet, SqliteIndexSheet, TableSheet, TextCanvas, TextSheet, ThreadsSheet, XmlSheet, ZipSheet
from visidata.loaders.geojson import GeoJSONSheet

def unbind_all_keys():
  for key in vd.bindkeys.keys():
    for cls in [ GeoJSONSheet ]:
      vd.bindkeys.unset(vd.prettykeys(key), cls)

#def bind_basic_keys():
#  BaseSheet.bindkey('', 'help-commands')		zCtrl+H	list commands and keybindings available on current sheet
#  BaseSheet.bindkey('', 'help-commands-all')	help-commands-all	gzCtrl+H	list commands and keybindings for all sheet types
#  BaseSheet.bindkey('', 'help-search')	help-search		search through command longnames with search terms
